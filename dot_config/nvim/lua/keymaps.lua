-- [[ Basic Keymaps ]]
-- NOTE: plugin specific keymaps can be found in the plugin files
local keymap = vim.keymap.set --  See `:help vim.keymap.set()`

--------------------------------------------------
-- Navigation
--------------------------------------------------

-- Insert to normal mode
keymap('i', 'jj', '<ESC>', { desc = 'ESC' })

--  Exit terminal mode in the builtin terminal
keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Navigate buffers
keymap('n', '<S-l>', '<cmd>bn<cr>', { desc = 'Next buffer', silent = true })
keymap('n', ']b', '<cmd>bn<cr>', { desc = 'Next buffer', silent = true })
keymap('n', '<S-h>', '<cmd>bp<cr>', { desc = 'Previous buffer', silent = true })
keymap('n', '[b', '<cmd>bp<cr>', { desc = 'Previous buffer', silent = true })

--------------------------------------------------
-- UI
--------------------------------------------------

-- Redraw UI
keymap('n', '<leader>ur', '<cmd>noh<cr><cmd>redraw<cr><c-l>', { desc = 'Redraw and clear hlsearch' })

-- Clear highlight search on pressing <Esc> in normal mode
keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')

--------------------------------------------------
-- Misc
--------------------------------------------------

-- Diagnostic keymaps
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
keymap('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
