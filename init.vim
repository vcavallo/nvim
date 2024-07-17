if exists('g:vscode')
  " settings for vscode
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
else
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call plug#begin('~/.config/nvim/bundle')

" Plugin 'VundleVim/Vundle.vim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-lua/plenary.nvim'

Plug 'tpope/vim-fugitive'
"Plug 'github/copilot.vim'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/NERDCommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'lokaltog/vim-easymotion'
Plug 'Valloric/vim-indent-guides'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-vinegar'
Plug 'jacoborus/tender.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'fenetikm/falcon'
Plug 'flazz/vim-colorschemes'
Plug 'mhinz/vim-startify'
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'fatih/vim-go'
Plug 'prettier/vim-prettier'
" Plug 'dense-analysis/ale'
Plug 'wakatime/vim-wakatime'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'elmcast/elm-vim'
" Plug 'alok/notational-fzf-vim'
Plug 'fiatjaf/neuron.vim'
Plug 'chiefnoah/neuron-v2.vim'
" Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'pgdouyon/vim-yin-yang'
" Plug 'gabrielelana/vim-markdown'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'elmcast/elm-vim'
Plug 'mattn/vim-gist'
Plug 'mattn/webapi-vim'

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'urbit/hoon.vim'
Plug 'https://git.sr.ht/~talfus-laddus/hoon-runes.vim', { 'branch': 'main' }
Plug 'https://git.sr.ht/~talfus-laddus/hoon-stdlib.vim', { 'branch': 'main' }

Plug 'mattn/emmet-vim'
Plug 'leafOfTree/vim-vue-plugin'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'folke/zen-mode.nvim'
Plug 'crispgm/telescope-heading.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

call plug#end()            " required
filetype plugin indent on    " required

" set t_Co=256
" set termguicolors

" elm
let g:elm_format_autosave = 1

let g:path_neuron = "/home/vcavallo/.nix-profile/bin/neuron"

" vim-gist
let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1
let g:gist_detect_filetype = 1

" use <c-y>, " note comma!
let g:vim_vue_plugin_config = { 
      \'syntax': {
      \   'template': ['html'],
      \   'script': ['javascript', 'typescript'],
      \   'style': ['css', 'scss', 'sass'],
      \   'i18n': ['json', 'yaml'],
      \   'route': 'json',
      \},
      \}

" let g:LanguageClient_serverCommands = {
"       \ 'vue': ['vls']
"       \}

lua << END
vim.o.completeopt = 'menuone,noselect'

require('telescope').load_extension('heading')

local telescope = require('telescope')
telescope.setup({
    extensions = {
        heading = {
            treesitter = true,
        },
    },
})
telescope.load_extension('heading')

require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require('lspconfig')

lspconfig.hoon_ls.setup{}
lspconfig.marksman.setup{}
lspconfig.eslint.setup{}
lspconfig.tsserver.setup{}
-- lspconfig.biome.setup{}
-- lspconfig.tailwindcss.setup{}
lspconfig.pyright.setup{}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

local lspcapabilities = require("cmp_nvim_lsp").default_capabilities()

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-Space>', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts) -- conflicts with navigation
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "rst" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = { "" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'clangd', 'eslint', 'marksman', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- luasnip setup
local luasnip = require 'luasnip'

require("luasnip.loaders.from_lua").lazy_load()
-- set keybinds for both INSERT and VISUAL.
vim.api.nvim_set_keymap("n", "<leader>re", "<Plug>(Prettier)", {})
vim.api.nvim_set_keymap("v", "<leader>re", ":PrettierFragment<cr>", {})


vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
-- Set this check up for nvim-cmp tab mapping
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require 'cmp'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
    -- C-b (back) C-f (forward) for snippet placeholder navigation.
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' }
  },
}

require("zen-mode").setup = {
    window = {
    backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 120, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      signcolumn = "no", -- disable signcolumn
      number = false, -- disable number column
      relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      -- showcmd = false, -- disables the command in the last line of the screen
      -- you may turn on/off statusline in zen mode by setting 'laststatus' 
      -- statusline will be shown only if 'laststatus' == 3
      -- laststatus = 0, -- turn off the statusline in zen mode
    },
    -- twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
    -- this will change the font size on alacritty when in zen mode
    -- requires  Alacritty Version 0.10.0 or higher
    -- uses `alacritty msg` subcommand to change font size
    alacritty = {
      enabled = false,
      font = "18", -- font size
    },
    -- this will change the font size on wezterm when in zen mode
    -- See alse also the Plugins/Wezterm section in this projects README
    wezterm = {
      enabled = false,
      -- can be either an absolute font size or the number of incremental steps
      font = "+4", -- (10% increase per step)
    },
  }
}

END


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>hh <cmd>Telescope heading<cr>

" todo.txt
"
" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete
" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>
" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>

" Elm
"
let g:elm_format_autosave = 1

" Show Elm compiler errors in quickfix list

" Java

""
" " need to npm-install prettier
  let g:prettier#exec_cmd_path = "~/.npm-global/bin/prettier"
" let g:prettier#autoformat_config_present = 1
" let g:prettier#autoformat_config_files = [".prettierrc"]
 let g:prettier#autoformat = 1
 autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html Prettier
" autocmd BufRead *.md let g:prettier#config#prose_wrap = 'always'
"
let g:deoplete#enable_at_startup = 0

" " set up fzf
set rtp+=~/.fzf
let g:fzf_command_prefix = 'Fzf'
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

set shortmess=IA

"" Startfiy settings

"" Turning it off for now
let g:startify_disable_at_vimenter = 1

" notational-fzf-vim settings
" let g:nv_search_paths = [
"   \ '~/Dropbox/nvALT',
"   \ '~/Dropbox/nvALT_archive',
"   \ '~/Dropbox/journal',
"   \ '~/Dropbox/wiki/notes',
"   \ '~/Dropbox/Documents',
"   \ '~/zettelkasten',
"   \ '~/private-zettelkasten',
"   \ '~/Desktop']

"let g:nv_python_path='/home/vcavallo/anaconda3/bin/python3'
"let g:nv_python_path='/usr/bin/python3.6m'

" let g:nv_use_short_pathnames=0 " not ok with python version
" let g:nv_create_note_window = 'split' " tabedit
" let g:nv_window_direction = 'down'
" let g:nv_window_width = '75%'
" let g:nv_preview_direction = 'up'
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
"
" set background=dark
"
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
colorscheme paramount
" colorscheme apprentice
" colorscheme grb256

""" Switch colorschemes when entering and exiting markdown files
""" update this whenever changing base scheme:
""" .... actually don't use this. it seems to break italics.
"autocmd BufLeave *.md,*.markdown colorscheme grb256
" autocmd BufEnter,BufRead,BufNewFile *.md,*.markdown colorscheme tender

highlight ColorColumn ctermbg=236
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
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore-dir=node_modules
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore-dir=node_modules'
endif

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>ft :FzfTags<return>
nmap <C-P> <cmd>Telescope find_files<cr>

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
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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
autocmd BufRead,BufNewFile *.hoon set colorcolumn=57,81

autocmd BufRead,BufNewFile *.sire set filetype=rex
autocmd BufRead,BufNewFile *.rex set filetype=rex
autocmd BufRead,BufNewFile *.loot set filetype=rex

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
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn set colorcolumn=70,80
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal syntax=markdown
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal spell
autocmd BufRead,BufNewFile *.txt,*.md,*.*markdown,*.mdown,*.mkd,*.mkdn setlocal wrap linebreak

let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'javascript', 'hoon', 'bash']

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

" F12 re-syncs syntax if it gets screwed up
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>

" " remove the '-' mapping to allow vim vinegar to open:
" nmap <Nop> <Plug>VimwikiRemoveHeaderLevel
" 
" nmap <Leader>wo <Plug>VimwikiIndex

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

""hide buffers when not displayed
set hidden

"" User command to index the current notebook.
" " Create a new note in the directory journal/daily.
" " nnoremap <leader>zj :ZkNew {"dir": "journal/daily"}<CR>
" 
highlight LspDiagnosticsDefaultError ctermfg=red guifg=red
highlight LspDiagnosticsUnderlineError ctermfg=red guifg=red
highlight LspDiagnosticsDefaultHint ctermfg=yellow guifg=yellow
highlight LspDiagnosticsUnderlineHint cterm=none gui=none

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
" nnoremap , @q
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

lua << END
require('lualine').setup {
    options = {
    icons_enabled = true,
    theme = 'wombat',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END


endif " for vscode
