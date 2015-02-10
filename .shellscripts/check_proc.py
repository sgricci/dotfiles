#!/usr/bin/env python

import subprocess
import sys

name = sys.argv[1];
process = subprocess.Popen("".join(['ps -A | grep ', name]), stdout=subprocess.PIPE, shell=True)
out, err = process.communicate()

if (len(out) > 0):
	print('Yes')
else:
	print('No')
