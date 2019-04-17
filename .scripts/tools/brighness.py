#!/usr/bin/python

import sys

#script usage
def usage():
    sys.stderr.write("usage: " + sys.argv[0] + " x" + "\n")
    sys.stderr.write("x belongs to (-100,100] \n")

# function guarantees not to go bellow 5% brighness and above max_brighness
def limit(target, max_brighness):
    lower_limit=max(target, max_brighness/40) # above max_brighness/5
    upper_limit=min(lower_limit, max_brighness) # below max_brighness
    return upper_limit

# if no argument early exit
if len(sys.argv) < 2:
    usage()
    syst.exit()

# percentage increase/decrease from command line
percentage_delta=int(sys.argv[1])

# abort if percentage is not within acceptable range
if -100 > percentage_delta or 100 < percentage_delta:
    usage()
    syst.exit()


#max_brighness
max_brighness=120000
with open("/sys/class/backlight/intel_backlight/max_brightness") as file_max:
    max_brighness = int(file_max.read())

#One percent
one_percent = max_brighness/100

# compute increase/decrease in absolute value
delta=one_percent*percentage_delta

current=max_brighness
with open("/sys/class/backlight/intel_backlight/brightness") as file_max:
    current = int(file_max.read())

# compute target value
target=limit(current+delta, max_brighness)


with open ("/sys/class/backlight/intel_backlight/brightness", "w") as target_file:
    target_file.write(str(target))
