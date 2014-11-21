execute pathogen#infect()

set number

set nowrap
set autoindent
set shiftwidth=4
syntax on
filetype plugin indent on

" Tabs
set expandtab
set tabstop=4
set softtabstop=4

" Python 80 char lines
au FileType python set textwidth=79
au FileType python set colorcolumn=+1
au FileType python highlight ColorColumn ctermbg=darkgrey guibg=lightgrey
au FileType python highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
au FileType python match OverLength /\%>79v.\+/
" Markdown Options
let g:vim_markdown_folding_disabled=1
