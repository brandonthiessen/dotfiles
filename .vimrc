set tabstop=4
set shiftwidth=4
set expandtab
set number

set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <Space> za
nnoremap <expr> <C-@> &foldlevel ? 'zM' : 'zR'

set hls
set smartcase
set nowrap
