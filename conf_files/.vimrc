syntax on

" set kscb
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
" set nowrap
set textwidth=120
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode

set cmdheight=2

set colorcolumn=120

set updatetime=300
set shortmess+=c
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

set wildmode=longest,list,full
set splitbelow splitright
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

" Language highlight
Plug 'sheerun/vim-polyglot'
" Plugin management
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Highlight of vim stuff
Plug 'vimwiki/vimwiki'
" Autocompletion
Plug 'neoclide/coc.nvim', {'branch':'release'}
" Plug 'terryma/vim-multiple-cursors'
" Theme
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'colepeters/spacemacs-theme.vim'
" Status bar bottom
Plug 'vim-airline/vim-airline'
" Git
Plug 'tpope/vim-fugitive'
" Async tasks
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
" View man pages in Vim
Plug 'vim-utils/vim-man'
" Panel
Plug 'stsewd/fzf-checkout.vim'
" Git log
Plug 'mbbill/undotree'
" Todo list
Plug 'vuciv/vim-bujo'
" telescope requirements...
Plug 'nvim-lua/popup.nvim'

" For Javascript/Typescript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" JS and JSX syntax
Plug 'maxmellon/vim-jsx-pretty'   
" GraphQL syntax
Plug 'jparise/vim-graphql'        


" Code commenter
Plug 'preservim/nerdcommenter'

Plug 'Chiel92/vim-autoformat'

" Ranger
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

call plug#end()

" set filetypes as typescript.tsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

let mapleader=" "
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-i> gggqG
map <leader>i gggqG
map <leader>o :CocCommand tsserver.organizeImports<CR>
map <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" GoTo code navigation.
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)


nmap <leader><Enter> o<ESC>
nmap <leader>O O<ESC>

nnoremap <C-p> :GFiles<CR>
noremap <F3> :Autoformat<CR>

nnoremap <F5> :UndotreeToggle<CR>


colorschem gruvbox
set background=dark


if executable('rg')
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:asyncrun_open = 6

let g:coc_global_extensions = [ 'coc-tsserver' ]
setlocal indentkeys+=0
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript\ --single-quote
autocmd FileType html setlocal formatprg=prettier\ --parser\ html
autocmd FileType css setlocal formatprg=prettier\ --parser\ css 

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" Ranger replace
"let g:NERDTreeHijackNetrw = 0 
"let g:ranger_replace_netrw = 1 

autocmd FileType python setlocal formatprg=autopep8\ -
