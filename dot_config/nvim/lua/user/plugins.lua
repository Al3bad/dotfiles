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
  -- Package manager
  use "wbthomason/packer.nvim"      -- Have packer manage itself

  -- Theme and UI relatd stuff
  use 'joshdick/onedark.vim'
  use "akinsho/bufferline.nvim"
  use "nvim-lualine/lualine.nvim"
  use "lukas-reineke/indent-blankline.nvim" -- Add indentation guides
  use 'tpope/vim-sleuth'                    -- Detect tabstop and shiftwidth automatically
  use "RRethy/vim-illuminate"               -- highlight same words under the cursor
  use "nvim-lua/popup.nvim"                 -- An implementation of the Popup API from vim in Neovim
  use {
    "brenoprata10/nvim-highlight-colors",
    config = function() require("nvim-highlight-colors").setup {} end
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    }
  }
  use {
    "ray-x/lsp_signature.nvim",
    commit = "055b82b98e3c2e4d3ca3300d0b453674ce166237"
  }

  -- Autocompletion
  use {
    "hrsh7th/nvim-cmp",
    requires = {
     "hrsh7th/cmp-nvim-lsp",          -- source for neovim builtin LSP client
     "saadparwaiz1/cmp_luasnip",      -- snippet completions
     "hrsh7th/cmp-buffer",            -- buffer completions
     "hrsh7th/cmp-path",              -- path completions
     "hrsh7th/cmp-cmdline",           -- cmdline completions
     -- Snippet engine
     "L3MON4D3/LuaSnip",
     -- Snippets
     -- "rafamadriz/friendly-snippets"  -- a bunch of snippets to use
    }
  }

  -- Highlight, edit and navigate code (treesitter)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- Additional text objects via treesitter
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }


  use "lewis6991/impatient.nvim"    -- Speed up vim startup
  use "nvim-lua/plenary.nvim"       -- Useful lua functions used ny lots of plugins
  use "lambdalisue/suda.vim"        -- Write file with sudo (:SudoWrite)
  use "moll/vim-bbye"               -- Delete buffers & close files in without closing windows or messing the layout
  use "mg979/vim-visual-multi"      -- multi cursor
  use "junegunn/fzf.vim"            -- fzf
  -- use {
  --   "rrethy/vim-hexokinase",        -- Display color
  --   run = "make hexokinase"
  -- }
  -- use "goolord/alpha-nvim" -- Welcome page
  -- use "ahmedkhalf/project.nvim" -- Project managment tool
  -- use "folke/which-key.nvim" -- Show kay maps in a window

  -- File explorer / tree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Comments & autopairs & surround
  use "numToStr/Comment.nvim"       -- Easily comment stuff
  use {
    "JoosepAlviste/nvim-ts-context-commentstring"
  }
  use "folke/todo-comments.nvim"    -- Highlight todo comments
  use "windwp/nvim-autopairs"       -- Autopairs, integrates with both cmp and treesitter
  use {
    "windwp/nvim-ts-autotag"
  }      -- Auto pair html tags
  use "tpope/vim-surround"          -- Surround text with char/str (ys<>, cs<>, ds<>, vS<>)

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use { 'mhartington/formatter.nvim' }

  -- Fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" }
  }
  use "nvim-telescope/telescope-media-files.nvim"

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable 'make' == 1
  }

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Monitoring (Discord & Wakatime)
  use "wakatime/vim-wakatime" -- WakaTime
  use "andweeb/presence.nvim" -- Discord presence

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

