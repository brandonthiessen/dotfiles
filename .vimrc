set tabstop=4
set shiftwidth=4
set expandtab
set number

set splitbelow
set splitright

" Enable folding
set foldmethod=indent

" Set all folds to open
set foldlevel=99

" Enable folding with the spacebar
nnoremap <Space> za
nnoremap <C-@> :call ToggleTopFolds()<CR>


" First draft of the folding function.
" <Space> to toggle fold locally
" <CTRL + Space> to toggle global fold (one layer deep)
" This is not really working properly but it works *most* of the time
function! ToggleTopFolds()
    " Determine whether to open or close based on foldlevel of current window
    let do_close = 0
    for lnum in range(1, line('$'))
        if foldlevel(lnum) == 1 && foldclosed(lnum) == -1
            let do_close = 1
            break
        endif
    endfor

  " Apply fold toggle to all lines at level 1
    for lnum in range(1, line('$'))
        if foldlevel(lnum) == 1
            execute lnum . 'normal! ' . (do_close ? 'zC' : 'zO')
        endif
    endfor
endfunction



" Highlight all permanently when searching
set hls
set smartcase
set nowrap

set laststatus=2

" Show the visual PEP8 compliance indicator (only in python files)
autocmd FileType python setlocal colorcolumn=80
