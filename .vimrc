set encoding=utf-8
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ycm-core/YouCompleteMe'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug '907th/vim-auto-save'
Plug 'chiel92/vim-autoformat'
" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'junegunn/seoul256.vim'
Plug 'AlessandroYorba/Sierra'

call plug#end()

set number
set colorcolumn=120
set termguicolors
set background=dark
colorscheme hybrid_material

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" Enable autosave on vim startup
let g:auto_save = 1

" Change leader key to comma
let mapleader = ","

" Add spaces after comment
let g:NERDSpaceDelims = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Key remappings
nnoremap P "+p
vnoremap P "+p
nnoremap Y "+y
vnoremap Y "+y
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <silent> <leader>f :GFiles<CR>
nnoremap <silent> ff :Rg<CR>
imap jk <Esc>
imap <expr> <leader><tab> emmet#expandAbbrIntelligent("\<tab>")
noremap <C-_> :call NERDComment(0,"toggle")<CR>
" Alt + B to use YCM GoTo
nnoremap <silent> b :YcmCompleter GoTo<CR>
nmap <leader>i gg=G
noremap <silent> <F3> :Autoformat<CR>
nnoremap tt gt
nnoremap TT gT
nnoremap mm <C-w><C-w>
