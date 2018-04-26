
set encoding=utf-8
set t_Co=256

" set grepprg=ack\ -k

syntax enable
set hlsearch
set incsearch
set showcmd
exec "set lcs=tab:\u21E4\u2015,trail:\uB7,nbsp:~"

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

set splitbelow
set splitright

nnoremap j gj
nnoremap k gk
vnoremap > >gv
vnoremap < <gv

call plug#begin('~/.local/share/nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
" Plug 'fholgado/minibufexpl.vim'
Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
cal plug#end()

noremap <script> <silent> <unique> <C-b> :CtrlPBuffer<CR>
nnoremap <Tab> :NERDTreeToggle<CR>

" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" airline (powerline)
let g:airline_powerline_fonts = 1
let g:airline_theme='distinguished'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


" pangloss/vim-javascript settings
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_arrow_function       = "⇒"
" let g:javascript_conceal_super                = "Ω"
" let g:javascript_conceal_undefined            = "¿"
" let g:javascript_conceal_NaN                  = "ℕ"
" let g:javascript_conceal_prototype            = "¶"
" let g:javascript_conceal_static               = "•"
" let g:javascript_conceal_noarg_arrow_function = "🞅"
" let g:javascript_conceal_underscore_arrow_function = "🞅"

let g:EasyMotion_leader_key = '<Leader>'
nmap s <Plug>(easymotion-s2)
nmap <space> :nohlsearch<CR>
" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  ? <Plug>(easymotion-sn)
omap ? <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Search for selected text, forwards or backwards.
" should delete or replace this with easymotion searching?
" otherwise we get the bug where the n N jumps to (and highlights)
" last non easymotion search
"
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

