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

"enable full color
set t_Co=256

"set relative line number
set relativenumber


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



"Change how backspace acts
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

"Have leader; append a semi-colon at the end of a line
noremap <Leader>; :<C-o>;<Esc>

"kk short for escape
imap kk <Esc>

"Opens a file with the current working directory already filled in so you have
"to specify only the filename.
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

"Change the current working directory to the directory that the current file
"you are editing is in.
map ,cd :cd %:p:h <CR>


" in visual mode use ctrl-r to search and replac3
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" F2 toggles line numbers
nnoremap <F2> :set nonumber! nornu! <CR>
