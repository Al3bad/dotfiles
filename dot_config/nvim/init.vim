"################################################
" --> General Config
"################################################
syntax on                               " Enable syntax highlighting
set hidden                              " 
set nobackup                            " 
set number                              " Show line number
set nowrap                              " No wrap
set mouse=a                             " Support mouse input
set ruler                               " 
set t_Co=256                            " 
set termguicolors                       " Needed for 'colorizer' plugin
set encoding=utf-8                      " 
set scrolloff=3                         " 
set expandtab tabstop=2 shiftwidth=2    " Convert tap to 2 spaces
set background=dark                     " Dark bg
set clipboard=unnamedplus               " Support clipboard
set path+=**
set smartcase
set cursorline
set list
set listchars=tab:\ ,trail:.

" Change leader key to space
let mapleader = " "

" Use the terminal bg color after applying the color scheme
autocmd ColorScheme * hi Normal ctermbg=NONE guibg=NONE

"################################################
" --> MacOS: Python path
"################################################
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    let g:python3_host_prog = '/usr/local/bin/python3'
  endif
endif

"################################################
" --> Plugins
"################################################

call plug#begin(stdpath('config') . '/plugged')
Plug 'lambdalisue/suda.vim'                         " Write file with sudo (:SudoWrite)
Plug 'mg979/vim-visual-multi'                       " Add multiple cursor
Plug 'windwp/nvim-autopairs'                        " Auto pair bracket
Plug 'windwp/nvim-ts-autotag'                       " Auto pair html tags
Plug 'tpope/vim-surround'                           " Surround text with char/str (ys<>, cs<>, ds<>, vS<>)
Plug 'tpope/vim-commentary'                         " Comments
Plug 'JoosepAlviste/nvim-ts-context-commentstring'  " Comment based on the cursor location
" Syntax highlighting (useed by lsp servers)
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Navigator
Plug 'ray-x/navigator.lua'
Plug 'ray-x/lsp_signature.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Emmet plugin
Plug 'mattn/emmet-vim'
" Plug 'sbdchd/neoformat'   " TODO: Use 'ale' plugin instead?
" Plug 'MaxMEllon/vim-jsx-pretty'                 " Distinguish js and jsx file
" LSP
Plug 'neovim/nvim-lspconfig'                    " LSP: client
" Auto Completion/Suggestion
Plug 'hrsh7th/nvim-cmp'                         " Completion
Plug 'hrsh7th/cmp-nvim-lsp'                     " Completion
Plug 'hrsh7th/cmp-buffer'                       " Completion
Plug 'hrsh7th/cmp-path'                         " Completion
Plug 'hrsh7th/cmp-cmdline'                      " Completion
Plug 'hrsh7th/cmp-vsnip'                        " Completion engine
Plug 'hrsh7th/vim-vsnip'                        " Completion engine
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make'}
" Theme/Style
Plug 'joshdick/onedark.vim'                     " Color scheme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'              " Show colors
" NERD Tree
Plug 'preservim/nerdtree'                       " NERDTree: File tree
Plug 'Xuyuanp/nerdtree-git-plugin'              " NERDTree: Git status in file tree
Plug 'ryanoasis/vim-devicons'                   " NERDTree: Icon in file tree
" Monitoring
Plug 'wakatime/vim-wakatime'                    " WakaTime
Plug 'vimsence/vimsence'                        " Discord presence
call plug#end()

"################################################
" --> Plugin Config
"################################################
 
colorscheme onedark                                   " Set color scheme for vim
" :so ~/.config/nvim/plugins/vim-surround.vim        " Custom surrounding
:so ~/.config/nvim/plugins/vim-visual-multi.vim    " Enable mouse to add cursors
" :so ~/.config/nvim/plugins/vim-commentary.vim    " Support more file types
:so ~/.config/nvim/plugins/nvim-treesitter.vim
:so ~/.config/nvim/plugins/telescope.vim
:so ~/.config/nvim/plugins/nvim-lspconfig.vim
:so ~/.config/nvim/plugins/vimsence.vim
:so ~/.config/nvim/plugins/nerdtree.vim
:so ~/.config/nvim/plugins/vim-airline.vim

"################################################
" --> General key bindings
"################################################


" Toggle spell checker
map <leader>s :setlocal spell!<CR>

" Open current file/link in the default program
function! s:open_link() abort
    let file = expand('<cfile>')
    if isdirectory(file) 
        execute 'edit' file
    else
        call jobstart(['xdg-open', file], {'detach': v:true})
    endif
endfunction
map <leader>o <Cmd>call s:open_link()<CR>

" Remap Esc key
inoremap ;; <Esc>

" Tab navigation
nnoremap tp :bprevious<CR>
nnoremap tn :bnext<CR>

" Split pane
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Pane navigation 
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<right> <C-w>l
map s<up> <C-w>k
map s<down> <C-w>j
map sh <C-w>h
map sl <C-w>l
map sk <C-w>k
map sj <C-w>j

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

"################################################
" --> LUA Code
"################################################

lua << EOF
EOF

