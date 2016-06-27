#!/usr/bin/env python

import os
import errno
from os.path import dirname, abspath
import subprocess

BASE_DIR = dirname(dirname(abspath(__file__)))
SOURCE_DIR = os.path.join(BASE_DIR, 'dotfiles')
TARGET_DIR = os.path.join(BASE_DIR, '_links')

try:
    os.mkdir(TARGET_DIR)
except OSError as e:
    if e.errno != errno.EEXIST or not os.path.isdir(TARGET_DIR):
        raise

for fname in os.listdir(SOURCE_DIR):
    source = os.path.join(SOURCE_DIR, fname)
    target = os.path.join(TARGET_DIR, fname)
    subprocess.check_call(["ln", "-nsf", source, target])
