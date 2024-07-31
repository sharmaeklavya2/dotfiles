#!/usr/bin/env python

"""Symlink dotfiles to the home directory."""

from __future__ import print_function
import sys
import os
import errno
from os.path import dirname, abspath
from os.path import join as pjoin
import argparse


def makeLink(src, dst, dryRun=False):
    if dryRun:
        print('> ln -s', src, dst)
    else:
        try:
            os.symlink(src, dst)
            pass
        except OSError as e:
            if e.errno != errno.EEXIST or not os.path.islink(dst) or src != os.readlink(dst):
                print('{}: could not symlink {} to {}'.format(e.strerror, src, dst), file=sys.stderr)


def makeAllLinks(sourceDir, targetDir, linkDirs, dryRun=False):
    """Finds all files (not directories) in sourceDir and makes symlinks to them in targetDir."""
    if dryRun:
        print('> mkdir', targetDir)
    else:
        try:
            os.mkdir(targetDir)
            pass
        except OSError as e:
            if e.errno != errno.EEXIST or not os.path.isdir(targetDir):
                raise

    for fname in os.listdir(sourceDir):
        sfpath = pjoin(sourceDir, fname)
        tfpath = pjoin(targetDir, fname)
        if linkDirs or os.path.isfile(sfpath):
            makeLink(sfpath, tfpath, dryRun)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--dry-run', action='store_true', default=False,
        help='output commands instead of running them')
    parser.add_argument('-o', help='destination directory (default: $HOME)')
    args = parser.parse_args()

    dotfilesDir = pjoin(dirname(dirname(abspath(__file__))), 'dotfiles')
    outDir = args.o or os.environ['HOME']

    makeAllLinks(dotfilesDir, outDir, linkDirs=False, dryRun=args.dry_run)
    makeLink(pjoin(dotfilesDir, '.eku'), pjoin(outDir, '.eku'), dryRun=args.dry_run)
    makeAllLinks(pjoin(dotfilesDir, '.config'), pjoin(outDir, '.config'), linkDirs=True, dryRun=args.dry_run)


if __name__ == '__main__':
    main()
