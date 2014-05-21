
"===============================================================================
" 						NOTHING TO SEE HERE FOLKS
"===============================================================================

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

set grepprg=ack\ -k


"===============================================================================
"						I DON'T KNOW WHY THESE ARE HERE
"							BUT I KNOW THEY MATTER.
"===============================================================================

set nocompatible               " be iMproved
filetype off                   " required!



"===============================================================================
" 									PLUGINS
"===============================================================================

" init vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()


" let Vundle manage Vundle (REQUIRED)
	Bundle 'gmarik/vundle'
" git in vim is awesome
	Bundle 'tpope/vim-fugitive'
" best plugin for moving the cursor at speed of thought
	Bundle 'Lokaltog/vim-easymotion'
" find and open files / buffers with fuzzy + most recent search
	Bundle 'kien/ctrlp.vim'
" opens a sidebar with a file browse tree
	Bundle 'scrooloose/nerdtree'
" needed for sync with external scripts. pretty bad
	Bundle 'pydave/AsyncCommand'
" TODO what is this?
	Bundle 'chrisjeffery/neocomplcache'
" TODO I think this works with fugitive
	Bundle 'kablamo/vim-git-log'
" TODO wat
	Bundle 'sjl/splice.vim'
" TODO I have no idea!
	Bundle "MarcWeber/vim-addon-mw-utils"
	Bundle "tomtom/tlib_vim"
" see which files have been changed
	Bundle 'airblade/vim-gitgutter'
" WAT
	Bundle 'tpope/vim-haml'
" emmet livestyle -html expansion
	Bundle 'mattn/livestyle-vim'
" tell you your js is bad
	Bundle 'Shutnik/jshint2.vim'
" SCSS syntax highlighting
	Bundle 'cakebaker/scss-syntax.vim'
" list and select from all open buffers
	Bundle 'vim-scripts/bufexplorer.zip'
" snippet expansion ftw
	Bundle "garbas/vim-snipmate"
	Bundle "honza/vim-snippets"

Bundle 'derekwyatt/vim-scala'
Bundle 'flazz/vim-colorschemes'



"===============================================================================
" 								PLUGIN CONF
"===============================================================================

"""NERDTree conf
let NERDTreeShowBookmarks=1

" JSHint config
let jshint2_command = '/space/bin/jshint'
let jshint2_save = 1

" powerline requires 256 colors and some other stuff
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'fancy'

" for gitgutter:"
highlight clear SignColumn

" required for vundle
filetype plugin indent on


"""NERDTree conf
let NERDTreeShowBookmarks=1



"===============================================================================
" 							BETTER MOTION COMMANDS
"===============================================================================

" makes scrolling smoother
nnoremap j gj
nnoremap k gk

" Better indentation in visual mode
vnoremap > >gv
vnoremap < <gv

" get to files or buffers easier!
noremap <script> <silent> <unique> <C-b> :BufExplorer<CR>
nnoremap <Tab> :NERDTreeToggle<CR>

" from easymotion plugin
let g:EasyMotion_leader_key = '<Leader>'
nmap s <Plug>(easymotion-s2)

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


" Search for selected text, forwards or backwards.
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>



"===============================================================================
" 								APPEARANCE
"===============================================================================

" make tabs, trailing whitespace, and nbsp's visible
exec "set lcs=tab:\u21E4\u2015,trail:\uB7,nbsp:~"

" Set listchars off for some file types and read only mode
augroup VisibleNaughtiness
    autocmd!
    autocmd BufEnter  *       set list
	autocmd BufEnter  *.txt   set nolist
	autocmd BufEnter  *.vp*   set nolist
	autocmd BufEnter  *       if !&modifiable
	autocmd BufEnter  *           set nolist
    autocmd BufEnter  *       endif
augroup END

" Highlight all search results
set hlsearch
set incsearch



"===============================================================================
" 								INDENTATION
"===============================================================================

set smartindent
set shiftwidth=4
set tabstop=4
set noexpandtab
set smarttab

" some of the above were getting overridden by a plugin, so BufEnter!
augroup PythonMode
	autocmd!
	autocmd BufEnter *.py set ts=4
	autocmd BufEnter *.py set smarttab
	autocmd BufEnter *.py set noexpandtab
augroup END

set showcmd
set grepprg=ack\ -k



"===============================================================================
" 									COLOURS
"===============================================================================

" Make tabs and listchars be subtle
hi SpecialKey ctermfg=238 guifg=#649A9A

" Make highlightinh a little less gharish
hi Search cterm=NONE ctermfg=black ctermbg=magenta



"===============================================================================
" 						SHORTCUTS FOR BORING THINGS
"===============================================================================

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv




"===============================================================================
"							INTEGRATION FOR TMUX
"===============================================================================


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


"function! Smart_TabComplete()
"  let line = getline('.')                         " current line
"
"  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
"                                                  " line to one character right
"                                                  " of the cursor
"  let leading = substr
"
"  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
"  if (strlen(substr)==0)                          " nothing to match on empty string
"    return "\<tab>"
"  endif
"  let has_period = match(substr, '\.') != -1      " position of period, if any
"  let has_slash = match(substr, '\/') != -1       " position of slash, if any
"  if (!has_period && !has_slash)
"    return "\<C-X>\<C-P>"                         " existing text matching
"  elseif ( has_slash )
"    return "\<C-X>\<C-F>"                         " file matching
"  else
"    return "\<C-X>\<C-O>"                         " plugin matching
"  endif
"endfunction
"inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" Powerline configs
"set laststatus=2
"set encoding=utf-8
"set t_Co=256
let g:Powerline_symbols = 'fancy'

colorscheme distinguished
" source $HOME/dotfiles/vim-colors/distinguished.vim
syntax enable
