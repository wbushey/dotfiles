execute pathogen#infect('~/.dotfiles/.vim/bundle/{}')

set relativenumber
set ruler
set nowrap
set autoindent
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

" Python 80 char lines
au FileType python set textwidth=79
au FileType python set colorcolumn=+1
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
au FileType python match OverLength /\%>79v.\+/

" JavaScript
let javascript_enable_domhtmlcss=1
au FileType javascript setlocal ts=2 sts=2 sw=2

" Markdown Options
let g:vim_markdown_folding_disabled=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

function! JavascriptCheckers()
  if filereadable(getcwd() . '/.jshintrc')
    return ['jshint']
  else
    return ['eslint']
  endif
endfunction

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=JavascriptCheckers()
let g:syntastic_scss_checkers = ['scss_lint']

" Disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>
