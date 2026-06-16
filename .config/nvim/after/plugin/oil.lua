require('oil').setup({
   default_file_explorer = true,
   float = {
      padding = 2,
      max_width = 0.80,
      max_height = 0.9,
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
      preview_split = 'right',
   },
   confirmation = {
      border = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
   },
})

vim.keymap.set('n', '<leader>pv', ':Oil --float<CR>')
