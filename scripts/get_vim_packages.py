#!/usr/bin/env python

import os
import errno
from os.path import dirname, abspath
import subprocess

BASE_DIR = dirname(dirname(abspath(__file__)))
LIST_FILE = os.path.join(BASE_DIR, "vimpackages.txt")
TARGET_DIR = os.path.join(BASE_DIR, ".vim", "bundle")

repo_urls = open(LIST_FILE).read().split()

try:
    os.makedirs(TARGET_DIR)
except OSError as e:
    if e.errno != errno.EEXIST or not os.path.isdir(TARGET_DIR):
        raise

os.chdir(TARGET_DIR)

print("Cloning repositories ...")
for repo_url in repo_urls:
    subprocess.check_call(['git', 'clone', '--depth=1', repo_url])
