set foldmethod=syntax
set nu
set mouse=a
set splitbelow
set splitright


" Interface settings
colorscheme natedesert
let g:airline_theme='badwolf'
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_yarp = 1

set listchars=tab:▸\ ,eol:¬
set list
set t_Co=256

highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

let g:airline_left_sep='🞂' " the separator used on the left side >
let g:airline_right_sep='🞀' " the separator used on the right side >
let g:airline_detect_modified=1 " enable modified detection >
let g:airline_detect_paste=1 " enable paste detection >
let g:airline_detect_crypt=1 " enable crypt detection >
let g:airline_detect_spell=1 " enable spell detection >
let g:airline_detect_spelllang=1 " display spelling language when spell detection is enabled (if enough space is available)
let g:airline_detect_iminsert=0 " enable iminsert detection >
" determine whether inactive windows should have the left section collapsed to only the filename of that buffer.
let g:airline_inactive_collapse=1
let g:airline_inactive_alt_sep=1 " Use alternative seperators for the statusline of inactive windows >


" Handy settings
"
" Command Sw will 'sudo write' the file
" Useful when you forget to open the file as root
command! Sw silent w !sudo tee %




" The following settings are for Vundle.
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plug 'VundleVim/Vundle.vim'

Plug 'fatih/vim-go'				" GoLang support
Plug 'SirVer/ultisnips'				" Auto fill common code snips
Plug 'Konfekt/FastFold'
Plug 'bfrg/vim-cpp-modern'			" C++ highlighting
Plug 'vim-airline/vim-airline'			" status bar
Plug 'vim-airline/vim-airline-themes'	
Plug 'maralla/completor.vim'			" autocompletion
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }


" All of your Plugins must be added before the following line
"call vundle#end()            " required
call plug#end()
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
    redraw
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap gr :<C-U>RangerChooser<CR>

" Toggle mouse
function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

map s <Nop> 
command! -bar ToggleMouse call ToggleMouse()
nnoremap sm :ToggleMouse<CR>

