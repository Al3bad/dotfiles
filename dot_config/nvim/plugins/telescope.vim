" Find files using Telescope command-line sugar.
nnoremap <leader>ff :Telescope find_files<cr>
nnoremap <leader>fg :Telescope live_grep<cr>
nnoremap <leader>fb :Telescope buffers<cr>
nnoremap <leader>fh :Telescope help_tags<cr>

lua << EOF
  require('telescope').setup{
    -- ...
    defaults = { file_ignore_patterns = {"node_modules", "OneDrive", "onedrive"} }
   }
EOF
