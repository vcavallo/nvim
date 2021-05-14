set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call plug#begin('~/.config/nvim/bundle')

" Plugin 'VundleVim/Vundle.vim'

Plug 'tpope/vim-fugitive'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/NERDCommenter'
Plug 'bling/vim-airline'
Plug 'lokaltog/vim-easymotion'
Plug 'Valloric/vim-indent-guides'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-vinegar'
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'fenetikm/falcon'
Plug 'flazz/vim-colorschemes'
Plug 'mhinz/vim-startify'
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'fatih/vim-go'
Plug 'leafgarland/typescript-vim'
Plug 'prettier/vim-prettier'
Plug 'dense-analysis/ale'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'alok/notational-fzf-vim'
" Plug 'fiatjaf/neuron.vim'
Plug 'chiefnoah/neuron-v2.vim'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'pgdouyon/vim-yin-yang'
Plug 'gabrielelana/vim-markdown'
Plug 'xolox/vim-colorscheme-switcher'

Plug 'dhruvasagar/vim-table-mode'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
call plug#end()            " required
filetype plugin indent on    " required

let g:path_neuron = "/home/vcavallo/.nix-profile/bin/neuron"


" Java

""
" " need to npm-install prettier
  let g:prettier#exec_cmd_path = "~/.npm-global/bin/prettier"
" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_config_files = [".prettierrc"]
 let g:prettier#autoformat = 0
 " autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html Prettier
" autocmd BufRead *.md let g:prettier#config#prose_wrap = 'always'
"
let g:deoplete#enable_at_startup = 0

" " set up fzf
set rtp+=~/.fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

nnoremap <leader>ff :FzfFiles<return>
nmap <C-P> :FzfFiles!<return>
nnoremap <leader>fa :FzfAg!<return>
nnoremap <leader>fr :FzfRg!<return>
nnoremap <leader>fg :FzfGFiles<return>
nnoremap <leader>fb :FzfBuffers<return>
nnoremap <leader>ft :FzfTags<return>

set shortmess=IA

"" Startfiy settings

"" Turning it off for now
let g:startify_disable_at_vimenter = 1

" notational-fzf-vim settings
let g:nv_search_paths = [
  \ '~/Dropbox/nvALT',
  \ '~/Dropbox/nvALT_archive',
  \ '~/Dropbox/journal',
  \ '~/Dropbox/wiki/notes',
  \ '~/Dropbox/Documents',
  \ '~/zettelkasten',
  \ '~/private-zettelkasten',
  \ '~/Desktop']

"let g:nv_python_path='/home/vcavallo/anaconda3/bin/python3'
"let g:nv_python_path='/usr/bin/python3.6m'

let g:nv_use_short_pathnames=0 " not ok with python version
let g:nv_create_note_window = 'split' " tabedit
let g:nv_window_direction = 'down'
let g:nv_window_width = '75%'
let g:nv_preview_direction = 'up'
nnoremap <leader>nv :NV<cr>

" for when you have a new buffer and you want to save it directly
" to the notes directory. Filename defautls to first line, but can
" be changed after calling the funciton.
function! SaveFileToNotes()
  let l:filename = input('filename:', getline(1))
  execute "write " . "~/Dropbox/nvALT/".l:filename.".md"
endfunction
nnoremap <leader>nnv :call SaveFileToNotes()<cr>

"" map 'jj' to 'exit insert mode' "
:imap jj <Esc>

"" unmap Shift+k to avoid annoying man entry halting thing "
:map <S-k> <Nop>

"" %% on command line will give you current path of buffer
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"" display
set wrap
set synmaxcol=999
set linebreak " wrap lines at convenient points

""vertical/horizontal scroll off settings
set scrolloff=10
set sidescrolloff=7
set sidescroll=1
set showmatch " show matching bracket
set matchtime=2 " for 0.2 seconds
set matchpairs+=<:> " for html
set laststatus=2 " 2 line status bar
set number
"" syntax on
syntax enable
set background=dark
"" colorscheme smyck
"" colorscheme solarized
"" colorscheme tender
"" colorscheme gruvbox
"" colorscheme falcon
"" colorscheme apprentice
"" let g:solarized_termtrans = 1
"" low-impact colorschemes i like:
"" apprentice, paramount, seoul256
"" colorscheme seoul256
" colorscheme preto
" colorscheme grb256
" colorscheme monokai-phoenix
" colorscheme yin
" murphy
" koehler
" colorscheme paramount
" colorscheme apprentice

colorscheme grb256

""" Switch colorschemes when entering and exiting markdown files
""" update this whenever changing base scheme:
""" .... actually don't use this. it seems to break italics.
"autocmd BufLeave *.md,*.markdown colorscheme grb256
"autocmd BufEnter,BufRead,BufNewFile *.md,*.markdown colorscheme tender

set colorcolumn=85 " show right margin
nnoremap <Leader>m :set colorcolumn=0<cr>
nnoremap <Leader>mm :set colorcolumn=85<cr>

"" save and close mappings to avoid accidental :q when trying to :w
map <Leader>ww :w<CR>
map <Leader>zz :q<CR>
map <Leader>qq :q!<CR>

" insert datestamp
nmap <Leader>ts i<C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <Leader>ts <C-R>=strftime("%Y-%m-%d")<CR>

"" toggle paste modes
map <Leader>vv :set invpaste paste?<CR>
"
"" enter paste mode, paste at current indent level from clipboard, leave paste mode
map <Leader>p <Leader>vv"*]p<Leader>vv
"
"" from this line, drop down one and then add blank lines above and below new
"" position
map <leader>o o<cr><C-o>O
"
" " in insert mode, open newline above current cursor and go there
inoremap <C-k> <C-o><S-o>
"
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+' " hide dotfiles by default in netrw/vinegar
"
"" editing
set ignorecase " ignore case for searching unless using uppercase letters
set smartcase
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab " turn tabs into spaces
"
"" use shift-tab to insert tabs in INSERT mode
inoremap <S-Tab> <C-V><Tab>
"
" " maps  /     - yes, '/' for some reason vim uses _ for / here
" " nnoremap <C-_>:Ack!<Space>
cnoreabbrev Ack Ack!
"
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif
"
"
" augroup BgHighlight
"     autocmd!
"     autocmd WinEnter * set colorcolumn=80
"     " autocmd WinEnter * set cul
"
"     autocmd WinLeave * set colorcolumn=0
"     " autocmd WinLeave * set nocul
" augroup END
"
vmap <C-c>:w !pbcopy<CR><CR>
"
"""" splitting "
"" set default split opening to bottom and right: "
set splitbelow
set splitright
" " open vertical split:
nnoremap <silent> vv <C-w>v
" " open horizontal split:
nnoremap <silent> vs <C-w>s
"
"" remove need for C-w before navigating "
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
"" make the C-X C-F menu better
"" (https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE)
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"" toggle to previous buffer
map <leader>bb <C-^>
"
"" RSpec.vim mappings
autocmd FileType ruby nmap <Leader>t :call RunCurrentSpecFile()<CR>
autocmd FileType ruby nmap <Leader>s :call RunNearestSpec()<CR>
autocmd FileType ruby nmap <Leader>l :call RunLastSpec()<CR>
autocmd FileType ruby nmap <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bin/rspec {spec}"
"
"" Cucumber mappings
"" Run currently open cucumber feature file
" "map <Leader>ct :w<cr>:!cucumber %<cr>
"
""" Run current cucumber scenario
" "map <Leader>cs :w<cr>:exe "!cucumber %" . ":" . line(".")<cr>
"
""" Run all cucumber feature files
""map <Leader>ca :w<cr>:!cucumber<cr>
"
autocmd BufRead,BufNewFile *.less set filetype=css
autocmd BufRead,BufNewFile *.less set syntax=css
autocmd BufRead,BufNewFile *.scss* set filetype=scss.css
autocmd BufRead,BufNewFile *.scss* set syntax=scss.css
autocmd BufRead,BufNewFile *.jbuilder* set filetype=ruby
autocmd BufRead,BufNewFile *.jbuilder* set syntax=ruby
autocmd BufRead,BufNewFile *.ledger,*.journal set filetype=ledger
autocmd BufRead,BufNewFile *.ledger,*.journal set syntax=ledger
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn set filetype=markdown
"autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn set formatoptions+=a " auto-re-wrap lines. also remember to use `gwap`
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn set textwidth=80
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal syntax=markdown
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal spell
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal wrap linebreak

autocmd BufRead,BufNewFile *.md,*.markdown setlocal conceallevel=1
autocmd BufRead,BufNewFile todo.txt setlocal nospell
autocmd BufRead,BufNewFile *.c setlocal tabstop=8
autocmd BufRead,BufNewFile *.c setlocal shiftwidth=8
autocmd FileType help setlocal nospell

let g:jsx_ext_required = 0 " allows jsx in .js files
let g:polyglot_disabled = ['js']

"" if you give a file the .die extension, it won't be saved/saveable
autocmd BufRead,BufNewFile *.die setlocal buftype=nofile
autocmd BufRead,BufNewFile *.die setlocal bufhidden=hide
autocmd BufRead,BufNewFile *.die setlocal noswapfile

au FileType xhtml,xml so ~/.vim/bundle/html-autoclosetag.vim

" autocmd FileType go nmap <leader>b :GoBuild<CR>
" autocmd FileType go nmap <leader>r :GoRun<CR>
" autocmd FileType go nmap <leader>t :GoTest<CR>
" autocmd FileType go nmap <leader>s :GoTestFunc<CR>
" autocmd FileType go nmap <leader>g :GoFmt<CR>

" " let g:go_gopls_enabled = 0
" " since the above is off, COC will handle these
" let g:go_gopls_options = ['-remote=auto']
" let g:go_referrers_mode = 'gopls'
" let g:go_def_mode='gopls'
" let g:go_info_mode='gopls'
" " disable vim-go def mapping so COC can do it
" let g:go_def_mapping_enabled = 0
" let g:go_info_mapping_enabled = 0
" let g:go_referrers_mapping_enabled = 0
" 
" let g:go_auto_type_info = 1
" let g:go_auto_sameids = 1
" let g:go_fmt_command = "gofmt"
" set updatetime=100

" F12 re-syncs syntax if it gets screwed up
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" vimwiki
 let wiki_trunk = {}
 let wiki_trunk.path = '~/Dropbox/wiki/notes'
 let wiki_trunk.ext = '.md'
 let wiki_trunk.syntax = 'markdown'
 let wiki_trunk.links_space_char = '-'

 let zettel_trunk = {}
 let zettel_trunk.path = '~/zettelkasten'
 let zettel_trunk.syntax = 'markdown'
 let zettel_trunk.ext = '.md'
 let zettel_trunk.links_space_char = '-'

let g:vimwiki_list = [wiki_trunk, zettel_trunk]

" remove the '-' mapping to allow vim vinegar to open:
nmap <Nop> <Plug>VimwikiRemoveHeaderLevel

nmap <Leader>wo <Plug>VimwikiIndex

" let g:zettel_format = "%Y%m%d%H%M%S"
" let g:zettel_date_format = "%Y-%m-%d"
" " let g:zettel_options = [{}, {"template" :  "~/Dropbox/zettelkasten/zettel_template.tpl"}]
" " let g:zettel_default_mappings
" " let g:zettel_fzf_command
" " let g:zettel_fzf_options
" " let g:zettel_backlinks_title
" " let g:zettel_fzf_options = ['--exact', '--tiebreak=end']
" " let g:zettel_link_format="[%title](%link)"
" nnoremap <leader>zn :ZettelNew<space>
" nnoremap <leader>zko :ZettelOpen<cr>
" nnoremap <leader>zki :ZettelInsertNote<cr>
" nnoremap <leader>zky :ZettelYankName<cr>
"
"" let g:zettel_default_mappings = 0
"" " This is basically the same as the default configuration
"" augroup filetype_vimwiki
""   autocmd!
""   autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
""   autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
""   autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
""   autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
"" augroup END
"
let g:syntastic_mode_map={ 'mode': 'active',
                      \ 'active_filetypes': [],
                      \ 'passive_filetypes': ['html'] }

" autosave on lost focus "
autocmd BufLeave,FocusLost * silent! wall
:au FocusLost * silent! wa

" Use pp to _add_ the (Z) priority to a task
" for tasks that already have priority, use p(n) to reprioritize
" **only applies to files named 'todo.txt'!**
autocmd BufRead,BufNewFile todo.txt nnoremap gpa :s/(\w)/(A)/g<cr>:noh<esc>
autocmd BufRead,BufNewFile todo.txt nnoremap gpb :s/(\w)/(B)/g<cr>:noh<esc>
autocmd BufRead,BufNewFile todo.txt nnoremap gpc :s/(\w)/(C)/g<cr>:noh<esc>
autocmd BufRead,BufNewFile todo.txt nnoremap gpd :s/(\w)/(D)/g<cr>:noh<esc>
autocmd BufRead,BufNewFile todo.txt nnoremap gpx :s/(\w)/(X)/g<cr>:noh<esc>
autocmd BufRead,BufNewFile todo.txt nnoremap gpz :s/(\w)/(Z)/g<cr>:noh<esc>
autocmd BufRead,BufNewFile todo.txt nnoremap gpp ^i(Z) <esc>

:map tt :Vexplore<cr>

"resize splits on focus:
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999

"" highlight current line
set nocursorline
"" highlight current column
" set cursorcolumn

" Toggle relative line number
 function! NumberToggle()
   if(&relativenumber)
     set norelativenumber
     set number
   else
     set relativenumber
     set number
   endif
 endfunc
 nnoremap <C-n> :call NumberToggle()<cr>
 nnoremap <Leader>n :call NumberToggle()<cr>

" settings from scrooloose:

"allow backspacing over everything in insert mode
set backspace=indent,eol,start
" ctrl-backspace over entire word in insert mode
imap <C-BS> <C-W>

"store lots of :cmdline history
set history=1000

"show incomplete cmds down the bottom
set showcmd

"show current mode down the bottom
set showmode

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

if v:version >= 703
	"undo settings
	set undodir=~/.vim/undofiles
	set undofile
endif

""folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll through matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

 set formatoptions-=o "dont continue comments when pushing o/O

""load ftplugins and indent files
filetype plugin on
filetype indent on
"
""some stuff to get the mouse going in term
" set mouse=a
"if !has('nvim')
" " more nvim commenting
"  set ttymouse=xterm2
"endif
"
""tell the term has 256 colors
set t_Co=256

""hide buffers when not displayed
set hidden

"Airline theme setup:
" let g:airline_theme='kalisi'
" let g:airline_theme='gruvbox'
" let g:airline_theme='zenburn'
" let g:airline_theme='tender'
let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline#extensions#branch#enabled= 0

" let g:airline_theme='distinguished'
let g:airline_theme='raven'

" let g:ale_linters = {
" \   'javascript': ['eslint'],
" \   'typescript': ['tsserver', 'tslint'],
" \   'vue': ['eslint']
" \}

" COC
let g:coc_node_path = "/usr/bin/node"
" let g:coc_global_extensions = "/home/vcavallo/.config/coc/extensions"

" jumping to next and previous diagnostics
try
    nmap <silent> ]c :call CocAction('diagnosticNext')<cr>
    nmap <silent> [c :call CocAction('diagnosticPrevious')<cr>
endtry
nmap <leader>d :CocDiagnostics<cr>
nnoremap <silent> <C-Space> :call CocActionAsync('doHover')<cr>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" automatically select first item
inoremap <silent><expr> <c-y> pumvisible() ? coc#_select_confirm() : "\<c-y>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" above function relies on below function..
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" End COC


" centers the current pane as middle of 4 imaginary columns
" should be called in a window with a single pane
" function! CenterPane()
"   lefta vnew
"   wincmd w
"   exec 'vertical resize '. string(&columns * 0.75)
"   vnew
" endfunction
" nnoremap <leader>c :call CenterPane()<cr>

"recalculate the trailing whitespace warning when idle, and after saving
 autocmd cursorhold,bufwritepost * unlet! b:statusline_trailing_space_warning

" provides :Shell command to pipe shelled output to new scratch buffer
 command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
 function! s:RunShellCommand(cmdline)
   echo a:cmdline
   let expanded_cmdline = a:cmdline
   for part in split(a:cmdline, ' ')
      if part[0] =~ '\v[%#<]'
         let expanded_part = fnameescape(expand(part))
         let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
      endif
   endfor
   botright new
   setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  call setline(1, 'You entered:    ' . a:cmdline)
   call setline(2, 'Expanded Form:  ' .expanded_cmdline)
   call setline(3,substitute(getline(2),'.','=','g'))
   execute '$read !'. expanded_cmdline
   setlocal nomodifiable
   1
 endfunction

"return '[\s]' if trailing white space is detected
"return '' otherwise
 function! StatuslineTrailingSpaceWarning()
     if !exists("b:statusline_trailing_space_warning")
 
         if !&modifiable
             let b:statusline_trailing_space_warning = ''
             return b:statusline_trailing_space_warning
         endif
 
         if search('\s\+$', 'nw') != 0
             let b:statusline_trailing_space_warning = '[\s]'
         else
             let b:statusline_trailing_space_warning = ''
         endif
     endif
     return b:statusline_trailing_space_warning
 endfunction

""find the median of the given array of numbers
" function! s:Median(nums)
"     let nums = sort(a:nums)
"     let l = len(nums)
"
"     if l % 2 == 1
"         let i = (l-1) / 2
"         return nums[i]
"     else
"         return (nums[l/2] + nums[(l/2)-1]) / 2
"     endif
" endfunction
"
 let g:ft = ''
 function! NERDCommenter_before()
   if &ft == 'vue'
     let g:ft = 'vue'
     let stack = synstack(line('.'), col('.'))
     if len(stack) > 0
       let syn = synIDattr((stack)[0], 'name')
       if len(syn) > 0
         exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
       endif
     endif
   endif
 endfunction
 function! NERDCommenter_after()
   if g:ft == 'vue'
     setf vue
     let g:ft = ''
   endif
 endfunction

""source project specific config files
" "runtime! projects/**/*.vim
"
""map Q to something useful
noremap Q gq
"
"" allow , to play macro
nnoremap , @q
"
""make Y consistent with C and D
nnoremap Y y$
"
""close quickfix easily:
" nnoremap <leader>qq :cclose<CR>

"visual search mappings
 function! s:VSetSearch()
     let temp = @@
     norm! gvy
     let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
     let @@ = temp
 endfunction
 vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
 vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>
"
"
"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
 autocmd BufReadPost * call SetCursorPosition()
 function! SetCursorPosition()
     if &filetype !~ 'svn\|commit\c'
         if line("'\"") > 0 && line("'\"") <= line("$")
             exe "normal! g`\""
             normal! zz
         endif
     end
 endfunction
"
""spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

" auto-fix last spelling error
nnoremap <Leader>ss [s1z=
"
""http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
""hacks from above (the url, not jesus) to delete fugitive buffers when we
""leave them - otherwise the buffer list gets poluted
""
""add a mapping on .. to view parent tree
" autocmd BufReadPost fugitive:/[* set bufhidden=delete
" autocmd BufReadPost fugitive://*
"   \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
"   \   nnoremap <buffer> .. :edit %:h<CR> |
"   \ endif
"
" allows you press esc (TWICE) to turn off search highlight "
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
" This mapping can cause startup problems! https://stackoverflow.com/a/1037182/1923858 

