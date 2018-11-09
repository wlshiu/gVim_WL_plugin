set nocompatible
"//=====================================================
"// Plugin management (:PluginInstall)
"//=====================================================
" Plugin package: {{{
    "// required for start
    filetype off
    "// set the runtime path to include Vundle and initialize

    if (has('win32') || has('win64'))
        set rtp+=$VIMRUNTIME/bundle/
        let plugin_bundle_path='$VIMRUNTIME/bundle/'
    else
        set rtp+=~/.vim/bundle/
        let plugin_bundle_path='~/.vim/bundle'
    endif
    call vundle#begin(plugin_bundle_path)

    "// let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'


    "// vim-scripts repos

    "-----------------
    " wl: {{{1
        " 1. you should copy cscope.exe/ctags.exe to vim80
        " 2. you should merge the c.vim
        Plugin 'wlshiu/vim-wl'
    " }}}1

    "-----------------
    " gtags: {{{1
        let gcscope='$VIMRUNTIME\gtags-cscope.exe'
        set cscopetag
        set cscopeprg=gcscope
        let GtagsCscope_Auto_Load = 1
        let GtagsCscope_Quiet = 1
        let Gtags_No_Auto_Jump = 1

        nmap <C-\>] :Gtags -r <C-R>=expand("<cword>")<CR><CR>
        nmap <C-\>' :Gtags -s <C-R>=expand("<cword>")<CR><CR>
    " }}}1

    "-----------------
    " CtrlP: {{{1
        Plugin 'ctrlpvim/ctrlp.vim'

        " let g:ctrlp_map = '<A-w>'
        let g:ctrlp_clear_cache_on_exit=0
        let g:ctrlp_max_files=0
        let g:ctrlp_max_depth=40
        "let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
        let g:ctrlp_custom_ignore = {
          \ 'dir': '\v[\/](\.git|\.hg|\.svn|IAR|Debug|Release)$',
          \ 'file': '\v\.(exe|so|dll|o|a|out|obj|bin|cmd)$',
          \ }

        let g:ctrlp_match_window = 'results:200'

        if (has('win32') || has('win64'))
            let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d /o-n *.h *.hh *.c *.cpp' " Windows
        else
            " MacOSX/Linux
            let g:ctrlp_user_command = 'find %s -type f -name "*.h" -o -name "*.hh" -o -name "*.c" -o -name "*.cpp"'
        endif
    " }}}1


    "-----------------
    " NERDTree: {{{1
        Plugin 'scrooloose/nerdtree'

        let NERDTreeWinPos='right'

        "// 開檔後自動消失wnd
        let NERDTreeQuitOnOpen=1

        "// 使用NERD Tree提供的色彩
        let NERDChristmasTree=1

        "// highlight 目前 cursor的列
        let NERDTreeHighlightCursorline=1

        let g:NERDTreeWinSize=45
        let g:NERDTreeDirArrows=0

        "// only show
        let NERDTreeIgnore = ['\(\.c\|\.h\|\.cpp\|\.hh\|.mk\|.py\|Makefile\|.s\|.S\|.ld\)\@<!$[[file]]']

        nmap nt :NERDTreeToggle<CR>
    " }}}1


    "-----------------
    " nerdcommenter: {{{1
    "    Plugin 'scrooloose/nerdcommenter'
    " }}}1

    "-----------------
    " vim-commenter: {{{1
        " https://aben20807.blogspot.com/2018/03/1070313-vim-commenter.html
        Plugin 'aben20807/vim-commenter'

        let g:commenter_use_default_mapping = 1
        let g:commenter_n_key = "<Leader>q"
        let g:commenter_i_key = "<Leader>q"
        let g:commenter_v_key = "<Leader>q"
    " }}}1

    "-----------------
    " vimgrep : {{{1
        Plugin 'vim-scripts/vimgrep.vim'
        " When you press <Leader>gv you vimgrep after the selected text
        nnoremap <silent> <Leader>gv :vimgrep! /<C-R>=expand("<cword>")<CR>/j **/*.[ch]<CR>

        " Open vimgrep and put the cursor in the right position
        map <Leader>g :vimgrep /<C-R>=expand("<cword>")<CR>/j **/*.

        " type your pattern
        " map <leader>g :vimgrep //j **/*.<left><left><left><left><left><left><left><left>
    " }}}1

    "-----------------
    " ack.vim : {{{1
        Plugin 'mileszs/ack.vim'

        let g:ackprg = 'ag --nogroup --column --color-match --nocolor --ignore tags'
        map <Leader>ag :Ack! <C-R>=expand("<cword>")<CR><CR>
    " }}}1


    "-----------------
    " tagbar: {{{1
        Plugin 'majutsushi/tagbar'

        let g:tagbar_ctags_bin ='$VIMRUNTIME\ctags.exe'
        let g:tagbar_left = 1
        let g:tagbar_sort = 0
        let g:tagbar_autoshowtag = 1
        let g:tagbar_width = 35
        let g:tagbar_autoopen = 1
        "// hot key
        nmap tl :TagbarToggle<CR>
    " }}}1



    "-----------------
    " Mark: {{{1
        Plugin 'Tuxdude/mark.vim'
    " }}}1


    "-----------------
    " buffergator: {{{1
        Plugin 'jeetsukumaran/vim-buffergator'

        let g:buffergator_viewport_split_policy="T"
    " }}}1


    "-----------------
    " indentLine: {{{1
        Plugin 'Yggdroot/indentLine'

        let g:indentLine_color_term = 239
        let g:indentLine_char = '¦'
    " }}}1


    "-----------------
    " YouCompleteMe: {{{1
        " Plugin 'Valloric/YouCompleteMe'

        " let g:ycm_min_num_of_chars_for_completion = 1
    " }}}1

    "-----------------
    " autocomplpop: {{{1
        Plugin 'wlshiu/vim-autocomplpop'
        let g:acp_behaviorSnipmateLength = 1
    " }}}1


    "-----------------
    " markdown: {{{1
        Plugin 'plasticboy/vim-markdown'

        let g:vim_markdown_folding_style_pythonic = 1
    " }}}1


    "-----------------
    " airline: {{{1
        Plugin 'vim-airline/vim-airline'
        set t_Co=256
        " set status line
        set laststatus=2

        "// enable tabline and show buffer number
        " let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#buffer_nr_show = 1

        " set left separator which are not editting
        let g:airline#extensions#tabline#left_alt_sep = '|'
    " }}}1


    "-----------------
    " CCTree: {{{1
        " Plugin 'vim-scripts/CCTree'
    " }}}1

    "-----------------
    " FuzzyFinder: {{{1
        Plugin 'L9'
        Plugin 'FuzzyFinder'

        nmap <A-s> :FufTag<CR>
        "nmap <A-w> :FufFile<CR>
        "// terminal mode can use Alt, so change Shift
        "nmap <S-s> :FufTag<CR>
        "nmap <S-w> :FufFile<CR>
    " }}}1


    call vundle#end()
    "// required for end
    filetype plugin indent on
" }}}



"//=====================================================
"// Function
"//=====================================================
"-----------------
" Function: {{{
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
      if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
          if empty(&shellxquote)
            let l:shxq_sav = ''
            set shellxquote&
          endif
          let cmd = '"' . $VIMRUNTIME . '\diff"'
        else
          let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
      else
        let cmd = $VIMRUNTIME . '\diff'
      endif
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
      if exists('l:shxq_sav')
        let &shellxquote=l:shxq_sav
      endif
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


    "-----------------
    " astyle: {{{1
        let astyle='$VIMRUNTIME\AStyle.exe'
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
    " }}}1


    "-----------------
    " Cscope/Ctags: {{{1
        let cscope='$VIMRUNTIME\cscope.exe'
        function Do_CsTag()
            let cur_dir = getcwd()

            if has("cscope")
                silent! execute "cs kill -1"
            endif

            if filereadable("cscope.out")
                if (has('win32') || has('win64'))
                    let csoutdeleted=delete(cur_dir."\\"."cscope.out")
                else
                    let csoutdeleted=delete("./"."cscope.out")
                endif

                if (csoutdeleted!=0)
                    echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.out" | echohl None
                    return
                endif
            endif

            " if filereadable("cscope.files")
            "     if (has('win32') || has('win64'))
            "         let csfilesdeleted=delete(cur_dir."\\"."cscope.files")
            "     else
            "         let csfilesdeleted=delete("./"."cscope.files")
            "     endif
            "     if(csfilesdeleted!=0)
            "         echohl WarningMsg | echo "Fail to do cscope! I cannot delete the cscope.files" | echohl None
            "         return
            "     endif
            " endif

            if !filereadable("cscope.files")
                if (has('win32') || has('win64'))
                    silent! execute "!dir /s/b *.c,*.cpp,*.h,*.hh,*.py > cscope.files"
                else
                    silent! execute "!find . -name '*.h' -o -name '*.hh' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.py' > cscope.files"
                endif
            endif

            if (executable('ctags'))
                " silent! execute "!ctags -R --c-types=+p --fields=+S *"
                " silent! execute "!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q ."
                silent! execute "!ctags --c++-kinds=+p --fields=+iaS --extra=+q --sort=yes -L cscope.files"
            endif

            if (executable('cscope') && has("cscope") )
                silent! execute "!cscope -bkq -i cscope.files"
                execute "normal :"
                if filereadable("cscope.out")
                    execute "cs add cscope.out"
                endif
            endif

            "CCTreeLoadDB
        endfunction

        " do ctag and cscope, finally load cscope.out to CCTree
        map <A-g> <Esc>:call Do_CsTag() <CR>
        nmap tg <Esc>:call Do_CsTag() <CR>


    " }}}1

    "-----------------
    " gtags: {{{1
        let gtags='$VIMRUNTIME\gtags.exe'
        function Do_GTag()
            let cur_dir = getcwd()

            if !filereadable("cscope.files")
                if (has('win32') || has('win64'))
                    silent! execute "!dir /s/b *.c,*.cpp,*.h,*.hh,*.py > cscope.files"
                else
                    silent! execute "!find . -name '*.h' -o -name '*.hh' -o -name '*.c' -o -name '*.cpp' -o -name '*.java' -o -name '*.py' > cscope.files"
                endif
            endif

            if (executable('ctags'))
                silent! execute "!ctags --c++-kinds=+p --fields=+iaS --extra=+q --sort=yes -L cscope.files"
            endif

            if (executable('gtags'))
                silent! execute "!gtags -f ./cscope.files"
                execute "normal :"
                if filereadable("GTAGS")
                    execute "cs add GTAGS"
                endif
            endif
        endfunction

    " }}}1

" }}}

"//=====================================================
"// environment setup
"//=====================================================
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"// 設置個人顯示風格
if !exists("syntax_on")
    syntax on
endif

set fileformat=unix
filetype plugin on

set guifont=monaspace\ 12
" colorscheme xoria256
colorscheme wl_style

"//設置視窗大小
set lines=42 columns=140

"//設置cmd window size
set cmdheight=2

"// 顯示行號
set number

"// 用 space 代替 tab
set expandtab
autocmd FileType make setlocal noexpandtab

"// 設置TAB寬度
set tabstop=4

"// 自動縮排長度
set shiftwidth=4

" 智慧對齊方式
set smartindent

"// 自動縮排
set autoindent

"// 逐層向上搜尋 tags file
" set tags=tags;

"// 自動切換working directory, 以current file 所在目錄為主
" set autochdir

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

"// 操作過程有衝突時,以明確的文字來詢問
set confirm

"// Alt default是配給 Menu的第一個底線選項, 將 Alt預設 disable
set winaltkeys=yes

"// 不備份
set nobackup
set nowritebackup
set noswapfile

"// 自動換行選項
"set nowrap

"// 檔案編碼
set encoding=utf-8
set fileencodings=utf-8,cp950
set fileencoding=utf-8
set termencoding=utf-8
"// 解決菜單亂碼
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"// 解決consle輸出亂碼
language messages zh_tw.utf-8

"// 視窗滾動保留列數
set scrolloff=3

"// Set to auto read when a file is changed from the outside
set autoread

"// Ignore case when searching
set ignorecase

"// 不對匹配的括號進行高亮顯示
" let loaded_matchparen=1

set hlsearch

"// highlights the matching braces
set showmatch

" show tab
set list listchars=tab:>.
" show ^M
set ffs=unix

"// folding setting
"set foldmethod=syntax   "// 依內容
"set foldmethod=marker    "// 依自訂
"set foldmethod=indent  "// 依縮排
set foldnestmax=3
set foldcolumn=3

"// diff setting
if &diff
    set cursorline
    set wrap
    hi CursorLine   ctermfg=Black ctermbg=206 guifg=Black guibg=206
    hi diffLine     ctermfg=Black ctermbg=93 guifg=Black guibg=206

    " 設定各種差異時,標示的顏色
    " Add 代表新增的一行, Delete 代表刪除的一行,
    " Change 代表有差異的一行,Text 代表有差異的這一行中,具有差異的部份
    hi DiffAdd ctermfg=White ctermbg=21 guifg=White  guibg=21
    " hi DiffDelete ctermfg=Grey ctermbg=DarkRed guifg=Grey
    hi diffRemoved ctermfg=Grey ctermbg=Grey guifg=Grey guibg=Grey
    hi DiffChange ctermfg=Black ctermbg=178 guifg=Black guibg=#FFCC22
    hi DiffText ctermfg=Black ctermbg=222 guifg=Black guibg=#FFFF77

    map <A-Down> ]c
    map <A-UP>   [c
else
    set nocursorline
endif

"// set python fold
autocmd FileType python setlocal foldmethod=indent
set foldlevel=5
nnoremap <space> za
vnoremap <space> zc

let python_highlight_all=1

au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.lds set filetype=ld
au BufRead,BufNewFile *.expand set filetype=rtl
"//=====================================================
"// hot key
"//=====================================================
" 按 F8 可以切換是否高亮度顯示搜尋字串
map <F8> :set hls!<BAR>set hls?<CR>

"// Delete trailing white space
nmap \de <Esc>:%s/\s\+$//g <CR>

"// Remove the Windows ^M - when the encodings gets messed up
nmap \dm <Esc>:%s/\r//g <CR>

nmap \q :ccl<CR>

"// when press \ + Enter, the cursor break context to next line.
nmap \<CR>  i<CR><ESC>

"// when press \ + Space, insert white spec at cursor.
nmap \<SPACE>  i<SPACE><ESC>

"// Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"// replace pre-existing tabs
nmap \rt <Esc>:retab <CR>

"// jump to line start/end
nmap ms <Home>
nmap mt <End>

" set plug-in help file path
nmap hp <Esc>:helptags $VIMRUNTIME\doc <CR>

"// 取消 ctrl+v 定義
unmap <C-V>




