hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "rex"

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

highlight Normal guifg=NvimLightBlue guibg=#000000
highlight Dent guibg=NvimDarkGray2
highlight BadC guibg=NvimDarkGray4 guifg=NvimDarkRed gui=bold
highlight Long guibg=NvimDarkGray4 guifg=NvimLightGray2 gui=bold
highlight Head guifg=NvimDarkGray4 gui=bold
highlight Evil guibg=NvimLightBlue guibg=#000000
highlight Rune guifg=White guibg=#000000
highlight Rine guifg=White guibg=#000000
highlight Cnsr guifg=NvimLightRed guibg=#000000
highlight Type guifg=NvimDarkCyan guibg=#000000
highlight Numb guifg=White guibg=#000000
highlight Cnst guifg=NvimDarkMagenta guibg=#000000
highlight Word guifg=NvimLightGray4 guibg=#000000
highlight Nest guifg=NvimDarkCyan guibg=#000000
highlight Note guifg=NvimDarkGray3 guibg=#000000
highlight Curl guifg=NvimLightCyan guibg=#000000
highlight Cord guifg=NvimLightCyan guibg=#000000
highlight Tape guifg=NvimLightCyan guibg=#000000
highlight Page guifg=NvimLightCyan guibg=#000000
highlight Line guifg=NvimLightCyan guibg=#000000

"            NvimDarkBlue    NvimLightBlue
"            NvimDarkCyan    NvimLightCyan
"            NvimDarkGray1   NvimLightGray1
"            NvimDarkGray2   NvimLightGray2
"            NvimDarkGray3   NvimLightGray3
"            NvimDarkGray4   NvimLightGray4
"            NvimDarkGreen   NvimLightGreen
"            NvimDarkMagenta NvimLightMagenta
"            NvimDarkRed     NvimLightRed
"            NvimDarkYellow  NvimLightYellow
"

set background=dark
