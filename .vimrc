""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc -- they way it ought to be
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible       " no compatibility with vi
filetype on            " recognize syntax by file extension
filetype indent on     " check for indent file
syntax on              " syntax highlighting
hi clear search        " do not highlight all search matches

set ai
set si

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set ourselves up for the night
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background=light   " background light, so foreground not bold
set backspace=2        " allow <BS> to go past last insert
set gdefault           " assume :s uses /g
set ignorecase         " ignore case in search patterns
set smartcase          " searches are case-sensitive if caps used
set incsearch          " immediately highlight search matches
set noerrorbells       " no beeps on errors
set nomodeline         " prevent others from overriding this .vimrc
set number             " display line numbers
set ruler              " display row, column and % of document
set laststatus=2
set showcmd            " show partial commands in the status line
set showmatch          " show matching () {} etc.
set showmode           " show current mode
set expandtab          " expand tabs with spaces
set tabstop=3          " <Tab> move three characters
set shiftwidth=3       " >> and << shift 3 spaces
set nowrap             " don't soft wrap
set wrap
set modeline           " check for a modeline
set softtabstop=3      " see spaces as tabs
set scrolloff=5        " start scrolling when cursor is N lines from edge
set hlsearch
set autochdir          " set the current directory to what file is being edited
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings for autoindentation, comments, and what-have-you
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlights long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" cartography section
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle line numbers...
:nnoremap <Leader>n :set invnumber<CR>

" ...and all the cool kids need to paste.
:nnoremap <Leader>p :set invpaste<CR>

" toggle wrap
:nnoremap <Leader>w :set invwrap<CR>

"Move between splits with control + normal vim movement.
"Also, minimize splits show just filename, not current line too.
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
set wmh=0

" Tabs can be fun too!
:nnoremap ;' :tabnew<CR>
:nnoremap '; :tabclose<CR>

" And this is how pros navigate splits and tabs.
:nnoremap <C-P> gT<CR>
:nnoremap <C-N> gt<CR>

"Clear the search buffer (no more /sjkfadsg).
:nnoremap <silent> // :let @/=""<CR>

"Save a file as root
cmap w!! w !sudo tee % >/dev/null

"Status bar at the bottom, even when there's only one file open.
set statusline=%<%f\ %m\ %h%r%=%b\ 0x%B\ \ %l,%c%V\ %P 

" Use the space key to open and close code folds
:vnoremap <space> zf<CR>
:nnoremap <space> zd<CR>

" Tab completion more like Bash
set wildmode=longest,list,full
set wildmenu

function! AddSubtract(char, back)
   let pattern = &nrformats =~ 'alpha' ? '[[:alpha:][:digit:]]' : '[[:digit:]]'
   call search(pattern, 'cw' . a:back)
   execute 'normal! ' . v:count1 . a:char
   silent! call repeat#set(":\<C-u>call AddSubtract('" .a:char. "', '" .a:back. "')\<CR>")
endfunction

nnoremap <silent>         <C-a> :<C-u>call AddSubtract("\<C-a>", '')<CR>
nnoremap <silent> <Leader><C-a> :<C-u>call AddSubtract("\<C-a>", 'b')<CR>
nnoremap <silent>         <C-x> :<C-u>call AddSubtract("\<C-x>", '')<CR>
nnoremap <silent> <Leader><C-x> :<C-u>call AddSubtract("\<C-x>", 'b')<CR>

" Call 'svn blame' on the current file and grab the output for the current line 
" plus the surrounding context. Display the result via echo and redraw the 
" screen after input.
function SvnBlame(linesOfContext) 
let pos = line(".")
let text = system("svn blame " . expand("%:p")) 
let tempName = tempname() 


exec "redir! > " . tempName 
silent echon text
redir END 
execute "botr " . (a:linesOfContext * 15 + 1) . "split " . tempName 
exec pos
norm zz 
redraw! 
endfunction 
noremap <C-b> :call SvnBlame(8)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ben's quick fixes 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .as is for actionscript files
au BufNewFile,BufRead *.as set filetype=actionscript 

" I use C-A for screen so increment with capital X 
:noremap <S-x> <C-A> 

au BufRead,BufNewFile *.g set ft=antlr
au BufRead,BufNewFile [Mm]akefile* set noet ts=8 sw=8 nocindent list lcs=tab:>-,trail:x


set t_Co=256
