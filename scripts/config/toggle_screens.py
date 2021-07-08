#!/usr/bin/env python3
# Based onhttps://askubuntu.com/a/868001
import subprocess
from typing import List
import argh


def get_screens(idx: int) -> List:
    screens = [
        l.split()[0]
        for l in subprocess.check_output("xrandr").decode("utf-8").splitlines()
        if " connected" in l
    ]
    return [screens[idx]] if idx != -1 else screens


def get_brightness(idx: int) -> List:
    """ Get a floating point value representing the current screen brightness """
    brightness = [
        float(l.split()[-1])
        for l in subprocess.check_output(["xrandr", "--verbose"])
        .decode("utf-8")
        .splitlines()
        if "Brightness" in l
    ]
    return [brightness[idx]] if idx != -1 else brightness


def toggle_screens(idx: int = -1):
    """
    This simple script can be used to toglle ON/OFF the screens of your system.

    Toggle a particular screen if idx is specified."""
    screens = get_screens(idx)
    brightness = get_brightness(idx)
    for s, b in zip(screens, brightness):
        subprocess.Popen(["xrandr", "--output", s, "--brightness", str(float(not (b)))])


if __name__ == "__main__":
    argh.dispatch_command(toggle_screens)
