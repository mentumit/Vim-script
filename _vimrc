"--------------------------------------------------------------------------- 
" For pathogen.vim: auto load all plugins in .vimfiles/bundle
"--------------------------------------------------------------------------- 
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()
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

"set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

colorscheme ir_black
syntax on

"--------------------------------------------------------------------------- 
" 
"--------------------------------------------------------------------------- 



"--------------------------------------------------------------------------- 
" 
"--------------------------------------------------------------------------- 


"--------------------------------------------------------------------------- 
" Programming Setting
"---------------------------------------------------------------------------
filetype on           " Enable filetype detection

" TagList ��J:Tlist�}��
let Tlist_Show_One_File=1                             " �u��ܷ�e���tags
let Tlist_Exit_OnlyWindow=1                           " �p�GTaglist���f�O�̫�@�ӵ��f�h�h�Xvim
let Tlist_Use_Right_Window=0                          " �b�k�����f����ܥ�1,�����0
let Tlist_Enable_Fold_Column=1
let Tlist_File_Fold_Auto_Close=1

"�]�wF12���}��/����Tag List���ֱ���
nnoremap <F12> :TlistToggle<CR>

"�ͦ��@��tags���
"nmap <F9> <Esc>:!ctags -R *<CR>
"�]�m�@�U�����ܶq�Cpath=C:\cygwin\bin\ctags.exe

"###########Ctags�]�m##################
" --���b���س��h�ؿ�����ctags -R�A�M�ᥴ�}�����A�b�R�O�Ҧ�������p�Gset tags=../../tags
" --�o�˦b��ƦW�W�� <C-]> �Y�i����Ʃw�q�A�� <C-T> �i�H��^�եΦa�}
" --�p�G���ɶ��ݭn�b�ӥؿ��u�@�A�]�i�H�Ntags���|�g�J�t�m���

"set tags+=C:\Develop\MinGW\include\tags              " For C/C++
"set tags+=C:\Develop\GTK\include\tags                " For GTK+
"set tags+=C:\Develop\Lua\lua\tags                    " For Lua
"set tags+=G:\Cygwin\usr\include\tags                 " For Cygwin

set tags=tags;
set autochdir
let Tlist_Ctags_Cmd = 'C:\cygwin\bin\ctags.exe'







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

