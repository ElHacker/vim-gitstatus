# vim-gitstatus.vim

vim-gitstatus.vim is a plugin for listing all the file paths that have
differences between git's index file and the current HEAD commit.

The modified and new file paths show up in vim's quickfix.

### Demo

![GitStatus demo](demo.gif)

### Requirements
Must have git previously installed.

### Installation

Install using your favorite package manager, or use Vim's building
package support:

    mkdir -p ~/.vim/pack/elhacker/start
    cd ~/.vim/pack/elhacker/start
    git clone https://elhacker/vim-gitstatus.git
    vim -u NONE -c "helptags vim-gitstatus/doc" -c q

### Key maps

vim-gitstatus.vim doesn't map anything itself. If you'd like to have a
key mapping add this to your `/.vimrc` file:

    nnoremap <leader>gs :GitStatus<CR>
