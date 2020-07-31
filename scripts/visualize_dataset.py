#!/usr/bin/env python3
# @file      visualize_dataset.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved

import glob
import os
import shutil
import subprocess
import time

import click
import matplotlib.pyplot as plt
import numpy as np
import open3d as o3d
from tqdm import trange


def sendmessage(message):
    subprocess.Popen(['notify-send', message])
    return


def cleanup_screenshots():
    """Everytime we capture the camera information, Open3D also outputs a .png
    file, in this function we aim to only delete the file we just genreated."""
    png_files = glob.glob("ScreenCapture*.png")

    if not png_files:
        return

    last_screenshot = max(png_files, key=os.path.getctime)
    last_ts = os.path.getctime(last_screenshot)  # timestamp of the screenshot
    elapsed_time = os.times()[-1]                # time since we started
    start_ts = time.time() - elapsed_time        # timestamp script started
    if last_ts > start_ts:
        # This means that the screenshot was taken after this script started.
        os.remove(last_screenshot)


def collect_json(pattern, tmp_dir=None):
    """Helper to collect the .json files generated by the renderer."""
    json_files = glob.glob(pattern)

    if not json_files:
        return None

    json_file = max(json_files, key=os.path.getctime)

    # Move files to temp directory
    if tmp_dir:
        json_file = shutil.move(json_file, os.path.join(tmp_dir, json_file))

    return json_file


def collect_options_and_camera_position(use_last=False):
    # Create an empty temporary directory
    tmp_dir = '/tmp/render_files/'
    os.makedirs(tmp_dir, exist_ok=True)

    # This is how the Open3D files looks when exported from the visualizer
    render_pattern = "RenderOption*.json"
    camera_pattern = "ScreenCamera*.json"

    if use_last:
        # Take whatever was the last json files used in the /tmp directory
        render_pattern = os.path.join(tmp_dir, "RenderOption*.json")
        camera_pattern = os.path.join(tmp_dir, "ScreenCamera*.json")

    option_file = collect_json(render_pattern, tmp_dir)
    camera_file = collect_json(camera_pattern, tmp_dir)

    # cleanup the taken screenshot
    cleanup_screenshots()
    return option_file, camera_file


def get_filename(path, idx):
    filenames = sorted(glob.glob(path + '*.ply'))
    return int(filenames[idx].split('.')[0].split('/')[-1])


def last_file(path):
    return get_filename(path, -1)


def first_file(path):
    return get_filename(path, 0)


@click.command()
@click.option('--dataset',
              '-d',
              type=click.Path(exists=True),
              required=False,
              help='Full path to dataset location [KITTI format]')
@click.option('--sequence',
              '-s',
              type=str,
              default="00",
              help='Sequence number [KITTI format]')
@click.option('--start',
              type=int,
              default=0,
              help='The first scan to visualize')
@click.option('--end',
              type=int,
              default=None,
              help='The Last scan to visualize')
@click.option('--delay',
              type=float,
              default=20E-3,
              help='How much delay between each scan visualization')
@click.option('--use_last',
              is_flag=True,
              default=False,
              help='Use the last camera/render options')
@click.option('--capture',
              is_flag=True,
              default=False,
              help='Take a screenshot of the scene')
def main(dataset, sequence, start, end, delay, use_last, capture):
    """Visualize all the scans of a given dataset, with the capability of
    selecting a viewpoint and some rendering options.

    This script was designed with the KITTI dataset in mind and it's mostly
    used to visualize that data, when it comes in .ply format. But it could be
    also used for other types of datasets.

    By default it will try to read all the .ply files on the current directory,
    or on the specified dataset directory + a given sequence. If not dataset is
    specified then the sequence option is ignored

    Viewpoint and Rendering Options: You can move the mouse to select the
    viewpoint that will be used across all the visualizations, and you can also
    change the rendering options, like the point size, colors, etc. This script
    is better understood when trying some examples. IT's safe to use and
    doesn't change any of your data.

    If capture flag is set, a screenshot of each visualization is taken and
    saved to the current directory.
    """
    if dataset:
        scans_path = os.path.join(dataset, 'sequences', sequence, 'velodyne/')
    else:
        scans_path = os.path.join(os.getcwd(), '')

    def id_to_file(num):
        scan_id = str(num).zfill(6)
        scan_file = os.path.join(scans_path, scan_id + '.ply')
        return scan_file, scan_id

    scans_path = os.path.join(dataset, 'sequences', sequence, 'velodyne/')

    # Calculate the amount of scans to visualize
    end = last_file(scans_path) if not end else end
    start = first_file(scans_path) if not start else start
    assert end > start
    print("Rendering scans [{s},{e}] from:{d}".format(s=start,
                                                      e=end,
                                                      d=scans_path))

    # Now it's time to create your visualizer
    vis = o3d.visualization.Visualizer()
    vis.create_window()
    first_scan = o3d.io.read_point_cloud(id_to_file(start)[0])
    vis.add_geometry(first_scan)

    # If you want a new camera/render options you should pick by hand:
    if not use_last:
        msg = 'Select a view point and render options, then press "P + 0"'
        print(' >>>', msg, ' <<<')
        sendmessage(msg)
        vis.run()

    # Collect the options and perform a sanity check before proceeding
    render_options, camera_file = collect_options_and_camera_position(use_last)
    if not render_options and not camera_file:
        print("[WARNING] No viewpoint/options provided, using defaults")
        camera = o3d.camera.PinholeCameraParameters()
    else:
        camera = o3d.io.read_pinhole_camera_parameters(camera_file)
        vis.get_render_option().load_from_json(render_options)
    ctr = vis.get_view_control()
    ctr.convert_from_pinhole_camera_parameters(camera)

    # sanity check
    print(" >>> Press [q] to continue <<<")
    vis.run()

    for idx in trange(start, end):
        scan_file, scan_id = id_to_file(idx)
        scan = o3d.io.read_point_cloud(scan_file)
        vis.clear_geometries()
        vis.add_geometry(scan)
        ctr.convert_from_pinhole_camera_parameters(camera)
        vis.poll_events()
        vis.update_renderer()
        vis.update_renderer()
        if capture:
            # Take a screenshot of the scene, use KITTI format for naming
            image = vis.capture_screen_float_buffer(False)
            filename = os.path.join('results', scan_id + ".png")
            plt.imsave(filename, np.asarray(image), dpi=1)
        else:
            time.sleep(delay)

    vis.destroy_window()


if __name__ == "__main__":
    main()
