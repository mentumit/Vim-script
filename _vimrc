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

" TagList 鍵入:Tlist開啟
let Tlist_Show_One_File=1                             " 只顯示當前文件的tags
let Tlist_Exit_OnlyWindow=1                           " 如果Taglist窗口是最後一個窗口則退出vim
let Tlist_Use_Right_Window=0                          " 在右側窗口中顯示用1,左邊用0
let Tlist_Enable_Fold_Column=1
let Tlist_File_Fold_Auto_Close=1

"設定F12為開啟/關閉Tag List的快捷鍵
nnoremap <F12> :TlistToggle<CR>

"生成一個tags文件
"nmap <F9> <Esc>:!ctags -R *<CR>
"設置一下環境變量。path=C:\cygwin\bin\ctags.exe

"###########Ctags設置##################
" --先在項目頂層目錄執行ctags -R，然後打開源文件，在命令模式中執行如：set tags=../../tags
" --這樣在函數名上按 <C-]> 即可轉到函數定義，按 <C-T> 可以返回調用地址
" --如果長時間需要在該目錄工作，也可以將tags路徑寫入配置文件

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

