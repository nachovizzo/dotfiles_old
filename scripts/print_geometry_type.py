#!/usr/bin/env python3
# @file      print_geometry_type.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
import click
from plyfile import PlyData


@click.command()
@click.argument('filename', type=click.File('rb'))
def main(filename):
    mesh = "vertex_indices" in PlyData._parse_header(filename).header
    print("mesh") if mesh else print("pointcloud")


if __name__ == "__main__":
    main()
