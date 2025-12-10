#!/usr/bin/env python

"""Clone repos from vimpackages.txt into vim's plugin directory."""

import os
import errno
from os.path import dirname, abspath
import subprocess
import argparse

BASE_DIR = dirname(dirname(abspath(__file__)))
LIST_FILE = os.path.join(BASE_DIR, "vimpackages.txt")
HOME = os.environ['HOME']
TARGET_DIR = os.path.join(HOME, '.vim/pack/default/start')


def cloneRepo(repoUrl, dryRun):
    repoUrl, *comments = repoUrl.split(' # ', 1)
    repoUrl = repoUrl.strip()
    if len(repoUrl) == 0 or repoUrl[0] == '#':
        return
    if repoUrl[-4:] == '.git':
        repoUrl = repoUrl[:-4]
    if repoUrl[-1] == '/':
        repoUrl = repoUrl[:-1]
    repoName = repoUrl.rsplit('/', 1)[-1]

    if os.path.exists(repoName):
        print('repo {} already exists'.format(repoName))
    else:
        command = ['git', 'clone', '--recursive', '--depth=1', repoUrl]
        if dryRun:
            print('$', ' '.join(command))
        else:
            subprocess.check_call(command)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dry-run', action='store_true', default=False,
        help='output commands instead of running them')
    args = parser.parse_args()

    with open(LIST_FILE) as fp:
        repoUrls = fp.readlines()

    if args.dry_run:
        print('$ mkdir -p', TARGET_DIR)
        print('$ cd', TARGET_DIR)
    os.makedirs(TARGET_DIR, exist_ok=True)
    os.chdir(TARGET_DIR)

    for repoUrl in repoUrls:
        cloneRepo(repoUrl, args.dry_run)


if __name__ == '__main__':
    main()
