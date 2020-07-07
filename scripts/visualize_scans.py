#!/usr/bin/env python3
# @file      visualize_scans.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved

import glob
import os
import time

import open3d as o3d


def main():
    dataset = os.path.join(os.getcwd(), '')
    print("Rendering scans from  :", dataset)
    scan_names = sorted(glob.glob(dataset + '*.ply'))

    # Now it's time to create your visualizer
    vis = o3d.visualization.Visualizer()
    vis.create_window(width=1920, height=1080)
    # Add geometry
    cloud = o3d.io.read_point_cloud(scan_names[0])
    vis.add_geometry(cloud)

    # sanity check
    ctr = vis.get_view_control()
    print(" >>> Press [q] to continue <<<")
    vis.run()

    for scan in scan_names:
        vis.clear_geometries()
        vis.add_geometry(o3d.io.read_point_cloud(scan))
        vis.poll_events()
        vis.update_renderer()
        time_delay = 20E-3
        time.sleep(time_delay)

    vis.destroy_window()


if __name__ == "__main__":
    main()
