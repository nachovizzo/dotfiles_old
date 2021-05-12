#!/usr/bin/env python3
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved

import os
import sys

import click
import matplotlib.pyplot as plt
import numpy as np
import open3d as o3d

from print_geometry_type import is_mesh


def visualize_geometry(ply, filename, headless, options=None, camera=None):
    def save_screenshoot(vis):
        image = vis.capture_screen_float_buffer(False)
        plt.imsave(filename + ".jpg", np.asarray(image), dpi=1)
        sys.exit(0)

    vis = o3d.visualization.Visualizer()

    if camera:
        viewpoint = o3d.io.read_pinhole_camera_parameters(camera)
        vis.create_window(
            width=viewpoint.intrinsic.width, height=viewpoint.intrinsic.height
        )
        ctr = vis.get_view_control()
        ctr.convert_from_pinhole_camera_parameters(viewpoint)
    else:
        # Use the width and height of a standard i3wm + split + gaps
        vis.create_window(width=944, height=1035)

    if options:
        vis.get_render_option().load_from_json(options)

    if headless:
        vis.register_animation_callback(save_screenshoot)

    vis.add_geometry(ply)
    vis.run()
    vis.destroy_window()


@click.command()
@click.argument("filename", type=click.Path(exists=True))
@click.option(
    "--out",
    "-o",
    required=True,
    default="screenshot",
    help="Where to store the screenshot",
)
@click.option("--headless", is_flag=True, default=False, help="Headless rendering mode")
def main(filename, out, headless):
    file_extension = os.path.splitext(filename)[-1]
    if file_extension == ".pcd":
        pcd = o3d.io.read_point_cloud(filename)
        visualize_geometry(pcd, out, headless)
    elif file_extension == ".obj" or is_mesh(filename):
        mesh = o3d.io.read_triangle_mesh(filename)
        mesh.compute_triangle_normals()
        mesh.compute_vertex_normals()
        visualize_geometry(mesh, out, headless)
    else:
        pcd = o3d.io.read_point_cloud(filename)
        visualize_geometry(pcd, out, headless)


if __name__ == "__main__":
    o3d.utility.set_verbosity_level(o3d.utility.VerbosityLevel.Error)
    main()
