"  "//==============================
"  "// Vundle Setting
"  "//==============================
"  "set nocompatible              "// be iMproved, required
"  filetype off                  "// required
"
"  "// set the runtime path to include Vundle and initialize
"  set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
"  let path='$VIM/vimfiles/bundle'
"  call vundle#begin(path)
"
"  "// let Vundle manage Vundle, required
"  Plugin 'gmarik/Vundle.vim'
"
"  Plugin 'Valloric/YouCompleteMe'
"
"  "// All of your Plugins must be added before the following line
"  call vundle#end()            "// required
"  filetype plugin indent on    "// required
"  "//=====================================================


set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"//=====================================================
"// Function
"//=====================================================
function! MySys()
  if has("win32")
    return "windows"
  else
    return "linux"
  endif
endfunction

"/***************************************************************
"* Function
"***************************************************************/
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

function! CurDir()
    let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    else
        return ''
    endif
endfunction

"/***************************************************************
"* personal style setting
"***************************************************************/
"// �]�m�ӤH��ܭ���
if !exists("syntax_on")
    syntax on
endif

set guifont=monaspace\ 12
colorscheme wl_style

"//�]�m�����j�p
set lines=42 columns=140

"//�]�mcmd window size
set cmdheight=3

"// ��ܦ渹
set number

" �� space �N�� tab
set expandtab

"// �]�mTAB�e��
set tabstop=4

"// �۰��Y�ƪ���
set shiftwidth=4

" ���z����覡
set smartindent

"// �۰��Y��
set autoindent

"// �v�h�V�W�j�M tags file
set tags=tags;

"//�۰ʤ���working directory, �Hcurrent file �Ҧb�ؿ����D
"set autochdir

"// �]�w���A�C
set laststatus=2

"// statusline �榡
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ Ln:\ %l/%L:%c

"// �i�Jinsert mode���ܪ��A�C�C�� (vim7.0 �H�W)
if version >= 700
    au InsertEnter * hi StatusLine guibg=#818D29 guifg=#FCFCFC gui=none
    au InsertLeave * hi StatusLine guibg=#EEEEEE guifg=#363636 gui=none
endif

"// ��ܲ{�b���Ҧ�
set showmode

" �ާ@�L�{���Ĭ�ɡA�H���T����r�Ӹ߰�
set confirm

" Alt default�O�t�� Menu���Ĥ@�ө��u�ﶵ, �N Alt�w�] disable
set winaltkeys=no

"���ƥ�
set nobackup
set nowritebackup
set noswapfile

"// �۰ʴ���ﶵ
"set nowrap

" �ɮ׽s�X
"set encoding=utf-8
"set fileencodings=utf-8,cp950

"// �����u�ʫO�d�C��
set scrolloff=5

"Set to auto read when a file is changed from the outside
set autoread
"/***************************************************************
"* folding setting
"***************************************************************/
"set foldmethod=syntax   "// �̤��e
"set foldmethod=Mark    "// �̦ۭq
"set foldmethod=indent  "// ���Y��
set foldnestmax=3
set foldcolumn=3

"/***************************************************************
"* other setting
"***************************************************************/
"alt+q �]�w������C�y��������//
map <A-q> :s/^/\/\/<CR>/;<CR>
"shift+q �]�w���R��C�y��������//
map <S-q> :s/^\/\///<CR>

"/***************************************************************
"* taglist setting
"***************************************************************/
"let ctags='$VIMRUNTIME\ctags.exe'
"// �]�wctags.exe���|
"let Tlist_Ctags_Cmd='ctags.exe'

"// �]�w wnd�e��
let Tlist_WinWidth = 32

"// �}�ɫ�۰� update
let Tlist_Auto_Update=1

"// �u show�@�� file�� tag
let Tlist_Show_One_File=1

"// �bGVIM�� show menu
let Tlist_Show_Menu=1

"// �H vim�۰ʶ}�� taglist
let Tlist_Auto_Open=1

"// �b�I�� always�ѪR tag
let Tlist_Process_File_Always=1

"// hot key
nmap tl :TlistToggle<CR>

"/***************************************************************
"* NERD Tree setting
"***************************************************************/
let NERDTreeWinPos='right'

"// �}�ɫ�۰ʮ���wnd
let NERDTreeQuitOnOpen=1

"// �ϥ�NERD Tree���Ѫ���m
let NERDChristmasTree=1

"// highlight �ثe cursor���C
let NERDTreeHighlightCursorline=1

"nmap <S-n> :NERDTreeToggle<CR>
nmap <A-n> :NERDTreeToggle<CR>

"/***************************************************************
"* Cscope setting
"***************************************************************/
"  "//�]�w cscope.exe ���|
"  "let cscope='$VIMRUNTIME\cscope.exe'
"
"  "// �P�ɷj�� ctags�M cscope�B�H cscope�u��
"  if has("cscope")
"      set cscopequickfix=s-,c-,d-,i-,t-,e-
"      set csto=0
"      set cst
"      set csverb
"  endif
"
"  func Add_CSOut()
"      let i = 1
"      while i < 8
"          if filereadable("cscope.out")
"            cs add cscope.out
"            let i = 8
"          else
"            cd ..
"            let i += 1
"          endif
"      endwhile
"  endfunc
"
"  func GenTag()
"      let lineNum = line(".")
"      exec "! ctags --sort=foldcase -R"
"      exec "! cscope -Rb"
"      exec lineNum
"  endfunc
"
"  map <A-F7> <Esc>:call Add_CSOut()<CR>
"  map <A-g> <Esc>:call GenTag()<CR>
"  "map <S-g> <Esc>:call GenTag()<CR> "// terminal mode can use Alt, so change Shift

if(has("win32"))
    let g:iswindows=1
else
    let g:iswindows=0
endif

let cscope='$VIMRUNTIME\cscope.exe'
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(g:iswindows==1)
            let tagsdeleted=delete(dir."\\"."tags")
        else
            let tagsdeleted=delete("./"."tags")
        endif
        if(tagsdeleted!=0)
            echohl WarningMsg | echo "Fail to do tags! I cannot delete the tags" | echohl None
            return
        endif
    endif
    if has("cscope")
        silent! execute "cs kill -1"
    endif
    if filereadable("cscope.files")
        if(g:iswindows==1)
            let csfilesdeleted=delete(dir."\\"."cscope.files")
        else
            let csfilesdeleted=delete("./"."cscope.files")
        endif
        if(csfilesdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            return
        endif
    endif
    if filereadable("cscope.out")
        if(g:iswindows==1)
            let csoutdeleted=delete(dir."\\"."cscope.out")
        else
            let csoutdeleted=delete("./"."cscope.out")
        endif
        if(csoutdeleted!=0)
            echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
            return
        endif
    endif
    if(executable('ctags'))
        "silent! execute "!ctags -R --c-types=+p --fields=+S *"
        silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
    endif
    if(executable('cscope') && has("cscope") )
        if(g:iswindows!=1)
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        else
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif
endfunction

map <A-g> <Esc>:call Do_CsTag()<CR>

"/***************************************************************
"* QuickFix (default plug-in)
"***************************************************************/
"//�����V�e�ΦV����� quickFix wind���ت���m
nmap <F6> :cn<CR>
nmap <F7> :cp<CR>

"/***************************************************************
"* FuzzyFinder
"***************************************************************/
nmap <A-s> :FufTag<CR>
"nmap <A-w> :FufFile<CR>
"// terminal mode can use Alt, so change Shift
"nmap <S-s> :FufTag<CR>
"nmap <S-w> :FufFile<CR>

"/***************************************************************
"* CtrlP
"***************************************************************/
let g:ctrlp_map = '<A-w>'

"/***************************************************************
"* AStyle
"***************************************************************/
let astyle='$VIMRUNTIME\astyle.exe'
func CodeFormat()
    "���ocursor�Ҧb�渹
    let lineNum = line(".")

    if &filetype == 'java'
        "����~���{�Ǫ��R�O
        exec "%! astyle -A2Lfpjk3NS\<CR>"
    else
        "����~���{�Ǫ��R�O
        exec "%! astyle  -A1 -t4 -b -S -K -k3 -M40 -m0  -j -c -p\<CR>"
    endif

    "��^cursor�Ҧb��
    exec lineNum
endfunc

map <A-F8> <Esc>:call CodeFormat()<CR>
