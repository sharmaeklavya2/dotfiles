# dotfiles

Tested on Ubuntu 18.04 and macOS Mojave.

Running `scripts/make_links.py` will create symbolic links to files in the
`dotfiles` directory and place them in the `_links` directory.
Copy those symlinks and paste them in your home directory.
Alternatively, you can copy all files in `dotfiles` to your home directory,
but then you'll lose the ability to version-control them.

Change the name and email in `.gitconfig` and `.hgrc`.

Running `scripts/get_vim_packages.py` will create a `vim_bundle` directory
and clone all repositories mentioned in `vimpackages.txt`.
Symlink that directory to `~/.vim/bundle`.
