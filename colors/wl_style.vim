"// vim color file
"// wlHsu


set background=dark

if(has("win32"))
    "set guifont=fixedsys:h12
    set guifont=consolas:h12
    "set guifont=monaco:h10
    
    " full screen 
    au GUIEnter * simalt ~x

else
    "set guifont=fixedsys\ 12
    set guifont=monaco\ 10
endif


if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
    syntax reset
    endif
endif
let g:colors_name="wl_style"

hi normal   guifg=gray guibg=#2b2b2b gui=none

"// alignctrl default
"// alignctrl =p0 guifg guibg gui
"// align

"// highlight groups Gui mode
hi cursor       guifg=black          guibg=yellow   gui=none
hi errormsg     guifg=white          guibg=red      gui=none
hi vertsplit    guifg=gray40         guibg=gray40   gui=none
hi folded       guifg=darkslategray3 guibg=grey30   gui=none
hi foldcolumn   guifg=tan            guibg=grey30   gui=none
hi incsearch    guifg=#b0ffff        guibg=#2050d0
" hi linenr       guifg=burlywood3     gui=none
hi linenr       guifg=brown          gui=none
hi modemsg      guifg=skyblue        gui=none
hi moremsg      guifg=seagreen       gui=none
hi nontext      guifg=cyan           gui=none
hi question     guifg=springgreen    gui=none
hi search       guifg=gray80         guibg=#445599  gui=none
hi specialkey   guifg=#4d4d4d                       gui=none
hi statusline   guifg=black          guibg=#c2bfa5  gui=none
hi statuslinenc guifg=grey           guibg=gray40   gui=none
hi title        guifg=indianred      gui=none
hi visual       guifg=gray17         guibg=tan1     gui=none
hi warningmsg   guifg=salmon         gui=none
hi pmenu        guifg=white          guibg=#445599  gui=none
hi pmenusel     guifg=#445599        guibg=gray
hi wildmenu     guifg=gray           guibg=gray17   gui=none
"hi matchparen  guifg=cyan           guibg=none     gui=bold
hi matchparen   guifg=cyan                          gui=bold
hi diffadd      guifg=black          guibg=wheat1
hi diffchange   guifg=black          guibg=skyblue1
hi difftext     guifg=black          guibg=hotpink1  gui=none
hi diffdelete   guibg=gray45         guifg=black     gui=none

"// syntax highlighting groups
hi comment      guifg=darkgreen      gui=none
hi constant     guifg=salmon         gui=none
hi identifier   guifg=skyblue        gui=none
hi function     guifg=skyblue        gui=none
" hi statement    guifg=lightgoldenrod2 gui=none
hi statement    guifg=tan1           gui=none
hi preproc      guifg=palevioletred2 gui=none
" hi type         guifg=tan1           gui=none
hi type         guifg=#7171ff        gui=none
hi special      guifg=aquamarine2    gui=none
hi ignore       guifg=grey40         gui=none
hi todo         guifg=orangered      guibg=yellow2   gui=none

hi number       guifg=red            gui=none
hi operator     guifg=#f4e360        gui=none
hi string       guifg=#a00000        gui=none
hi keyword      guifg=red            gui=none
hi Label        guifg=cyan           gui=none

"// color terminal definitions
""*cterm-colors*
"NR-16   NR-8    COLOR NAME 
"0       0       Black
"1       4       DarkBlue
"2       2       DarkGreen
"3       6       DarkCyan
"4       1       DarkRed
"5       5       DarkMagenta
"6       3       Brown, DarkYellow
"7       7       LightGray, LightGrey, Gray, Grey
"8       0*      DarkGray, DarkGrey
"9       4*      Blue, LightBlue
"10      2*      Green, LightGreen
"11      6*      Cyan, LightCyan
"12      1*      Red, LightRed
"13      5*      Magenta, LightMagenta
"14      3*      Yellow, LightYellow
"15      7*      White

"// color terminal definitions
hi normal       ctermfg=gray        ctermbg=darkgray
hi cursor       ctermfg=black       ctermbg=yellow	 cterm=none
hi specialkey   ctermfg=Black
hi nontext      cterm=bold           ctermfg=darkblue
hi directory    ctermfg=darkcyan
hi errormsg     cterm=bold           ctermfg=7        ctermbg=1
hi incsearch    cterm=none           ctermfg=yellow   ctermbg=green
hi search       cterm=none           ctermfg=grey     ctermbg=blue
hi moremsg      ctermfg=darkgreen
hi modemsg      cterm=none           ctermfg=brown
hi linenr       ctermfg=3
hi question     ctermfg=green
hi statusline   cterm=bold,reverse
hi statuslinenc cterm=reverse
hi vertsplit    cterm=reverse
hi title        ctermfg=5
hi visual       cterm=reverse
hi visualnos    cterm=bold,underline
hi warningmsg   ctermfg=1
hi wildmenu     ctermfg=0            ctermbg=3
hi folded       ctermfg=Blue         ctermbg=none
hi foldcolumn   ctermfg=Blue         ctermbg=none
hi diffadd      ctermbg=4
hi diffchange   ctermbg=5
hi diffdelete   cterm=bold           ctermfg=4        ctermbg=6
hi difftext     cterm=bold           ctermbg=1
hi comment      ctermfg=darkgreen
hi constant     ctermfg=brown
hi special      ctermfg=DarkRed
hi identifier   ctermfg=LightBlue
hi statement    ctermfg=3
hi preproc      ctermfg=LightBlue
hi type         ctermfg=LightBlue
hi underlined   cterm=underline      ctermfg=5
hi ignore       ctermfg=darkgrey
hi error        cterm=bold           ctermfg=7        ctermbg=1
hi number       ctermfg=red 
hi operator     ctermfg=DarkYellow
hi string       ctermfg=DarkRed

hi link Character       string
hi link Boolean         type
hi link Float           number
"hi link Repeat          Statement

"hi link Exception       Statement
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi cFunction            gui=NONE guifg=#B5A1FF
hi link include         identifier
hi link define          identifier
hi link macro           identifier
hi link PreCondit       identifier

"// show tail whitespace
match Error /\s\+$/
"// show tab space
set list listchars=tab:>.

"/***************************************************************
"* matchparen
"***************************************************************/
" hi MatchParen cterm=none ctermbg=blue ctermfg=magenta guifg=magenta guibg=#FFDB72


