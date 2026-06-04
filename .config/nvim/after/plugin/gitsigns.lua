require('gitsigns').setup({
   current_line_blame = true,
})

vim.keymap.set('n', '<leader>gb', ':Gitsigns toggle_current_line_blame<CR>')
