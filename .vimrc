"Ctrl+kjhl Navigation
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-l> :wincmd l<CR>
set incsearch                   " find as you type search
set wildmode=longest,list
set nu
filetype on
filetype plugin indent on
syntax on
set title           " show title in console title bar
set tabstop=4 "setting tab space=4
set background=dark
set hlsearch
set ignorecase                  " case insensitive search
set autoindent                  " indent at the same level of the previous line
set shiftwidth=4                " use indents of 4 spaces

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

colorscheme torte
"hi Normal     guifg=Black  guibg=White
":colorscheme white

" Set utf8 as standard encoding and en_US as the standard language
 set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"highlight Number

hi Comment ctermbg=black ctermfg=darkgrey

"set transparency=5		" setting transparency
"setting setting for tab browsing
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
"swapping windows
function! MarkWindowSwap()
  let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
  "Mark destination
  let curNum = winnr()
  let curBuf = bufnr( "%" )
  exe g:markedWinNum . "wincmd w"
  "Switch to source and shuffle dest->source
  let markedBuf = bufnr( "%" )
  "Hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  "Switch to dest and shuffle source->dest
  exe curNum . "wincmd w"
  "Hide and open so that we aren't prompted and keep history

  exe 'hide buf' markedBuf 
endfunction

nmap <silent> <leader>mw :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>
"Use TAB to complete when typing words, else inserts TABs as usual.
""Uses dictionary and source files to find matching words to complete.

"See help completion for source,
""Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
""Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

 "-------- :make configure------
 
 au FileType lex set makeprg=lex\ \ %
 au FileType c set makeprg=gcc\ -g\ %
 au FileType cpp set makeprg=g++\ -g\ %
 au FileType y set makeprg=yacc\ -d\ %

 "------- template ------
:autocmd BufNewFile *.cpp 0r ~/.vim/skeleton.cpp

"-----automatically save before make--------
set autowrite
nnoremap <F5> :GundoToggle<CR>    "Gundo keymapping

