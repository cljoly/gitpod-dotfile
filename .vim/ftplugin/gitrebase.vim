command! -buffer -nargs=1 -range SetGitVerb
            \ for l in range(<line1>, <line2>) |
            \     if match(getline(l), '^\(p\|pick\|r\|reword\|e\|edit\|s\|squash\|f\|fixup\) [A-Fa-f0-9]\+ ') != 0 |
            \         continue |
            \     endif |
            \     call setline(l, substitute(getline(l), '^\w\+\ze ', <q-args>, "")) |
            \ endfor

noremap <buffer> <LocalLeader>p :SetGitVerb pick<CR>
noremap <buffer> <LocalLeader>r :SetGitVerb reword<CR>
noremap <buffer> <LocalLeader>e :SetGitVerb edit<CR>
noremap <buffer> <LocalLeader>s :SetGitVerb squash<CR>
noremap <buffer> <LocalLeader>f :SetGitVerb fixup<CR>
vnoremap <buffer> <LocalLeader>p :SetGitVerb pick<CR>
vnoremap <buffer> <LocalLeader>r :SetGitVerb reword<CR>
vnoremap <buffer> <LocalLeader>e :SetGitVerb edit<CR>
vnoremap <buffer> <LocalLeader>s :SetGitVerb squash<CR>
vnoremap <buffer> <LocalLeader>f :SetGitVerb fixup<CR>

" p, pick <commit> = use commit
" r, reword <commit> = use commit, but edit the commit message
" e, edit <commit> = use commit, but stop for amending
" s, squash <commit> = use commit, but meld into previous commit
" f, fixup [-C | -c] <commit> = like "squash" but keep only the previous
"                    commit's log message, unless -C is used, in which case
"                    keep only this commit's message; -c is same as -C but
"                    opens the editor
" x, exec <command> = run command (the rest of the line) using shell
" b, break = stop here (continue rebase later with 'git rebase --continue')
" d, drop <commit> = remove commit
" l, label <label> = label current HEAD with a name
" t, reset <label> = reset HEAD to a label
" m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
" .       create a merge commit using the original merge commit's
" .       message (or the oneline, if no original merge commit was
" .       specified); use -c <commit> to reword the commit message

" Gina inspired shortcuts
nmap <buffer> <CR>  <cmd>norm! 0w<CR><Cmd>lua require("cj.git").open_commit()<CR>
nmap <buffer> g<CR>  <cmd>norm! 0w<CR><Cmd>lua require("cj.git").open_diffview()<CR>
