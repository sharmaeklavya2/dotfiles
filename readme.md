# dotfiles

Tested on macOS Tahoe. Will probably work on Linux too.

Run `scripts/make_links.py` to create symbolic links to dotfiles in the home directory.
(Run `scripts/make_links.py --help` to list command-line options.)
Alternatively, you can copy the files in `dotfiles` to your home directory,
but then you'll lose the ability to version-control them.

Change the name and email in `.gitconfig`.

## Vim

My `.vimrc` tries to detect whether the OS is using dark mode,
and then sets dark mode in vim (`set background=dark`) accordingly.
To do this detection, it uses the
[`darkdetect`](https://github.com/albertosottile/darkdetect) python module.
If this module is not installed, `.vimrc` falls back to using dark mode in vim.
If you change the system's dark/light mode while vim is running,
you would have to either restart vim, or run `:call SetBackground()`.

Running `scripts/get_vim_packages.py` will clone all git repositories
mentioned in `vimpackages.txt` into `~/.vim/pack/default/start`.
For some repositories, you may need to run additional commands.
E.g., for `coc.nvim`, you would have to run

    cd ~/.vim/pack/default/start/coc.nvim
    npm ci

These additional commands are mentioned in comments in `vimpackages.txt`.

`ekuVimPlugin` is my custom vim plugin for miscellaneous stuff.
Symlink it into `~/.vim/pack/default/start`.
