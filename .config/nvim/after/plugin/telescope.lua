require('telescope').setup({
   extensions = {
      coc = {
         prefer_locations = true,
         push_cursor_on_edit = true,
         timeout = 3000,
      },
   },
})
require('telescope').load_extension('coc')

vim.keymap.set('n', '<leader>pf', ':Telescope find_files<CR>')

vim.keymap.set('n', '<leader>cc', ':Telescope coc commands<CR>')
vim.keymap.set('n', '<leader>ce', ':Telescope coc diagnostics<CR>')
