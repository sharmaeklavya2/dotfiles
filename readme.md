# dotfiles

Tested on macOS Tahoe. Will probably work on Linux too.

Run `scripts/make_links.py` to create symbolic links to dotfiles in the home directory.
(Run `scripts/make_links.py --help` to list command-line options.)
Alternatively, you can copy the files in `dotfiles` to your home directory,
but then you'll lose the ability to version-control them.

Change the name and email in `.gitconfig`.

Running `scripts/get_vim_packages.py` will clone all git repositories
mentioned in `vimpackages.txt` into `~/.vim/pack/default/start`.
For some repositories, you may need to run additional commands, e.g., switching to a different branch.
See the comments in `vimpackages.txt` for more info.
