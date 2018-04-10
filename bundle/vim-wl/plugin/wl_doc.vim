
if (exists('g:loaded_wldoc_vim') && g:loaded_wldoc_vim)
  finish
endif
let g:loaded_wldoc_vim = 1


function! OpenWlDoc()
    exec 'sp' $VIMRUNTIME . '/plugin/doc/wl_doc.txt'
endfunction

" command! WlDoc :call OpenWlDoc()
command! WlDoc :helpgrep wl_doc.txt


function SetCopyright()
    call setline(1,          "/**")
    call append(line("."),   " * Copyright (C) ".strftime("%Y")." Wei-Lun Hsu. All rights reserved.")
    call append(line(".")+1, " */")
    call append(line(".")+2, "/** @file   ".expand("%:t"))
    call append(line(".")+3, " *")
    call append(line(".")+4, " * @author Wei-Lun Hsu")
    call append(line(".")+5, " * @date   ".strftime("%Y-%m-%d"))
    call append(line(".")+6, " * @version 0.1")
    call append(line(".")+7, " */")
    call append(line(".")+8, "")
endfunction

function GenCHeader()
    call SetCopyright()
    call append(line(".")+9,  "#ifndef _".toupper(expand("%:t:r"))."_H")
    call append(line(".")+10, "#define _".toupper(expand("%:t:r"))."_H")
    call append(line(".")+11, "")
    call append(line(".")+12, "#ifdef __cplusplus")
    call append(line(".")+13, "extern \"C\" {")
    call append(line(".")+14, "#endif")
    call append(line(".")+15, "")
    call append(line(".")+16, "//=============================================================================")
    call append(line(".")+17, "//                 Constant Definition")
    call append(line(".")+18, "//=============================================================================")
    call append(line(".")+19, "")
    call append(line(".")+20, "//=============================================================================")
    call append(line(".")+21, "//                 Macro Definition")
    call append(line(".")+22, "//=============================================================================")
    call append(line(".")+23, "")
    call append(line(".")+24, "//=============================================================================")
    call append(line(".")+25, "//                 Structure Definition")
    call append(line(".")+26, "//=============================================================================")
    call append(line(".")+27, "")
    call append(line(".")+28, "//=============================================================================")
    call append(line(".")+29, "//                 Global Data Definition")
    call append(line(".")+30, "//=============================================================================")
    call append(line(".")+31, "")
    call append(line(".")+32, "//=============================================================================")
    call append(line(".")+33, "//                 Private Function Definition")
    call append(line(".")+34, "//=============================================================================")
    call append(line(".")+35, "")
    call append(line(".")+36, "//=============================================================================")
    call append(line(".")+37, "//                 Public Function Definition")
    call append(line(".")+38, "//=============================================================================")
    call append(line(".")+39, "")
    call append(line(".")+40, "#ifdef __cplusplus")
    call append(line(".")+41, "}")
    call append(line(".")+42, "#endif")
    call append(line(".")+43, "")
    call append(line(".")+44, "#endif // ".toupper(expand("%:t:r"))."_H")
    call append(line(".")+45, "")
endfunction

" imap <silent> <C-U><C-U> {<C-R>=system('uuidgen')<CR><C-U><BS>}


function! s:FindFiles(filename) "{{{

    if a:filename ==# ''
        echo "Wrong arguments"
        return
    endif

    let s:argv = split(a:filename, ' ')
    let s:argc = len(s:argv)

    if s:argc < 2
        let target_dir = getcwd()
    else
        let target_dir = s:argc[s:argc - 1]
    endif

    let options = ''
    let i = 0
    while 1
        if i == 0
            let options = options.'-iname "'.s:argv[i].'*" '
        else
            let options = options.'-o -iname "'.s:argv[i].'*" '
        endif

        let i += 1

        if i >= s:argc - 1
            break
        endif
    endwhile

    " echo options
    " echo '!find ' .target_dir. ' -type f ' .options.' | xargs file | sed "s/:/:1:/" > '

    redraw

    let error_file = tempname()
    " let error_file = expand('./tmp.txt')  " output to a file

    silent exe '!find ' .target_dir. ' -type f ' .options.' | xargs file | sed "s/:/:1:/" > '.error_file
    " silent exe '!find ' getcwd() '-name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file

    " silent exe '!find ' getcwd() '-name "'.a:filename.'" > '.error_file
    set errorformat=%f:%l%m

    "# cfile => Read the error file and jump to the first error
    " exe "cfile ". error_file

    "# cgetfile => Read the error file and NOT jump to the first error
    exe "cgetfile ". error_file

    botright copen
    redraw!
    call delete(error_file)

    exec "nnoremap <silent> <buffer> q :ccl<CR>"
    exec "nnoremap <silent> <buffer> s <C-W><CR><C-W>K"
    exec "nnoremap <silent> <buffer> v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t"
    exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
    exec "nnoremap <silent> <buffer> gv <C-W><CR><C-W>H<C-W>b<C-W>J"

endfunction "}}}
command! -bang -nargs=* -range FindFiles call s:FindFiles('<args>')
nnoremap <silent> <Leader>ff :FindFiles! <C-R>=expand("<cword>")<CR> <CR>

function! s:SearchFile(cmd, args) "{{{
    let line_ctxt = getline('.')
    let header_path = matchstr(line_ctxt, '\c#include\s\+\([<"]\)\zs.\+\ze\([>"]\)$')
    let error_file = tempname()

    if empty(header_path)
        let cur_file = expand('%')
        let suffix = matchstr(cur_file, '\.\a\+$')
        " let filename = matchstr(cur_file, '\w\+\.')
        let pattern = suffix . "$"
        let suffixes_instance = ['.cpp', '.cc', '.c']
        let suffixes_header = ['.h', '.hpp', '.hh']

        "# combine the target filename
        if suffix == '.h' || suffix == '.hpp' || suffix == '.hh'
            let suffixes = suffixes_instance
        elseif suffix == '.cpp' || suffix == '.cc' || suffix == '.c'
            let suffixes = suffixes_header
        else
            echo "No Matching ..."
            return
        endif

        let options = ''
        let i = 0
        for suf in suffixes
            let target = matchstr(cur_file, '/\w\+\.\a\+$')  " check at sub-directory or not
            if empty(target)
                let target = cur_file
            else
                " clear '/'
                let target = substitute(target, '/', '', '')
            endif

            let target = substitute(target, pattern, suf, '')

            if i == 0
                let options = options.'-iname "'.target.'" '
            else
                let options = options.'-o -iname "'.target.'" '
            endif

            let i += 1
        endfor

        " silent exe '!find ' getcwd() '-name "'.target.'" | sed "s/:/:1:/" >> '.error_file
        silent exe '!find ' getcwd() '-type f '.options.' >> '.error_file
    else
        let header_name = matchstr(header_path, '/\w\+\.\a\+$')
        if empty(header_name)
            let target = header_path
        else
            let target = substitute(header_name, '/', '', '')
        endif

        silent exe '!find ' getcwd() '-type f -iname "'.target.'" >> '.error_file
    endif

    redraw

    " set errorformat=%f:%l:%m
    set errorformat=%f

    "# cgetfile => Read the error file and NOT jump to the first error
    exe "cgetfile ". error_file

    botright copen
    redraw!
    call delete(error_file)

    exec "nnoremap <silent> <buffer> q :ccl<CR>"
    exec "nnoremap <silent> <buffer> s <C-W><CR><C-W>K"
    exec "nnoremap <silent> <buffer> v <C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t"
    exec "nnoremap <silent> <buffer> go <CR><C-W><C-W>"
    exec "nnoremap <silent> <buffer> gv <C-W><CR><C-W>H<C-W>b<C-W>J"

endfunction "}}}

command! -bang -nargs=? -range SearchFile call s:SearchFile('grep<bang>', <q-args>)
nnoremap <silent> <Leader>s :SearchFile! <C-R>=expand("<cword>")<CR> <CR>

"# test
" function! s:Test(args)
"     let line_ctxt = getline('.')
"     let header_path = matchstr(line_ctxt, '\c#include\s\+\([<"]\)\zs.\+\ze\([>"]\)$')
"
"     let header_name = matchstr(header_path, '/\w\+\.\a\+$')
"     if empty(header_name)
"         let target = header_path
"     else
"         let target = substitute(header_name, '/', '', '')
"     endif
"
" endfunction
"
" command! -bang -nargs=? -range Test call s:Test(<q-args>)
" nnoremap <silent> <Leader>t :Test! <C-R>=expand("<cword>")<CR> <CR>



