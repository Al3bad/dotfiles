-- Copy the realtive path of the current opend buffer
local usercmd = vim.api.nvim_create_user_command

usercmd('CopyRelPath', "call setreg('+', expand('%'))", {})
