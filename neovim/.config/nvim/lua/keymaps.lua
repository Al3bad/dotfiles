local keymap = vim.keymap.set

--------------------------------------------------
-- Navigation
--------------------------------------------------

-- Insert to normal mode
--- class vim.keymap.set
keymap('i', 'jj', '<ESC>', { desc = 'ESC' })

-- Move lines (up/down)
keymap('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move Down' })
keymap('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move Up' })
keymap('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
keymap('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
keymap('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move Down' })
keymap('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move Up' })

-- Better indenting (left/right)
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

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
