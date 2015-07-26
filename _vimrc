set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


" bkzhn
execute pathogen#infect()
syntax on
set number
colo railscasts



" indents
set tabstop=4 shiftwidth=4 autoindent smartindent
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on



nmap <S-Tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >
vmap <S-Tab> <
nmap <C-Up> <C-W><
nmap <C-Down> <C-W>>



" backups
set nobackup nowritebackup noswapfile



" search
set ignorecase incsearch hlsearch



set cursorline
set ruler " always show current position
set mouse=a
set so=7



source $VIMRUNTIME/mswin.vim
behave mswin



" encoding
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8



" gui
set guioptions-=r
set guioptions-=L
set guioptions-=T
set guioptions-=m
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar>
				\set guioptions-=T <Bar>
				\set guioptions-=m <Bar>
			\else <Bar>
				\set guioptions+=T <Bar>
				\set guioptions+=m <Bar>
			\endif<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>
map <C-t> :FufFile<CR>



" font
set guifont=Consolas:h10



" autostart
autocmd VimEnter * NERDTree
autocmd BufEnter * lcd %:p:h
autocmd VimEnter * wincmd p
autocmd VimLeave * NERDTreeClose

let g:NERDTreeCopyCmd= 'cp -r '
