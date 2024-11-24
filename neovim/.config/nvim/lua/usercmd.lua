-- Copy the realtive path of the current opend buffer
local usercmd = vim.api.nvim_create_user_command

usercmd('CopyRelPath', "call setreg('+', expand('%'))", {})

-- Close all buffers except the current opened one
usercmd('BufOnly', ':%bd|e#|bd#', {})
