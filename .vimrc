call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'kien/ctrlp.vim'
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'tpope/vim-fugitive'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'mitermayer/vim-prettier', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'css', 'less', 'scss', 'json', 'graphql'] } 
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer --tern-completer'}
call plug#end()

set autoindent
set foldmethod=syntax
set incsearch
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set nowrap
set relativenumber
set ruler
set scrolloff=1
set shiftwidth=2
syntax on
au BufNewFile,BufRead *.raml set filetype=yaml
filetype plugin indent on

" Tabs
set expandtab
set tabstop=2
set softtabstop=2

" Set line length highlight defaults 
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=lightgrey

" Python
au FileType python set textwidth=79
au FileType python set colorcolumn=+1
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
au FileType python match OverLength /\%>79v.\+/

" JavaScript/CSS/SCSS
au FileType javascript setlocal ts=2 sts=2 sw=2
let javascript_enable_domhtmlcss = 1
let g:javascript_plugin_flow = 1
function! JavascriptCheckers()
  if filereadable(getcwd() . '/.jshintrc')
    return ['jshint']
  else
    return ['eslint']
  endif
endfunction
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.json,*.css,*.scss,*.less,*.graphql PrettierAsync

" Markdown Options
let g:vim_markdown_folding_disabled=1

" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
