silent! call pathogen#infect()

set t_Co=256
syntax enable
filetype plugin indent on

set vb
set number
set nocompatible
set showmatch
set ruler
set nowrap
set tabstop=4
set expandtab
set shiftwidth=4
set hlsearch
set colorcolumn=80
set autoindent
set wildignore+=node_modules
set backupdir=/Users/wesr/tmp/
set directory=/Users/wesr/tmp/
set nobackup
set nowritebackup
set splitright

set laststatus=2
set timeout timeoutlen=1000 ttimeoutlen=100

set background=dark
" colorscheme base16-chalk
if has("gui_running")
  set go-=T
  set guifont=M+_1mn_light:h18
  set noballooneval
  colorscheme Tomorrow-Night-Bright 
else
  colorscheme Tomorrow-Night-Bright
  set mouse=a
endif

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufNewFile,BufRead *.json set filetype=javascript
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.gradle set filetype=groovy
autocmd BufNewFile,BufRead *._ set filetype=html
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * NERDTree

function! LightMode()
  colorscheme habiLight
  set guifont=Monaco:h13
endfunc

let g:syntastic_enable_signs=1
let g:syntastic_disabled_filetypes = ['cpp', 'html']
let g:syntastic_javascript_checkers = ['jshint']

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

inoremap <expr><TAB>  pumvisible() ? "<C-n>" : "<TAB>"

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

set shell=/bin/bash

let g:ackprg = 'ag --nogroup --nocolor --column'

let g:ctrlp_extensions = ['line', 'funky', 'csearch']
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
nnoremap <C-f> :CtrlPFunky<Cr>

nmap <leader>a :Ack 
nmap <leader>c :Gcommit --amend<Cr>
