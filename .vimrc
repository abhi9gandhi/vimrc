"CR --> Enter
" C-r --> Run gcc on files and execute
" Select line by visual mode to fold and then press <F9> 
"! <command> --> Run a command on shell prompt

set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set number
set hlsearch
set incsearch
set ignorecase
set autoread
set ruler
map ,p “+p
map ,P “+P
map ,y “+y
set clipboard =unnamed
set go+=a
set nobackup " no backup files
set noswapfile " no swap files
set nowritebackup " no backup file while editing
set showmode
set paste
set title " to set the title of terminal with file name
"set mouse=a " to enable mouse

set history=2000 " saves last 200 commands 
set undolevels=1000 " upto how much we can undo

set cursorline " to higlight the cursor line

set wildmode=list:longest
set wildchar=<TAB>

" Highlight when length is greater than 80 columns
highlight OverLength ctermbg=red ctermfg=white guibg=#592928
match OverLength /\%81v.\+/
" White trailing spaces
highlight trailingspaces ctermbg=yellow ctermfg=white guibg=#592929
match trailingspaces /\s\+$/

" Incase you type W instead of small w
command WQ wq 
command W w 
command Wq wq
" Incase you type Q instead of small q
command Q q 

" F3: Toggle expansion of tabs to spaces.
nmap <F3> :set expandtab!<CR>

" Remove all trailing whitespace
nmap <F9> :%s/\s\+$//

" F5: Insert current date.
map <F5> :r !date<CR>

vmap <F6> :call _comment() <CR> 
 
" Save the file for ww
map ww :w <CR>
" Manually fold some line 
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

"Function for commenting a block of Visually selected text
function Comment()
  let fl=line("v") " returns the start of visual mode
  let ll=line("$") " returns the last line in buffer
  let i=fl

  let comment="/*"
  while i<=ll
    let cl=getline(i)
    if i == fl
      let cl2=comment.cl
      call setline(i, cl2)
    endif
    if i == ll
      let comment="*/"
      let cl2=comment.cl
      call setline(i, cl2)
    endif    
    let i=i+1
  endwhile
endfunction
" Function to sort
function! s:NumSort(a, b)
    return a:a>a:b ? 1 : a:a==a:b ? 0 : -1
endfunction

"Function for commenting a block of Visually selected text
function! _comment()
"  let [fl, ll]=sort([line('v'), line('z')], 's:NumSort')
 " let mylist = getline(firstline, lastline)
  let fl=line('.') " returns the start of visual mode
  let ll=line('v') " returns the last line in buffer

  let comment="/*"
  let cl=getline(fl)
  let cl2=comment.cl
  call setline(fl, cl2)
  let cl=getline(ll)
  let comment="*/"
  let cl2=comment.cl
  call setline(ll, cl2)
endfunction


"Function for Un-Commenting a block of Visually selected text
function UnComment()
  let fl=line("v") " returns the start of visual mode
  let ll=line("$") " returns the last line in buffer
  let i=fl

  let comment="/*"
  while i<=ll
    let cl=getline(i)
    if i == fl
      let cl2=substitute(cl, "/*", "", "")
      call setline(i, cl2)
    endif
    if i == ll
      let cl2=substitute(cl, "*/", "", "")
      call setline(i, cl2)
    endif    
    let i=i+1
  endwhile
endfunction

" run the gcc for the curent file and run the exec
map <C-E> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  exec "!gcc % -o %<"
  exec "! ./%<"
endfunc
