#!/bin/bash

GRID_A="$1"
GRID_B="$2"

vdb_print -l $GRID_A > /tmp/grid_a.txt
vdb_print -l $GRID_B > /tmp/grid_b.txt

meld /tmp/grid_a.txt /tmp/grid_b.txt

rm /tmp/grid_a.txt
rm /tmp/grid_b.txt
