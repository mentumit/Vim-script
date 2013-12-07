"--------------------------------------------------------------------------- 
" For pathogen.vim: auto load all plugins in .vimfiles/bundle
"--------------------------------------------------------------------------- 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
execute pathogen#infect()

"--------------------------------------------------------------------------- 
" General Setting
"--------------------------------------------------------------------------- 

set nocompatible      " not compatible with the old-fashion vi mode
set bs=2              " allow backspacing over everything in insert mode
set history=50        " keep 50 lines of command line history
set ruler             " show the cursor position all the time
set autoread          " auto read when file is changed from outside

filetype off          " necessary to make ftdetect work on Linux
syntax on
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

"--------------------------------------------------------------------------- 
" General setting
"--------------------------------------------------------------------------- 

"set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

colorscheme ir_black
syntax on
set number
"Linux gVim 用如下\ 12
"set guifont=Monaco\ 12
"set guifont=Consolas\ 12
"set guifont=mingliu\ 12
"Windows gVim 用如下\ 12
set guifont=mingliu:h12

"--------------------------------------------------------------------------- 
" General setting
"--------------------------------------------------------------------------- 


"--------------------------------------------------------------------------- 
"Ctags ,Taglist 
"---------------------------------------------------------------------------

map <f9> :Tlist<CR>

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

