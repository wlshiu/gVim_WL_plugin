function! OpenWlDoc()
    exec 'sp' $VIMRUNTIME . '/plugin/doc/wl_doc.txt'
endfunction

command! WlDoc :call OpenWlDoc()