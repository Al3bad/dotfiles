syntax on                               " Enable syntax highlighting
set hidden                              " 
set number                              " Show line number
set nowrap                              " No wrap
set mouse=a                             " Support mouse input
set ruler                               " 
set t_Co=256                            " 
set termguicolors                       " Needed for 'colorizer' plugin
set nobackup                            " 
set encoding=utf-8                      " 
set scrolloff=5                         " 
set expandtab tabstop=2 shiftwidth=2    " Convert tap to 4 spaces
set background=dark                     " Dark bg
set clipboard=unnamedplus               " Support clipboard


" If in MacOS, specify python path
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    let g:python3_host_prog = '/usr/local/bin/python3'
  endif
endif

" Plugins
call plug#begin(stdpath('config') . '/plugged')
Plug 'neovim/nvim-lspconfig'                    " LSP: client
Plug 'preservim/nerdtree'                       " NERDTree: File tree
Plug 'Xuyuanp/nerdtree-git-plugin'              " NERDTree: Git status in file tree
Plug 'ryanoasis/vim-devicons'                   " NERDTree: Icon in file tree
Plug 'hrsh7th/nvim-cmp'                         " Completion
Plug 'hrsh7th/cmp-nvim-lsp'                     " Completion
Plug 'hrsh7th/cmp-buffer'                       " Completion
Plug 'hrsh7th/cmp-path'                         " Completion
Plug 'hrsh7th/cmp-cmdline'                      " Completion
Plug 'hrsh7th/cmp-vsnip'                        " Completion engine
Plug 'hrsh7th/vim-vsnip'                        " Completion engine
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make'}
Plug 'ray-x/navigator.lua'
Plug 'vimsence/vimsence'                        " Discord presence
Plug 'joshdick/onedark.vim'                     " Color scheme
Plug 'norcalli/nvim-colorizer.lua'              " Show colors
Plug 'tpope/vim-commentary'                     " Comments (gcc)
" Plug 'cohama/lexima.vim'                        " Auto close parentheses
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'                   " Auto close html tags
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Syntax highlighter
call plug#end()

" Prevent color scheme from changing bg color
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
" Set color scheme for vim
colorscheme onedark

lua << EOF
EOF

