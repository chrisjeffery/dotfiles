" Set up indentation
syntax enable
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

" Split windows more naturally
set splitbelow
set splitright

set showcmd
set laststatus=2
set encoding=utf-8
set t_Co=256

set hlsearch
set incsearch

nnoremap j gj
nnoremap k gk

nmap <Tab> ;NERDTreeToggle<CR>

set grepprg=ack\ -k

set nocompatible               " be iMproved
filetype off                   " required!



set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'



" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'chrisjeffery/neocomplcache'
" Bundle 'scrooloose/syntastic'
" Bundle 'pydave/AsyncCommand'
" Bundle 'sjl/splice.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive.git'
Bundle 'kablamo/vim-git-log'
Bundle 'scrooloose/nerdtree'
Bundle 'airblade/vim-gitgutter'
Bundle 'flazz/vim-colorschemes'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'geekjuice/vim-spec'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'


" Powerline configs
set rtp +=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'

"""NERDTree conf
let NERDTreeShowBookmarks=1

""" easymotion config
nmap <space> <Plug>(easymotion-s2)
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Pane navigation
"
" Maps <C-h/j/k/l> to switch vim splits in the given direction. If there are
" no more windows in that direction, forwards the operation to tmux.
" Additionally, <C-\> toggles between last active vim splits/tmux panes.

if exists("g:loaded_tmux_navigator") || &cp || v:version < 700
  finish
endif
let g:loaded_tmux_navigator = 1

function! s:UseTmuxNavigatorMappings()
  return !exists("g:tmux_navigator_no_mappings") || !g:tmux_navigator_no_mappings
endfunction

function! s:InTmuxSession()
  return $TMUX != ''
endfunction

let s:tmux_is_last_pane = 0
au WinEnter * let s:tmux_is_last_pane = 0

" Like `wincmd` but also change tmux panes instead of vim windows when needed.
function! s:TmuxWinCmd(direction)
  if s:InTmuxSession()
    call s:TmuxAwareNavigate(a:direction)
  else
    call s:VimNavigate(a:direction)
  endif
endfunction

function! s:TmuxRun(shellCommand)
  if s:InTmuxSession()
 		let cmd = "tmux respawn-pane -k -t work:1.1 ls"
		silent call system(cmd)
	endif
endfunction

function! s:TmuxAwareNavigate(direction)
  let nr = winnr()
  let tmux_last_pane = (a:direction == 'p' && s:tmux_is_last_pane)
  if !tmux_last_pane
    call s:VimNavigate(a:direction)
  endif
  " Forward the switch panes command to tmux if: " a) we're toggling between the last tmux pane;
  " b) we tried switching windows in vim but it didn't have effect.
  if tmux_last_pane || nr == winnr()
    let cmd = 'tmux select-pane -' . tr(a:direction, 'phjkl', 'lLDUR')
    silent call system(cmd)
    let s:tmux_is_last_pane = 1
  else
    let s:tmux_is_last_pane = 0
  endif
endfunction

function! s:VimNavigate(direction)
  try
    execute 'wincmd ' . a:direction
  catch
    echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, CTRL-C quits: wincmd k' | echohl None
  endtry
endfunction

command! TmuxNavigateLeft call <SID>TmuxWinCmd('h')
command! TmuxNavigateDown call <SID>TmuxWinCmd('j')
command! TmuxNavigateUp call <SID>TmuxWinCmd('k')
command! TmuxNavigateRight call <SID>TmuxWinCmd('l')
command! TmuxNavigatePrevious call <SID>TmuxWinCmd('p')

command! TmuxRunMocha call <SID>TmuxRun('mocha')

if s:UseTmuxNavigatorMappings()
  nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>
	nnoremap <cr> :call RunAllSpecs()<cr>
endif


colorscheme distinguished
" source $HOME/dotfiles/vim-colors/distinguished.vim
syntax enable
