set nocompatible

lua require('plugins')
lua require('lsp')

syntax enable

set autoindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set ts=2

"""" UI Config
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set showcmd             " show command in bottom bar
set cursorline          " highlight current line

set wildmode=list:longest
set ignorecase
set smartcase
set number
set title

lua require('colorscheme')

let mapleader = ","
map <Leader>n :set number!<CR>
map <Leader>p :set paste!<CR>

" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
