syntax enable
set hidden
set number
set nowrap
set mouse=a
set ruler
set t_Co=256
set nobackup
set encoding=utf-8
set scrolloff=10
set expandtab tabstop=4 shiftwidth=4
set background=dark
set clipboard=unnamedplus

if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    let g:python3_host_prog = '/usr/local/bin/python3'
  endif
endif

call plug#begin(stdpath('config') . '/plugged')
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'vimsence/vimsence'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-commentary'
call plug#end()

lua << EOF

EOF
