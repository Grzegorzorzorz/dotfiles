set encoding=UTF-8

let s:core_conf_files = [
	\ 'plugins.vim',
	\ 'mappings.vim',
	\ 'globals.vim',
	\ 'theming.vim',
	\ 'options.vim',
	\ ]

for s:fname in s:core_conf_files
	execute printf('source %s/%s', stdpath('config'), s:fname)
endfor

lua require('init-lua')
