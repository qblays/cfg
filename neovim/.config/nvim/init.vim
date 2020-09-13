inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
inoremap <C-c> <Esc>
cnoremap <C-j> <C-C><Esc>
onoremap <C-j> <Esc>
vnoremap <C-c> <Esc>
syntax on

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lsp'
Plug 'vimwiki/vimwiki'
Plug 'zhou13/vim-easyescape'
Plug 'atelierbram/vim-colors_atelier-schemes'

Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'chrisbra/Colorizer'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'


Plug 'jlanzarotta/bufexplorer'

let g:easyescape_chars = { "j": 1, "k": 1 }
cnoremap jk <ESC>
cnoremap kj <ESC>
call plug#end()
lua require'nvim_lsp'.rust_analyzer.setup({})
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set background=dark
colorscheme Atelier_DuneDark
set termguicolors
" Permanent undo
set undodir=~/.vimdid
set undofile
set colorcolumn=100 " and give me a colored column
set number
set relativenumber

set hidden
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
" jump to start and end of line with home row keys
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'materia',
      \ }
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
map H ^
map L $
map <C-l> "0x"0p"_X
imap <C-l> <Esc><C-l>a
" remove highlighting from search
nnoremap <silent> <cr> :noh<CR><CR>
let mapleader = "\<Space>"
" Open hoteys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" Quick-save
nmap <leader>w :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>q :q<CR>
" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard

noremap <leader>p "+p
noremap <leader>y "+y
noremap <leader>d "+d
" <leader>s for Rg search
noremap <leader>s :Rg
