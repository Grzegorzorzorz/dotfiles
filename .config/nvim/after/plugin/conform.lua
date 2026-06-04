require('conform').setup({
   formatters_by_ft = {
      lua = { 'stylua' },
      rust = { 'rustfmt' },
      python = { 'autopep8' },
      json = { 'jq' },
      html = { 'prettier' },
      typescriptreact = { 'prettier' },
      typescript = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
   },
})

require('conform').formatters.stylua = {
   command = '/usr/bin/stylua',
   append_args = {
      '--indent-type',
      'Spaces',
      '--indent-width',
      '3',
      '--column-width',
      '100',
      '--quote-style',
      'ForceSingle',
   },
}

require('conform').formatters.rustfmt = {
   command = '/usr/bin/rustfmt',
}

require('conform').formatters.autopep8 = {
   command = '/usr/bin/autopep8',
}

require('conform').formatters.jq = {
   command = '/usr/bin/jq',
   append_args = {
      '--indent',
      '2',
   },
}

require('conform').formatters.prettier = {
   command = '/home/grzegorz/.local/bin/prettier',
}

vim.api.nvim_create_autocmd('BufWritePre', {
   pattern = '*',
   callback = function(args)
      require('conform').format({ bufnr = args.buf })
   end,
})
