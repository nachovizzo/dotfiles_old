#!/usr/bin/env python3
# Based onhttps://askubuntu.com/a/868001
import subprocess
from typing import List


def toggle_screen():
    """This simple script can be used to toglle ON/OFF the screens of your
    system."""

    # Get all system screens
    screens = [
        l.split()[0]
        for l in subprocess.check_output("xrandr").decode("utf-8").splitlines()
        if " connected" in l
    ]

    # Get a floating point value representing the current screen brightness
    brightness = float(
        [
            l.split()[-1]
            for l in subprocess.check_output(["xrandr", "--verbose"])
            .decode("utf-8")
            .splitlines()
            if "Brightness" in l
        ][0]
    )

    # Toggle ON/OFF the screen
    screen_is_on = brightness > 0.0
    for s in screens:
        subprocess.Popen(
            ["xrandr", "--output", s, "--brightness", str(0.0 if screen_is_on else 1.0)]
        )


if __name__ == "__main__":
    toggle_screen()
