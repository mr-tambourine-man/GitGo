function GetGitUrl(query)
    let split_query = split(a:query)
    let join_query = join(split_query, "+")
    
    let win_url = ":!start https://github.com/search?utf8=%E2%9C%93&q=" . join_query . "&type="
    let mac_url = ":!open https://github.com/search?utf8=%E2%9C%93&q=" . join_query . "&type="
    let others = "silent !sensible-browser" . join_query

    if has('win16') || has('win32') || has('win64')
        execute win_url
    elseif has('mac') || has('macunix') || has('gui_macvim')
        execute mac_url
    else
        execute others
    endif
endfunction

command! -nargs=1 GitGo call GetGitUrl(<f-args>)
