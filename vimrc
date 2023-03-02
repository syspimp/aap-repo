set softtabstop=0   
autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
set pastetoggle=<F8>
set scrolloff=3         "space between cursor and terminal bottom
set nocompatible         "VIM over Vi
set undolevels=1500     "how many times the user can undo
set sidescrolloff=3     "space between cursor and terminal side
set tabstop=2             "tab width
set shiftwidth=2
set expandtab
set smarttab
set bs=2 " Allow backspace to back over everything in insert mode including newlines
set cindent
set formatoptions=rocql
set comments=sr:/*,mb:\ *,el:\ */,://,b:#,:%,:XCOMM,n:>,fb:-
set cinoptions=g0:0t0c2C1(0f0l1
set nosmartindent autoindent
syntax on
set nowrap                 "no wrapping
set number                 "line number
set nobackup             "no default backup

map <End> G             "<End> brings vim to the end of the file
map <Home> gg             "<Home> brings vim to the begining of file

colorscheme evening
set gfn=Bitstream\ Vera\ Sans\ Mono\ 10

" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv
set tags+=.tags;/

map <c-t> :tabnew<cr>
map <c-tab> :tabnext<cr>
map <c-s-tab> :tabprevious<cr>
map <c-w> :tabclose<cr>
imap <c-tab> <esc>:tabnext<cr>
imap <c-s-tab> <esc>:tabprevious<cr>
imap <c-w> <esc>:tabclose<cr>
imap <c-t> <esc>:tabnew<cr>
vmap <c-tab> <esc>:tabnext<cr>
vmap <c-s-tab> <esc>:tabprevious<cr>
vmap <c-w> <esc>:tabclose<cr>
vmap <c-t> <esc>:tabnew<cr>

filetype indent on
filetype on
filetype plugin on
