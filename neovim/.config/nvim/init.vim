syntax on

call plug#begin('~/.vim/plugged')

" themes
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'atelierbram/vim-colors_atelier-schemes'
Plug 'itchyny/lightline.vim'
Plug 'sainnhe/tmuxline.vim'
" programming
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
"Plug 'glepnir/lspsaga.nvim'
Plug 'jasonrhansen/lspsaga.nvim', {'branch': 'finder-preview-fixes'}
"Plug 'nvim-lua/completion-nvim'
Plug 'RRethy/vim-illuminate'
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'fatih/vim-go' " , { 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim'
Plug 'neovim/nvim-lspconfig'
if has('nvim-0.5')
	Plug 'neovim/nvim-lsp'
	Plug 'neovim/nvim-lspconfig'
endif
" utils
Plug 'ojroques/vim-oscyank'
Plug 'PeterRincker/vim-searchlight'
Plug 'airblade/vim-gitgutter'
Plug 'vifm/vifm.vim'
Plug 'sk1418/HowMuch'
Plug 'google/vim-searchindex'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'easymotion/vim-easymotion'
Plug 'itchyny/vim-gitbranch'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'chrisbra/Colorizer'
Plug 'baskerville/vim-sxhkdrc'
"Plug 'zefei/vim-wintabs'
Plug 'ap/vim-buftabline'
" Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
Plug 'farmergreg/vim-lastplace'
"Plug 'ervandew/supertab'
Plug 'Chiel92/vim-autoformat'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'psliwka/vim-smoothie'
Plug 'mg979/vim-visual-multi'
Plug 'preservim/tagbar'
Plug 'gerw/vim-HiLinkTrace'

call plug#end()
if (empty($TMUX))
	if (has("nvim"))
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif
" treesitter settings
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	ignore_install = {}, -- List of parsers to ignore installing
	  highlight = {
		  enable = true,              -- false will disable the whole extension
			  disable = {},  -- list of language that will be disabled
				},
				}
EOF
" Use LSP omni-completion in Rust files
"autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc

" Enable deoplete autocompletion in Rust files
"let g:deoplete#enable_at_startup = 1

" customise deoplete                                                                                                                                                     " maximum candidate window length
"call deoplete#custom#source('_', 'max_menu_width', 80)

" Press Tab to scroll _down_ a list of auto-completions
"let g:SuperTabDefaultCompletionType = "<c-n>"

" rustfmt on write using autoformat
"autocmd BufWrite * :Autoformat

"TODO: clippy on write
"autocmd BufWrite * :Autoformat

"nnoremap <leader>c :!cargo clippy
"filetype plugin indent on
set background=dark
set termguicolors
set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set noexpandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set guifont=JetBrainsMono:h12
imap <C-k> <Esc>
xmap <C-k> <Esc>
cmap <C-k> <Esc>
map , <Plug>(easymotion-prefix)
let g:easymotion#is_active = 0
function! EasyMotionCoc() abort
  if EasyMotion#is_active()
	let g:easymotion#is_active = 1
	CocDisable
  else
	if g:easymotion#is_active == 1
	  let g:easymotion#is_active = 0
	  CocEnable
	endif
  endif
endfunction
" autocmd TextChanged,CursorMoved * call EasyMotionCoc()
function! EMCocEnable() abort
  if g:easymotion#is_active == 1
	  let g:easymotion#is_active = 0
	  CocEnable
  endif
endfunction
autocmd InsertEnter *.go call EMCocEnable()
augroup autosave
	autocmd!
	autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
	autocmd FileType * autocmd TextChanged,InsertLeave *.go if &readonly == 0 | silent write | endif
augroup END
let g:searchindex_line_limit = 1000000000
let g:tex_flavor = 'latex'
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark= "hard"
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
highlight link goBuiltins Keyword


let g:gruvbox_material_better_performance = 1
"let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_diagnostic_line_highlight = 1
let g:gruvbox_transparent = "true"
"let g:gruvbox_italic_functions = 'true'
"let g:gruvbox_italic_variables = 'true'
let g:lightline = {
			\ 'colorscheme': 'gruvbox_material',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'cocstatus', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'gitbranch#name',
			\   'cocstatus': 'coc#status'
			\ },
			\ }
let g:lightline.separator = { 'left': "\ue0bc", "\ue0ba": '' }
let g:tmuxline_preset = {
			\'a'    : ' #S ',
            \'b'    : ' #W #F ',
			\'win'  : [ ' #I #W '],
			\'cwin' : [ ' #I #W '],
			\'y'    : [ ' %Y-%m-%d ', ' %R ' ],
			\'z'    : ' #H #{prefix_highlight}'
			\}
let g:tmuxline_separators = {
			\ 'left' : "\ue0bc",
			\ 'left_alt': "\ue0bd",
			\ 'right' : "\ue0ba",
			\ 'right_alt' : "\ue0bd",
			\ 'space' : ''}
colorscheme gruvbox-material
hi! illuminatedWord ctermbg=red gui=underline
hi! illuminatedCurWord cterm=underline gui=underline
"hi CurrentWord cterm=italic gui=italic ctermbg=red guibg=red
"hi clear LspReferenceRead
"hi clear LspReferenceText
"hi clear LspReferenceWrite
"hi clear CurrentWord
hi LspReferenceRead cterm=italic gui=italic ctermbg=red guibg=red
hi LspReferenceWrite cterm=italic gui=italic ctermbg=red guibg=red
hi LspReferenceText ctermbg=red guifg=#b181d6
hi LspReference cterm=italic gui=italic ctermbg=red guibg=red

lua require("lsp_config")
"augroup illuminate_augroup
	"autocmd!
	"autocmd VimEnter * hi! illuminatedWord ctermbg=red gui=underline
	"autocmd VimEnter * hi! illuminatedCurWord cterm=underline gui=underline
"augroup END
autocmd Filetype go,cpp,h,hpp,c setlocal tabstop=2
autocmd Filetype go,cpp,h,hpp,c setlocal softtabstop=2
autocmd Filetype go,cpp,h,hpp,c setlocal shiftwidth=2
autocmd Filetype cpp,h,hpp,c setlocal expandtab
autocmd Filetype tex,vimwiki setlocal spelllang=ru,en
autocmd Filetype tex,vimwiki setlocal spell
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()
autocmd BufWritePre *.go lua goimports(1000)
" Show syntax highlighting groups for word under cursor
nmap <F2> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" nvim-compe settings
set completeopt=menuone,noselect,noinsert
set shortmess+=c
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.resolve_timeout = 800
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

"set cursorline
"hi clear CursorLine
"highlight CursorLine cterm=underline gui=underline ctermfg=None guifg=None
highlight link Searchlight Incsearch
" Permanent undo
set undodir=~/.vimdid
set undofile
" set colorcolumn=100 " and give me a colored column
set nonumber
"set relativenumber
"setlocal foldmethod=syntax         
"setlocal foldlevelstart=99
set hidden
set showcmd " Show (partial) command in status line.
set mouse=a " Enable mouse usage (all modes) in terminals
set scrolloff=1
" jump to start and end of line with home row keys
set noshowmode
set splitbelow
set splitright
let g:sneak#label = 1
let g:one_allow_italics = 1
" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
map H ^
map L $

" remove highlighting from search
nnoremap <silent> <cr> :noh<CR><CR>
let mapleader = "\<Space>"
cnoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
cnoremap <expr> <down> ((pumvisible())?("\<C-n>"):("\<down>"))
cnoremap <expr> <up> ((pumvisible())?("\<C-p>"):("\<up>"))
" Open hoteys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>
nmap <leader>h :History<CR>
nmap <leader>t :BTags<CR>
nmap <leader>T :Tags<CR>
imap <Esc> <Esc>`^
" Quick-save
nmap mr :w<CR>
nmap mc :so ~/.config/nvim/init.vim<CR>
nmap mq :bd<CR>
nmap mf :CocCommand explorer<CR>
nmap mt :TagbarToggle<CR>
nmap mal :set number!<CR>
nnoremap <leader>un :UndotreeToggle<CR>
vnoremap > >gv
vnoremap < <gv
" Neat X clipboard integration
" ,p will paste clipboard into buffer
" ,c will copy entire buffer into clipboard

let g:oscyank_max_length = 1000000
noremap <leader>p "+p
noremap <leader>y :OSCYank<cr>
noremap <leader>d "+d
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

let g:vifm_replace_netrw = 1
" <leader>s for Rg search
" root is cwd if true
let g:rg_derive_root='true'
let g:fzf_preview_window = ['up:50%', 'ctrl-/']
" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
noremap <leader>s :Rg
function! RipgrepFzf(query, fullscreen)
	let command_fmt = 'rg --column --hidden --line-number --no-heading --color=always --smart-case -- %s || true'
	let initial_command = printf(command_fmt, shellescape(a:query))
	let reload_command = printf(command_fmt, '{q}')
	let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
	call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -bang -nargs=* Rgh
  \ call fzf#vim#grep(
  \   'rg --column --hidden --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" tagbar
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
let g:go_doc_keywordprg_enabled = 0
set updatetime=1
set title
" coc shit
" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup

" Give more space for displaying messages.
"set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.

" Don't pass messages to |ins-completion-menu|.
"set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"set signcolumn=number

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
			"\ pumvisible() ? "\<C-n>" :
			"\ <SID>check_back_space() ? "\<TAB>" :
			"\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
	"let col = col('.') - 1
	"return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
""if has('nvim')
	""inoremap <silent><expr> <c-space> coc#refresh()
""else
	""inoremap <silent><expr> <c-@> coc#refresh()
""endif

"" Make <CR> auto-select the first completion item and notify coc.nvim to
"" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
		"""	"\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Use K to show documentation in preview window.
"nmap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
	"if (index(['vim','help'], &filetype) >= 0)
		"execute 'h '.expand('<cword>')
	"else
		"call CocActionAsync('doHover')
	"endif
"endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
	"autocmd!
	"" Setup formatexpr specified filetype(s).
	"autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	"" Update signature help on jump placeholder.
	"autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end

"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')

"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>lr  :<C-u>CocListResume<CR>
