#!/usr/bin/env python3
# @file      extract_viewpoint_from_clipboard.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
import json
import sys

import numpy as np
import pyperclip


def copy_viewpoint_to_clipboard():
    clipboard = pyperclip.paste()

    if 'ViewTrajectory' not in clipboard:
        print('Copy the viewpoint from an Open3D canvas')
        sys.exit(1)

    options = json.loads(clipboard)
    trajectory = options['trajectory'][0]

    # Get the trajectory parameters in a more human readable factor
    resolution = 3
    front = list(np.asarray(trajectory['front']).round(resolution))
    lookat = list(np.asarray(trajectory['lookat']).round(resolution))
    up = list(np.asarray(trajectory['up']).round(resolution))
    zoom = np.asarray(trajectory['zoom'])

    # Put this into the clipboard
    output = """front={front},
    lookat={lookat},
    up={up},
    zoom={zoom}"""
    pyperclip.copy(output.format(front=front,
                                 lookat=lookat,
                                 up=up,
                                 zoom=zoom))

    print("ViewTrajectory copied to the system clipboard")


if __name__ == "__main__":
    copy_viewpoint_to_clipboard()
