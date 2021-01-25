#!/usr/bin/env python3
# @file      check_gpu_status.py
# @author    Ignacio Vizzo     [ivizzo@uni-bonn.de]
#
# Copyright (c) 2020 Ignacio Vizzo, all rights reserved
#
# Note: Big part of this script has been partially inspired by:
# https://github.com/mseitzer/gpu-monitor

import click
import sys

from gpu_monitor import run_nvidiasmi_remote
from gpu_monitor import main as gpu_monitor

ipb_hostnames = [
    'ipb201',
    'ipb202',
    'ipb203',
    'ipb204',
    'ipb221',
    'ipb222',
    'ipb223',
    'ipb224',
    'ipb-devcube-0',
    'ipb-devcube-1',
    'ipb-devcube-3',
]


@click.command()
@click.argument('extra_hosts', nargs=-1, type=str)
@click.option('--all', is_flag=True, help='Use ipb hosts')
@click.option('--verbose', '-v', is_flag=True, help='Run nvidia-smi')
def main(verbose, extra_hosts, all):
    """
    This utility allows you to check the current overload of the GPU's at the
    ipb-lab. It comes with a predefined set of host names that you are very
    welcome to change as you please.

    This script assumes that all the hosts that you specified are part of the
    known hosts of your system. This could be done via the /etc/hosts file or
    by adding the hosts to your $HOME/.ssh/config file. For more tricks about
    this, just ask Nacho.

    The script has only two functionalities for now. The default one is to
    search for free GPU's at the lab. The second one(--verbose) is to actually
    see what's going on the GPU's by running nvidia-smi on each of those.

    Your typical usage would be something like:

    \b
    $ ./check_gpu_status.py ipb24 ipb25 --all # append to ipb_hostnames


    Where ipb24, and ipb25 are hosts that are not contianed in the glorified
    host lists.

    If you wish to only check the hosts you specify

    \b
    $ ./check_gpu_status.py ipb24 ipb25 

    """
    if all or not extra_hosts:
        hostnames = ipb_hostnames + list(extra_hosts)
    else:
        hostnames = list(extra_hosts)
    if not hostnames:
        print("[ERROR] You should specify at least one hostname")
        sys.exit(1)
    print(80*'-')
    print("Hostnames to be analyed:", *hostnames, sep='\n')
    print(80*'-')
    if verbose:
        print("Running nvidia-smi an all specified hosts")
        for host in hostnames:
            print("+{0:-^77}+".format(host))
            print(run_nvidiasmi_remote(host))
    else:
        print("Running gpu_monitor, this will take some time...")
        gpu_monitor(['-l', *hostnames])


if __name__ == "__main__":
    main()
