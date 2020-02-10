" General settings {{{
set shell=/bin/bash "Fix for Fugitive issue https://github.com/tpope/vim-fugitive/issues/756

filetype plugin indent on
syntax enable
set modelines=1
set laststatus=2        " Always display statusline.
set background=dark
set cursorline
set showcmd             " Shows the last command entered in the very bottom right
set lazyredraw          " Redraw only when we need to.
set showmatch           " Highlight matching [{()}]
set incsearch           " Enable incremental search.
set mouse=a             " Enable mouse
command! W write        " Setup :W same as :w
set cmdheight=2         " Better display for messages
set updatetime=300      " You will have bad experience for diagnostic messages when it's default 4000.
set shortmess+=c        " Don't give |ins-completion-menu| messages.
set signcolumn=yes      " Always show signcolumns - like git gutter
set pumblend=20         " Transparent popups
set inccommand=nosplit  " Live substitution

" Enhanced command completion
set wildmenu
set encoding=utf-8
scriptencoding utf-8

" Spaces and tabs
set expandtab           " Tabs are spaces
set tabstop=2
set softtabstop=2

set foldenable          " enable folding
set foldmethod=syntax
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" If you have v >=8.0 or Neov >= 0.1.5
if (has("termguicolors"))
  set termguicolors
endif
" }}}

" Integration with system clipboard: {{{
set clipboard+=unnamedplus
set breakindent showbreak=\ \ \ \ ↪\ "To not trim the space on the end
" }}}

" Persistent Undo {{{
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  set noswapfile
  silent !mkdir ~/.cache/nvim/backups > /dev/null 2>&1
  set undodir=~/.cache/nvim/backups
  set undofile
endif
" }}}

" Toggle line numbers {{{
" Disabled. TODO: find how to disable in drawers like Fern
" set number
" set norelativenumber
" nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
" function! ToggleRelativeAbsoluteNumber()
"   if !&number && !&relativenumber
"     set number
"     set norelativenumber
"   elseif &number && !&relativenumber
"     set nonumber
"     set relativenumber
"   elseif !&number && &relativenumber
"     set number
"     set relativenumber
"   elseif &number && &relativenumber
"     set nonumber
"     set norelativenumber
"   endif
" endfunction
" }}}

" Autoread and autosave {{{
" set autoread " set by vim-sensible
autocmd BufEnter,FocusGained * checktime
augroup focus
  autocmd!
  autocmd TabLeave * silent! wall
  autocmd FocusLost * silent! wall
  autocmd BufLeave * silent! wall
augroup END
" Autosave on CursorHold
" autocmd CursorHold * :w " Fires error on bufers like NERDTree

set autowriteall
" }}}

" Go to definition {{{
" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> gd :call CocAction('jumpDefinition', 'drop')<CR>
" }}}

" Packages specific {{{
" Airline {{{
" -- INSERT -- is unnecessary anymore because the mode information is displayed in the statusline
set noshowmode
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" }}}
" Fugitive {{{
set diffopt+=vertical
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" }}}
" Netrw {{{
" https://shapeshed.com/vim-netrw/
" https://gist.github.com/danidiaz/37a69305e2ed3319bfff9631175c5d0f#file-netrw-txt
let g:netrw_banner = 0     " Hide annoying 'help' banner
let g:netrw_liststyle = 3  " Use tree view
let g:netrw_winsize = '15' " Smaller default window size
" }}}
" Fern {{{
let g:fern#renderer = "devicons"
" }}}
" Clap {{{
let g:clap_layout = { 'width': '67%', 'height': '75%', 'row': 4, 'col': '17%' }
" }}}
" Vim hexokinase {{{
let g:Hexokinase_highlighters = ['sign_column']
let g:Hexokinase_ftEnabled = ['css', 'scss', 'html', 'javascript', 'typescript']
let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]
" }}}
" Vim Startify {{{
    let g:startify_custom_header = []
    let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
" }}}
" }}}

" Reload this config on save {{{
augroup vimrc     " Source configuration upon save
  " autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  " autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
  autocmd! BufWritePost bindings.vim,init.vim,install.vim,plugins.vim,settings.vim,theme.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
" }}}

" Use transparend background {{{
" Must be after theme initialization
" let s:background_color="NONE"
" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE
" }}}

" Shouldn't have a comments after
" vim: syntax=vim foldmethod=marker:foldlevel=0:foldlevelstart=0
