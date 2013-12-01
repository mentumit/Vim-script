"--------------------------------------------------------------------------- 
" For pathogen.vim: auto load all plugins in .vimfiles/bundle
"--------------------------------------------------------------------------- 
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
" 
"--------------------------------------------------------------------------- 

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"Ctags ,Taglist"
let Tlist_Ctags_Cmd = 'C:\ctags.exe'
nnoremap <F12> :TlistToggle<CR>

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

