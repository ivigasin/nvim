let g:mapleader="\<Space>"

" Remap <Esc> to jj
imap jj <Esc>

" Navigate between buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" FZF
" map <C-p> :FZF<CR>
" map <C-t> :FZF<CR>

" Clap
map <C-p> :Clap files<CR>
map <C-t> :Clap files<CR>
map <C-b> :Clap buffers<CR>

" File tree
" nmap <silent> <leader><leader> :Lexplore<CR>
" Toggle Lexplore with curent file location
" nmap <silent> <C-\> :Lexplore %:h<CR>
nmap <silent> <leader><leader> :Fern . -drawer -toggle<CR>
" Toggle Lexplore with curent file location
nmap <silent> <C-\> :Fern . -drawer -toggle -reveal=%<CR>

" Coc
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Esearch
let g:esearch = {
  \ 'adapter':    'rg',
  \ 'backend':    'nvim',
  \ 'out':        'qflist',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \ 'default_mappings': 1,
  \}

nnoremap <leader><BS> :nohlsearch<CR> " Turn of highlight for search results
