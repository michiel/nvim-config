set nocompatible

syntax enable

set autoindent
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab
set ts=2

"""" UI Config
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
" set wildmode=list:longest
set wildmode=longest,list:full
set completeopt=menu,menuone,noselect
set wildmenu            " visual autocomplete for command menu

set ignorecase
set smartcase
set number
set title
set signcolumn=yes       " prevents column jumping for lsp labels

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
" highlight NvimTreeFolderIcon guibg=blue

highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine
highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine
highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine
highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine
highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine
highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine

lua require('plugins')
lua require('lsp')
lua require('nvim-tree-config')
lua require('completion')
lua require('statusline')

lua require('colorscheme')
colorscheme nightfox

call wilder#setup({'modes': [':', '/', '?']})

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

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
" nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

let g:vimwiki_list = [{'path': '~/obsidian-digio/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

