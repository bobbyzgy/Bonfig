" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" ******** MACVIM/GVIM Global Settings Start ********
set nu
set noundofile
set nobackup
set noswapfile
set listchars=tab:>-,eol:$
set list
set autoindent smartindent shiftround
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cursorline
set cursorcolumn
set ruler
set laststatus=2
set nowrap
" ******** MACVIM/GVIM Global Settings End ********

" ******** Vundle Plugin Start ********
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'jiangmiao/auto-pairs'

call vundle#end()            " required
filetype plugin indent on    " required
" ******** Vundle Plugin Finish ********

" ******** Gruvbox Plugin Start ********
let g:gruvbox_italicize_comments=0
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark
" ******** Gruvbox Plugin End ********

" ******** Airline Plugin Start ********
set encoding=utf-8
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline_theme = "murmur"

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

if has("gui_running")
	let g:airline_left_sep = ''
	let g:airline_left_alt_sep = ''
	let g:airline_right_sep = ''
	let g:airline_right_alt_sep = ''
	let g:airline_symbols.branch = ''
	let g:airline_symbols.colnr = ' :'
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ' :'
	let g:airline_symbols.maxlinenr = '☰ '
	let g:airline_symbols.dirty='⚡'
	let g:airline_symbols.crypt = '🔒'
else
	let g:airline_left_sep = '»'
	let g:airline_left_sep = '▶'
	let g:airline_right_sep = '«'
	let g:airline_right_sep = '◀'
	let g:airline_symbols.colnr = ' ㏇:'
	let g:airline_symbols.colnr = ' ℅:'
	let g:airline_symbols.crypt = '🔒'
	let g:airline_symbols.linenr = '☰'
	let g:airline_symbols.linenr = ' ␊:'
	let g:airline_symbols.linenr = ' ␤:'
	let g:airline_symbols.linenr = '¶'
	let g:airline_symbols.maxlinenr = ''
	let g:airline_symbols.maxlinenr = '㏑'
	let g:airline_symbols.branch = '⎇'
	let g:airline_symbols.paste = 'ρ'
	let g:airline_symbols.paste = 'Þ'
	let g:airline_symbols.paste = '∥'
	let g:airline_symbols.spell = 'Ꞩ'
	let g:airline_symbols.notexists = 'Ɇ'
	let g:airline_symbols.whitespace = 'Ξ'
endif

" ******** Airline Plugin Finish ********
