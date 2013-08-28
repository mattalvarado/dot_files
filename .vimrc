"Show line numbers
set number

filetype off

"Do not use Swap file
set noswapfile
set nowb
set nobackup

"Syntax Highlighting
syntax enable

"Color scheme
colorscheme desert

"Use spaces instead of tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"Wrap Lines
set wrap

"Delete Trailing whitespace for python files
func! DeleteTrailingWS()
  exe "normal mz"
    %s/\s\+$//ge
      exe "normal 'z"
      endfunc
      autocmd BufWrite *.py :call DeleteTrailingWS()    



"Change of backspace acts
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"For Vundle
"set rtp+=~/.vim/bundle/vundle/
"call vundle#rc()
"Bundle 'gmarik/vundle'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'scrooloose/syntastic'
"
"
filetype plugin indent on

noremap <Leader>rc :<C-u>Roscd<space>
"noremap <Leader>re :<C-u>Rosed<space>
set colorcolumn=80

set hlsearch

map <F5> :setlocal spell! spelllang=en_us<CR>
