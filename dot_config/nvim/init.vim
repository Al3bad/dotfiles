syntax enable
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


call plug#begin(stdpath("data") . "/plugged")
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vimsence/vimsence'
Plug 'chrisbra/Colorizer'
call plug#end()

lua << EOF
-- Comment plugin    
require("nvim_comment").setup({
  -- Linters prefer comment and line to have a space in between markers
  marker_padding = true,
  -- should comment out empty or whitespace only lines
  comment_empty = true,
  -- Should key mappings be created
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "<C-_>", -- key binding for Ctrl + /
  -- Visual/Operator mapping left hand side
  operator_mapping = "gc",
  -- Hook function to call before commenting takes place
  hook = nil
})
EOF
