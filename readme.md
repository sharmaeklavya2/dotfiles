# dotfiles

Tested on macOS Sonoma. Should work on Linux too.

Run `scripts/make_links.py` to create symbolic links to dotfiles in the home directory.
(Run `scripts/make_links.py --help` to list command-line options.)
Alternatively, you can copy the files in `dotfiles` to your home directory,
but then you'll lose the ability to version-control them.

Change the name and email in `.gitconfig` and `.hgrc`.

Running `scripts/get_vim_packages.py` will create a `vim_packages` directory
and clone all repositories mentioned in `vimpackages.txt`.
Copy or symlink that directory at `~/.vim/pack/default/start`.
