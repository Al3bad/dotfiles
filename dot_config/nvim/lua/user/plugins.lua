local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "lambdalisue/suda.vim" -- Write file with sudo (:SudoWrite)
  use "moll/vim-bbye" -- Delete buffers & close files in without closing windows or messing the layout
  use "lukas-reineke/indent-blankline.nvim"
  use "mg979/vim-visual-multi" -- multi cursor
  use "RRethy/vim-illuminate" -- highlight same words under the cursor
  use {
    "rrethy/vim-hexokinase",  -- Display color
    run = "make hexokinase"
  }
  -- use "goolord/alpha-nvim" -- Welcome page
  -- use "ahmedkhalf/project.nvim" -- Project managment tool
  -- use "lewis6991/impatient.nvim" -- Speed up vim startup
  -- use "folke/which-key.nvim" -- Show kay maps in a window
  
  -- Sesstion management
  use "tpope/vim-obsession"

  -- Colorschemes
  use 'joshdick/onedark.vim'

  -- File explorer / tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Comments & autopairs & surround
  -- use { "numToStr/Comment.nvim", commit = "0aaea32f27315e2a99ba4c12ab9def5cbb4842e4" } -- for neovim version < 7
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use "folke/todo-comments.nvim"
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-ts-autotag" -- Auto pair html tags
  use "tpope/vim-surround" -- Surround text with char/str (ys<>, cs<>, ds<>, vS<>)

  -- Statusline
  use "akinsho/bufferline.nvim"
  use "nvim-lualine/lualine.nvim"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "ray-x/lsp_signature.nvim"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  -- Treesitter & syntax highlighting
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Monitoring (Discord & Wakatime)
  use "wakatime/vim-wakatime" -- WakaTime
  use "andweeb/presence.nvim" -- Discord presence

  -- For matlab (uninstall it when the semester ends)
  use "MortenStabenau/matlab-vim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

