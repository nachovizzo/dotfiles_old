#!/usr/bin/env python3
# @file      print_geometry_type.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
import click
from plyfile import PlyData


def is_mesh_obj_info(header):
    for elem in header.obj_info:
        if 'is_mesh' in elem:
            return elem.split(' ')[1] == '1'
    return False


def is_mesh(filename):
    with open(filename, 'rb') as ply:
        header = PlyData._parse_header(ply)
        # Some ASCII PLY has this attribute('is_mesh'), it's the first to detect
        if 'is_mesh' in header.header:
            return is_mesh_obj_info(header)
        # If not, having 'face' means that there are triangles in the geometry
        if 'face' in header:
            return header['face'].count != 0
    # Worst case, this attribute is mostly used in meshes(but could also be in
    # pointclouds)
    return 'vertex_indices' in header.header


@click.command()
@click.argument('filename', type=click.Path(exists=True))
def main(filename):
    print("mesh") if is_mesh(filename) else print("pointcloud")


if __name__ == "__main__":
    main()
