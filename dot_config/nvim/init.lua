-------------------------------------------------
-- --> Vim Options
-------------------------------------------------

local options = {
  backup = false,                          -- creates a backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  swapfile = false,                        -- creates a swapfile
  --
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  wrap = false,                            -- display lines as one long line
  --
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  scrolloff = 2,                           -- is one of my fav
  sidescrolloff = 4,
  --
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  showtabline = 2,                         -- always show tabs
  --
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  --
  list = true,
  listchars = { tab = '\\', trail = '.' },
  --
  mouse = "a",                             -- allow the mouse to be used in neovim
  fileencoding = "utf-8",                  -- the encoding written to a file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  -- timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  cursorline = true,                       -- highlight the current line
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-------------------------------------------------
-- --> General keymaps
-------------------------------------------------

local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<leader><leader>r", ":source ~/.config/nvim/init.lua<CR>", opts)

-- Normal --
-- Toggle spell checkier
keymap("n", "<leader>ss", ":setlocal spell!<CR>", opts)

-- Split windows/panes
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)

-- Window/pane navigation
keymap("n", "sh", "<C-w>h", opts)
keymap("n", "sj", "<C-w>j", opts)
keymap("n", "sk", "<C-w>k", opts)
keymap("n", "sl", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)
keymap("n", "<A-Down>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-Up>", "<Esc>:m .-2<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)


-------------------------------------------------
-- --> Plugins
-------------------------------------------------

require "user.plugins"

-------------------------------------------------
-- --> Plugins config
-------------------------------------------------

require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comments"
require "user.todo-comments"
require "user.nvim-tree"
require "user.indentline"
require "user.bufferline"
require "user.lualine"
require "user.gitsigns"
require "user.toggleterm"
require "user.presence"

-- vim-hexokinase plugin
vim.g.Hexokinase_highlighters = { "backgroundfull" }
vim.g.Hexokinase_optInPatterns = "full_hex,triple_hex,rgb,rgba,hsl,hsla"

-------------------------------------------------
-- --> Plugins keymaps
-------------------------------------------------

-- File explorer (nvim-tree plugin) --
keymap("n", "<C-b>",":NvimTreeToggle<CR>", opts)
-- nnoremap <leader>r :NvimTreeRefresh<CR>
-- nnoremap <leader>n :NvimTreeFindFile<CR>

-- Terminal (toggleterm plugin) --
keymap('n', '<leader>th', ":ToggleTerm size=10 direction=horizontal<CR>", opts)
keymap('n', '<leader>tf', ":ToggleTerm direction=float<CR>", opts)
keymap('n', '<leader>tf', ":ToggleTerm direction=float<CR>", opts)

-- Telescope (telescope plugin) --
-- nnoremap <leader>ff :Telescope find_files<cr>
-- nnoremap <leader>fg :Telescope live_grep<cr>
-- nnoremap <leader>fb :Telescope buffers<cr>
-- nnoremap <leader>fh :Telescope help_tags<cr>
keymap("n", "<leader>ff", ":lua require'telescope.builtin'.find_files(require('telescope.themes').get_ivy())<CR>", opts)
keymap("n", "<leader>fg", ":lua require'telescope.builtin'.live_grep(require('telescope.themes').get_ivy())<CR>", opts)
keymap("n", "<leader>fb", ":lua require'telescope.builtin'.buffers(require('telescope.themes').get_ivy())<CR>", opts)
keymap("n", "<leader>fh", ":lua require'telescope.builtin'.help_tags(require('telescope.themes').get_ivy())<CR>", opts)
keymap("n", "<leader>fm", ":lua require('telescope').extensions.media_files.media_files()<CR>", opts)
keymap("n", "<leader>sg", ":lua require'telescope.builtin'.spell_suggest(require('telescope.themes').get_ivy())<CR>", opts)

keymap('n', '<a-n>', ':lua require"illuminate".next_reference{wrap=true}<cr>', opts)
keymap('n', '<a-p>', ':lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)

-------------------------------------------------
-- --> user defined functions
-------------------------------------------------
function remove_trailling_whitespaces ()
  vim.api.nvim_command("%s/\\s\\+$//e")
end

