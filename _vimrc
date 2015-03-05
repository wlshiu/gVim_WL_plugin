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
"  Plugin ''scrooloose/syntastic''
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
"// 設置個人顯示風格
if !exists("syntax_on")
    syntax on
endif

set guifont=monaspace\ 12
colorscheme wl_style

"//設置視窗大小
set lines=42 columns=140

"//設置cmd window size
set cmdheight=2

"// 顯示行號
set number

" 用 space 代替 tab
set expandtab

"// 設置TAB寬度
set tabstop=4

"// 自動縮排長度
set shiftwidth=4

" 智慧對齊方式
set smartindent

"// 自動縮排
set autoindent

"// 逐層向上搜尋 tags file
set tags=tags;

"//自動切換working directory, 以current file 所在目錄為主
"set autochdir

"// 設定狀態列
set laststatus=2

"// statusline 格式
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ Ln:\ %l/%L:%c

"// 進入insert mode改變狀態列顏色 (vim7.0 以上)
if version >= 700
    au InsertEnter * hi StatusLine guibg=#818D29 guifg=#FCFCFC gui=none
    au InsertLeave * hi StatusLine guibg=#EEEEEE guifg=#363636 gui=none
endif

"// 顯示現在的模式
set showmode

" 操作過程有衝突時，以明確的文字來詢問
set confirm

" Alt default是配給 Menu的第一個底線選項, 將 Alt預設 disable
set winaltkeys=no

"不備份
set nobackup
set nowritebackup
set noswapfile

"// 自動換行選項
"set nowrap

" 檔案編碼
"set encoding=utf-8
"set fileencodings=utf-8,cp950

"// 視窗滾動保留列數
set scrolloff=3

"Set to auto read when a file is changed from the outside
set autoread

"// 取消 ctrl+v 定義
unmap <C-V>

"/***************************************************************
"* folding setting
"***************************************************************/
"set foldmethod=syntax   "// 依內容
"set foldmethod=marker    "// 依自訂
"set foldmethod=indent  "// 依縮排
set foldnestmax=3
set foldcolumn=3

"/***************************************************************
"* other setting
"***************************************************************/
"alt+q 設定為產生C語言的註解//
"map <c-k> :s/^/\/\/<CR>/;<CR>
"shift+q 設定為刪除C語言的註解//
"map <S-q> :s/^\/\///<CR>

"/***************************************************************
"* taglist setting
"***************************************************************/
"let ctags='$VIMRUNTIME\ctags.exe'
"// 設定ctags.exe路徑
"let Tlist_Ctags_Cmd='ctags.exe'

"// 設定 wnd寬度
let Tlist_WinWidth = 32

"// 開檔後自動 update
let Tlist_Auto_Update=1

"// 只 show一個 file的 tag
let Tlist_Show_One_File=1

"// 在GVIM中 show menu
let Tlist_Show_Menu=1

"// 隨 vim自動開啟 taglist
let Tlist_Auto_Open=1

"// 在背景 always解析 tag
let Tlist_Process_File_Always=1

"// hot key
nmap tl :TlistToggle<CR>

"/***************************************************************
"* NERD Tree setting
"***************************************************************/
let NERDTreeWinPos='right'

"// 開檔後自動消失wnd
let NERDTreeQuitOnOpen=1

"// 使用NERD Tree提供的色彩
let NERDChristmasTree=1

"// highlight 目前 cursor的列
let NERDTreeHighlightCursorline=1

"nmap <S-n> :NERDTreeToggle<CR>
nmap <A-n> :NERDTreeToggle<CR>

"/***************************************************************
"* clang complete
"***************************************************************/
" let g:clang_snippets=0
" let g:clang_use_library=1
" let g:clang_library_path=$VIMRUNTIME

"/***************************************************************
"* Cscope setting
"***************************************************************/
" 不使用 quickFix window
"set cscopequickfix=s-,c-,d-,i-,t-,e-


"  "//設定 cscope.exe 路徑
"  "let cscope='$VIMRUNTIME\cscope.exe'
"
"  "// 同時搜索 ctags和 cscope且以 cscope優先
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

let cscope='$VIMRUNTIME\cscope.exe'
function Do_CsTag()
    let dir = getcwd()
    if filereadable("tags")
        if(has("win32"))
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
        if(has("win32"))
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
        if(has("win32"))
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
        if(has("win32"))
            silent! execute "!dir /s/b *.c,*.cpp,*.h,*.java,*.cs >> cscope.files"
        else
            silent! execute "!find . -name '*.h' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.cs' > cscope.files"
        endif
        silent! execute "!cscope -b"
        execute "normal :"
        if filereadable("cscope.out")
            execute "cs add cscope.out"
        endif
    endif

    "CCTreeLoadDB
endfunction

" do ctag and cscope, finally load cscope.out to CCTree
map <A-g> <Esc>:call Do_CsTag() <CR>

"/***************************************************************
"* QuickFix (default plug-in)
"***************************************************************/
"//直接向前或向後跳到 quickFix wind項目的位置
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
"* cctree
"***************************************************************/
"key CCTreeLoadDB 後 enter 自動選上 cscope.out
let g:CCTreeCscopeDb = "cscope.out"
" set hot key
let g:CCTreeKeyTraceForwardTree = 'c.'
let g:CCTreeKeyTraceReverseTree = 'c,'
set updatetime=0


"/***************************************************************
"* SrcExpl
"***************************************************************/
" // The switch of the Source Explorer
nmap <F8> :SrcExplToggle<CR>

" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" // Set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
        \ "__Tag_List__",
        \ "_NERD_tree_"
    \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" //  create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
let g:SrcExpl_updateTagsKey = "<F12>"

" // Set "<F3>" key for displaying the previous definition in the jump list
let g:SrcExpl_prevDefKey = "<F3>"

" // Set "<F4>" key for displaying the next definition in the jump list
let g:SrcExpl_nextDefKey = "<F4>"
"/***************************************************************
"* Trinity
"***************************************************************/
" Open and close all the three plugins on the same time
nmap <C-F8> :TrinityToggleAll<CR>
" Open and close the srcexpl.vim separately
nmap <C-F9> :TrinityToggleSourceExplorer<CR>
" Open and close the taglist.vim separately
nmap <C-F10> :TrinityToggleTagList<CR>
" Open and close the NERD_tree.vim separately
nmap <C-F11> :TrinityToggleNERDTree<CR>

"/***************************************************************
"* AStyle
"***************************************************************/
let astyle='$VIMRUNTIME\astyle.exe'
func CodeFormat()
    "取得cursor所在行號
    let lineNum = line(".")

    if &filetype == 'java'
        "執行外部程序的命令
        exec "%! astyle -A2Lfpjk3NS\<CR>"
    else
        "執行外部程序的命令
        exec "%! astyle  -A1 -t4 -b -S -K -k3 -M40 -m0  -j -c -p\<CR>"
    endif

    "返回cursor所在行
    exec lineNum
endfunc

map <A-F8> <Esc>:call CodeFormat()<CR>

"/***************************************************************
"* 去除行末空白及最後的空白行
"***************************************************************/
" // Remove trailing whitespace when writing a buffer, but not for diff files.
" // From: Vigil <vim5632@rainslide.net>
" func RemoveTrailingWhitespace()
"     if &ft != "diff"
"         let b:curcol = col(".")
"         let b:curline = line(".")
"         silent! %s/\s\+$//
"         silent! %s/\(\s*\n\)\+\%$//
"         call cursor(b:curline, b:curcol)
"     endif
" endfunc
"
" autocmd BufWritePre * call RemoveTrailingWhitespace()

nmap \d <Esc>:%s/\s\+$//g <CR>

