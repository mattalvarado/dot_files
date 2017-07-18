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

set showcmd

"Dont rerender the screen on every action
set lazyredraw

set wildmenu

"Delete Trailing whitespace for python files
func! DeleteTrailingWS()
  exe "normal mz"
    %s/\s\+$//ge
      exe "normal 'z"
      endfunc
      autocmd BufWrite *.py :call DeleteTrailingWS()

"Delete Trailing whitespace in cpp files
func! DeleteTrailingWSCPP()
  exe "normal mz"
    %s/\s\+$//ge
      exe "normal 'z"
      endfunc
      autocmd BufWrite *.cpp :call DeleteTrailingWSCPP()

"Delete Trailing whitespace in h files
func! DeleteTrailingWSH()
  exe "normal mz"
    %s/\s\+$//ge
      exe "normal 'z"
      endfunc
      autocmd BufWrite *.h :call DeleteTrailingWSH()

"Delete Trailing whitespace in hh files
func! DeleteTrailingWSHH()
  exe "normal mz"
    %s/\s\+$//ge
      exe "normal 'z"
      endfunc
      autocmd BufWrite *.hh :call DeleteTrailingWSHH()


"Change how backspace acts
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

filetype plugin indent on

"Enforce 120 char line width
set colorcolumn=120

"Enable syntax highlighting
set incsearch
set hlsearch
hi Search ctermfg=Black ctermbg=LightRed

"Map spellcheck to F5
map <F5> :setlocal spell! spelllang=en_us<CR>

"Opens a file with the current working directory already filled in so you have
"to specify only the filename.
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>

"Change the current working directory to the directory that the current file
"you are editing is in.
map ,cd :cd %:p:h <CR>

" F2 toggles line numbers
nnoremap <F2> :set nonumber! nornu! <CR>

"Enable syntax highlighting for tpp and nvl files
autocmd BufRead,BufNewFile *.tpp set filetype=cpp
autocmd BufRead,BufNewFile *.nvl set filetype=cpp

"Highlight extrawhitespace
highlight ExtraWhitespace ctermbg=red guibg=red

match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

function! CRLHeader()
    r~/.vim/vim/cpp/CRLHeader.txt
endfunction

nmap ,n :call CRLHeader()<CR>

nmap ,d "=strftime('%F')<C-M>p

nmap ,u :call GetUUID()<CR>

function! GetUUID()
  let cmd = "uuidgen | tr -d '\n' | tr - _"
  let result = system(cmd)
  " Append space + result to current line without moving cursor.
  call setline(line('.'), getline('.').result)
endfunction

"Disable highlights with F3
map <F3> :noh<CR>

au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

au BufRead *calibration.yml set ft=

set path+=**
command! MakeTags !ctags -R .

set complete=.,w,b,u
