set foldmethod=syntax
set nu
set mouse=a
colorscheme natedesert

" Interface settings
set listchars=tab:▸\ ,eol:¬
set list

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Handy settings
"
" Command Sw will 'sudo write' the file
" Useful when you forget to open the file as root
command! Sw silent w !sudo tee %




" The following settings are for Vundle.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'		" GoLang support
Plugin 'SirVer/ultisnips'	" Auto fill common code snips
Plugin 'Konfekt/FastFold'
Plugin 'bfrg/vim-cpp-modern'	" C++ highlighting

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" To install Vundle:
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" :PluginInstall


" Use Ranger from inside VIM

function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    exec 'silent !ranger --choosefiles=' . shellescape(temp)
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap g :<C-U>RangerChooser<CR>
