#!/usr/bin/env python3
# @file      compute_normals.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2019 Ignacio Vizzo, all rights reserved

import glob

import numpy as np

import open3d as o3d


def main():
    for scan in glob.glob('*.ply'):
        print("Computing normals for " + scan)
        pcd = o3d.io.read_point_cloud(scan)
        points = np.asarray(pcd.points)
        normals = points / np.linalg.norm(points)
        pcd.normals = o3d.utility.Vector3dVector(-normals)
        o3d.io.write_point_cloud(scan, pcd)


if __name__ == "__main__":
    main()
