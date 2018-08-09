
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
Plug 'Lokaltog/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'leafgarland/typescript-vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'sirver/ultisnips'
Plug 'styled-components/vim-styled-components'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'valloric/youcompleteme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'fholgado/minibufexpl.vim'
cal plug#end()

noremap <script> <silent> <unique> <C-b> :CtrlPBuffer<CR>
nnoremap <Tab> :NERDTreeToggle<CR>

" ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" airline (powerline)
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'


" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsSnippetsDir="~/dotfiles/nvim/UltiSnips"
" let g:UltiSnipsSnippetDirectories = ['~/dotfiles/UltiSnips', 'UltiSnips']
" let g:UltiSnipsSnippetDirectories = ['.vim/UltiSnips', 'UltiSnips'].



" the following rpbt_colorpairs are mapped to the gruvbox dark theme colours
" gruvbox aqua
" gruvbox purple
" gruvbox blue
" gruvbox yellow
" gruvbox green
" gruvbox red
" gruvbox aqua
" gruvbox purple
" gruvbox blue
" gruvbox yellow
" gruvbox green
" gruvbox red

let g:rbpt_colorpairs = [
    \ ['108',   '8ec07c'],
    \ ['175',   'd3869b'],
    \ ['109',   '83a598'],
    \ ['214',   'fabd2f'],
    \ ['142',   'b8bb26'],
    \ ['167',   'fb4934'],
    \ ['72',    '689d6a'],
    \ ['132',   'b16286'],
    \ ['66',    '458588'],
    \ ['172',   'd79921'],
    \ ['106',   '98971a'],
    \ ['124',   'cc241d'],
    \ ]

let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

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
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)

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

"themeing
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_highlight_lines = 0
set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
let g:airline_theme='distinguished'
highlight clear SignColumn
