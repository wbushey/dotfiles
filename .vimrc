execute pathogen#infect('~/.dotfiles/.vim/bundle/{}')

set number
set ruler
set nowrap
set autoindent
set shiftwidth=4
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

" Markdown Options
let g:vim_markdown_folding_disabled=1
