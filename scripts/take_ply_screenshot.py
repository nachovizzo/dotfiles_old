#!/usr/bin/env python3
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved

import sys
import click
import matplotlib.pyplot as plt
import numpy as np
import open3d as o3d
from plyfile import PlyData


def take_screenshot(ply, filename, options=None, camera=None):
    def save_screenshoot(vis):
        image = vis.capture_screen_float_buffer(False)
        plt.imsave(filename + '.jpg', np.asarray(image), dpi=1)
        sys.exit(0)

    vis = o3d.visualization.Visualizer()

    if camera:
        viewpoint = o3d.io.read_pinhole_camera_parameters(camera)
        vis.create_window(
            width=viewpoint.intrinsic.width,
            height=viewpoint.intrinsic.height)
        ctr = vis.get_view_control()
        ctr.convert_from_pinhole_camera_parameters(viewpoint)
    else:
        vis.create_window(width=960, height=1080)

    if options:
        vis.get_render_option().load_from_json(options)

    vis.register_animation_callback(save_screenshoot)
    vis.add_geometry(ply)
    vis.run()
    vis.destroy_window()


def is_mesh(filename):
    with open(filename, 'rb') as ply:
        header = PlyData._parse_header(ply)
        if 'face' in header:
            return header['face'].count != 0
    return 'vertex_indices' in header.header


@click.command()
@click.option('--file',
              '-f',
              type=click.Path(exists=True),
              required=True,
              help='The full path to the mesh to visualize')
@click.option('--out',
              '-o',
              required=True,
              default='screenshot',
              help='Where to store the screenshot')
def main(file, out):
    # TODO: Add options and camera
    if is_mesh(file):
        mesh = o3d.io.read_triangle_mesh(file)
        mesh.compute_triangle_normals()
        mesh.compute_vertex_normals()
        take_screenshot(mesh, out)
    else:
        pcd = o3d.io.read_point_cloud(file)
        take_screenshot(pcd, out)


if __name__ == "__main__":
    o3d.utility.set_verbosity_level(o3d.utility.VerbosityLevel.Error)
    main()
