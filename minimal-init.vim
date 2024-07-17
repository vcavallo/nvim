syntax enable

"set term=xterm-256-color

colorscheme rex

autocmd BufRead,BufNewFile *.sire set filetype=rex
autocmd BufRead,BufNewFile *.rex set filetype=rex
autocmd BufRead,BufNewFile *.loot set filetype=rex

colorscheme rex
echom "Colorscheme: " . g:colors_name

set t_Co=256
