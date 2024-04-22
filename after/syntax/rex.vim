runtime colors/ir_black.vim

let g:colors_name = "vcrex"

syntax region Curl start="{" end="}" contains=Curl oneline

syntax match BadC /}/
syntax match Rune /[$!#%&*+,-.\/:<=>?@\\^`|~]\+/
syntax match Rine /^ *\zs[$!#%&*+,-.\/:<=>?@\\^`|~]\+\ze/
syntax match Cnsr /[%_a-zA-Z0-9]\@<![A-Z][A-Z_0-9]*\ze\($\|[^a-zA-Z0-9_]\)/
syntax match Type /[%_a-zA-Z0-9]\@<![A-Z][_A-Z0-9]*[a-z][_a-zA-Z0-9]*\ze\($\|[^a-zA-Z0-9_]\)/
syntax match Numb /[%_a-zA-Z0-9]\@<![0-9][_a-zA-Z0-9]*/
syntax match Word /[%_a-zA-Z0-9]\@<![_a-z][_a-zA-Z0-9]*/
syntax match Cnst /[%][_A-Za-z0-9]\+/
syntax match Nest /[[()\]]/
syntax match Head /^""".*$/
syntax match Line /'''.*$/
syntax match Page /.\zs""".*\ze$/
syntax match Note /;.*$/
syntax match Cord /\zs'[^']*'\ze\($\|[^']\)/
syntax match Tape /\zs"[^"]*"\ze\($\|[^"]\)/
syntax match Long '\%>80v.\+' containedin=ALL
syntax match Evil /\s*$/ containedin=ALL
syntax match Dent /\t/ containedin=ALL

hi Note ctermfg=darkgray
hi Dent ctermbg=lightgreen
hi BadC ctermbg=black ctermfg=white cterm=bold
hi Long ctermbg=black ctermfg=white cterm=bold
hi Head ctermfg=Gray cterm=bold
hi Evil ctermbg=lightgreen
hi Rune ctermfg=lightblue
hi Rine ctermfg=lightblue
hi Cnsr ctermfg=red
hi Type ctermfg=Blue
hi Numb ctermfg=green
hi Cnst ctermfg=White
hi Word ctermfg=gray
hi Nest ctermfg=Magenta cterm=bold
hi Curl ctermfg=White
hi Cord ctermfg=White cterm=bold
hi Tape ctermfg=White cterm=bold
hi Page ctermfg=White
hi Line ctermfg=White

hi StatusLine ctermbg=darkgrey ctermfg=white
hi StatusLineNC ctermbg=black ctermfg=lightgrey
hi VertSplit ctermbg=gray ctermfg=lightgrey
hi LineNr ctermfg=darkgray
hi CursorLine       guifg=NONE        guibg=#121212     gui=NONE      ctermfg=NONE       ctermbg=234    cterm=NONE
hi Function         guifg=#FFD2A7     guibg=NONE        gui=NONE      ctermfg=yellow     ctermbg=NONE   cterm=NONE
hi Visual           guifg=NONE        guibg=#262D51     gui=NONE      ctermfg=NONE       ctermbg=236    cterm=NONE

hi Error            guifg=NONE        guibg=NONE        gui=undercurl ctermfg=16         ctermbg=red    cterm=NONE     guisp=#FF6C60 " undercurl color
hi ErrorMsg         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16         ctermbg=red    cterm=NONE
hi WarningMsg       guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16         ctermbg=red    cterm=NONE
hi SpellBad         guifg=white       guibg=#FF6C60     gui=BOLD      ctermfg=16         ctermbg=160    cterm=NONE

" ir_black doesn't highlight operators for some reason
hi Operator         guifg=#6699CC     guibg=NONE        gui=NONE      ctermfg=lightblue  ctermbg=NONE   cterm=NONE

highlight DiffAdd term=reverse cterm=bold ctermbg=lightgreen ctermfg=16
highlight DiffChange term=reverse cterm=bold ctermbg=lightblue ctermfg=16
highlight DiffText term=reverse cterm=bold ctermbg=lightgray ctermfg=16
highlight DiffDelete term=reverse cterm=bold ctermbg=lightred ctermfg=16

highlight PmenuSel ctermfg=16 ctermbg=156

