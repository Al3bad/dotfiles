-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end
local opts = { noremap = true, silent = true }

-- Press jj fast to enter
map("i", "jj", "<ESC>", opts)

-- Reload nvim config
map("n", "<leader>.r", ":source ~/.config/nvim/init.lua<CR>", { desc = "Source nvim config" })

-- Open config file
map("n", "<leader>.e", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit nvim config" })

-- open spell_suggest
map("n", "<leader>S", ":Telescope spell_suggest<CR>", { desc = "Spelling Suggestions" })
