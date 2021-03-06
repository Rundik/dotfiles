"Generic stuff
let mapleader=","
set lazyredraw
set number relativenumber
set expandtab
set ignorecase
set sts=2
set ts=2
set sw=2
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·
"if exists('+colorcolumn')
  "set colorcolumn=80
"else
  "au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
"endif

"windows navigation
map <silent> <C-h> :call WinMove('h')<CR>
map <silent> <C-j> :call WinMove('j')<CR>
map <silent> <C-k> :call WinMove('k')<CR>
map <silent> <C-l> :call WinMove('l')<CR>

function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if(t:curwin == winnr())
    if(match(a:key,'[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

"search settings 
set incsearch
set hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"Plugins
call plug#begin('~/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'kaicataldo/material.vim'
	Plug 'itchyny/lightline.vim'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'scrooloose/nerdcommenter'
	Plug 'ervandew/supertab'
	Plug 'Valloric/YouCompleteMe', { 'do': './install.py --js-completer --clang-completer --rust-completer' }
	Plug 'ericpruitt/tmux.vim'
	Plug 'w0rp/ale'
	Plug 'kien/ctrlp.vim'
	Plug 'mboughaba/i3config.vim'
	Plug 'mhinz/vim-startify'
	Plug 'tpope/vim-abolish'
	Plug 'editorconfig/editorconfig-vim'

	Plug 'pangloss/vim-javascript'
	Plug 'mattn/emmet-vim'
	Plug 'posva/vim-vue'
	Plug 'ObserverOfTime/scss.vim', {'for': 'scss'}

	"Plug 'stevearc/vim-arduino'
call plug#end()

"NerdTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI=1
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vue'] = '42b883'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>

"NerdCommenter
map <C-_> <Plug>NERDCommenterToggle

"CtrlP sessions
nnoremap <Leader>ss :CtrlPObsession<CR>

"Emmet
"let g:user_emmet_install_global = 0
"autocmd FileType html,css,scss,vue EmmetInstall
"autocmd FileType html,css,scss,vue imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"True Colors
if (has("nvim"))
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if (has("termguicolors"))
  set termguicolors
endif

"ColorScheme
let g:material_theme_style = 'dark'
let g:lightline = { 'colorscheme': 'material_vim' }
set background=dark
colorscheme material

"Languages
au BufRead,BufNewFile *.scss set filetype=scss.css
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

"Custom keybindings
noremap <Leader>w :set list!<CR>
autocmd filetype sh nnoremap <F4> :w <bar> exec 'bash %<CR>'
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r')<CR>
autocmd filetype c nnoremap <F5> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F6> :w <bar> exec '!./run.sh'<CR>
autocmd filetype c nnoremap <leader>m :w <bar> :make<CR>
