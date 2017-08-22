call plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
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

" Ctrl-P
let g:ctrlp_custom_ignore = {
      \ 'dir': '\.git$\|node_modules$\|vendor$'
      \}

" Tabs and Delimator autocompletion
set expandtab
set tabstop=2
set softtabstop=2
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Set line length highlight defaults 
set colorcolumn=80
highlight ColorColumn ctermbg=darkgrey guibg=lightgrey

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
let g:prettier#quickfix_enabled = 0
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
let g:ale_linter_aliases = {'jsx': 'css'}
autocmd BufWritePre *.js,*.jsx,*.json,*.css,*.scss,*.less,*.graphql Prettier

" Markdown Options
let g:vim_markdown_folding_disabled=1

" Python
au FileType python set textwidth=79
au FileType python set colorcolumn=+1
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
au FileType python match OverLength /\%>79v.\+/

" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
