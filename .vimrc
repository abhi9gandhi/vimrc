""CR --> Enter
" Select line by visual mode to fold and then press <F9> 
"! <command> --> Run a command on shell prompt
" select the area by visual mode, press ~ to change the case  

set encoding=utf-8
execute pathogen#infect()
syntax on
filetype plugin indent on

set linebreak
set makeprg='build/mk'

" "vmap <C-c> y: call system( " xclip -i -selection clipboard" , getreg( " \" " ))<CR>
" "nmap <C-v> :call setreg( " \" " ,system( " xclip -o -selection clipboard" ))<CR>p"")""")""")"")
"set undodir=$HOME/.vim_undo,/tmp
" Auto completing ( and { brackets
"inoremap {<CR>  {<CR>}<Esc>O
"inoremap (       ( )<Esc>i
" "inoremap " " "<Esc>i
set wildmenu
set wildmode=list:longest
set expandtab
set softtabstop=4
set shiftwidth=4
"set tabstop=4
set autoindent
set cindent
set smartindent

filetype indent on
filetype plugin on

syntax on
colorscheme abhi

set number
set hlsearch
set paste
set incsearch
set ignorecase
set autoread
set ruler
set laststatus=2
set clipboard =unnamed
set go+=a
set nobackup " no backup files
"set backup
"set backupdir =/root/abhi/vim_bk 
"set backupdir =/studies/backup
set noswapfile " no swap files
"set nowritebackup " no backup file while editing
set showmode
set title " to set the title of terminal with file name
"set mouse=a " to enable mouse
" Enable to undo file even after it was closed
"set undofile

set history=2000 " saves last 2000 commands 
set undolevels=1000 " upto how much we can undo

set backspace=indent,eol,start
"set cursorline " to higlight the cursor line
set wildmode=list:longest
set wildchar=<TAB>
"Set leader key
let g:mapleader = "\<Space>"

"choosewin plugin
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable = 1


"Cscope quick fixes c \s
set cscopequickfix=s-,c-,d-,i-,t-,f-,e-
:map <F9>  :cp<CR>
:map <F10> :cn<CR>
:map <F11> :cope 15<CR>
:map <C-F> :cs find f

" Incase you type W instead of small w
command WQ wq 
command W w 
command Wq wq
" Incase you type Q instead of small q
command Q q 

" F3: Toggle highlight of trailing whitespaces.
nmap <F3> :call Toogle_trailing_spaces()<CR>
" F4: Toogle highlight of overlength lines
nmap <F4> :call Toogle_overlength() <CR>

" space space to close quickfix window
map <space><space> :cclose<CR>
" o to open and close the quick fix window
autocmd FileType qf nnoremap <buffer> o <CR>:cclose<CR>

vnoremap <F6> :call _comment() <CR>
 
" Save the file for ww
map ww :w <CR>
vmap <F7> : 
" Manually fold some line 
inoremap <F7> <C-O>za
nnoremap <F7> za
onoremap <F7> <C-C>za
vnoremap <F7> zf

cscope add ./cscope.out
cnoreabbrev csf cs find

"function Cscope()
"  cs add ./cscope.out
"endfunction 
"call Cscope()


" F3: Toggle highlight of trailing whitespaces.
let g:ttoogle = 0
function Toogle_trailing_spaces()
   if g:ttoogle == 1
       highlight clear
       let g:ttoogle = 0 
   else
   let g:ttoogle = 1
   highlight trailingspaces ctermbg=yellow ctermfg=white guibg=#592929
   match trailingspaces /\s\+$/   
   endif 
endfunction

" F4: Toogle highlight of overlength lines
let g:overlen_toogle = 0
function Toogle_overlength()
   if g:overlen_toogle == 1
       highlight clear
       let g:overlen_toogle = 0 
   else
       let g:overlen_toogle = 1
       highlight OverLength ctermbg=darkred ctermfg=white guibg=#592928
       match OverLength /\%81v.\+/
   endif 
   endfunction

:call Toogle_trailing_spaces()
:call Toogle_overlength()
