#!/bin/bash

xrandr | grep -e "\sconnected" | grep -v eDP | awk '{print $1}'
