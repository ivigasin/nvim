function! PackagerInit() abort
  packadd vim-packager
  call packager#init()
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  " call packager#add('morhetz/gruvbox')
  " call packager#add('ayu-theme/ayu-vim')
  " call packager#add('liuchengxu/space-vim-theme')
  " call packager#add('challenger-deep-theme/vim', { 'as': 'challenger-deep' })
  " call packager#add('jacoborus/tender.vim')
  " call packager#add('arcticicestudio/nord-vim')
  call packager#add('meck/nord-vim') " the fork with vim-clap support
  call packager#add('Shougo/vimproc.vim', {'do' : 'make'})
  call packager#add('ryanoasis/vim-devicons')
  call packager#add('neoclide/coc.nvim', {'branch': 'release'})
  call packager#add('vim-airline/vim-airline')
  call packager#add('vim-airline/vim-airline-themes')
  call packager#add('mhinz/vim-startify')
  call packager#add('tpope/vim-commentary')
  call packager#add('tpope/vim-obsession')
  call packager#add('tpope/vim-sensible')
  call packager#add('tpope/vim-surround')
  call packager#add('tpope/vim-repeat')
  call packager#add('tpope/vim-fugitive')
  call packager#add('tpope/vim-unimpaired') " map [ and ] directly
  call packager#add('eugen0329/vim-esearch')
  call packager#add('suy/vim-context-commentstring')
  call packager#add('HerringtonDarkholme/yats.vim')
  " call packager#add('easymotion/vim-easymotion') " brakes Fern toggle
  call packager#add('terryma/vim-multiple-cursors')
  call packager#add('RRethy/vim-hexokinase', { 'do': 'make hexokinase' })
  call packager#add('liuchengxu/vim-clap', { 'do': ':Clap install-binary!' })
  call packager#add('lambdalisue/fern.vim')
  call packager#add('lambdalisue/fern-renderer-devicons.vim')
  call packager#add('chaoren/vim-wordmotion')
  call packager#add('scrooloose/nerdtree')
endfunction

command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()



