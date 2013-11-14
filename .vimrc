set nocompatible               " be iMproved
filetype off                   " required!
set enc=utf-8
set hidden
set nobackup
set nowritebackup
set noswapfile
" automatically read file changed outside of Vim
set autoread

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Copy to Clipboard (on Unix)
set clipboard+=unnamed
set clipboard+=+

" use open windows/tabs for buffer switching
set switchbuf=useopen,usetab


" jump to last cursor position when opening files
function! ResCur()
    if line("'\"") <= line("$")
	normal! g`"
	return 1
    endif
endfunction

augroup resCur
	autocmd!
	autocmd BufWinEnter * call ResCur()
augroup END

" Show partial commands in the last line of the screen
set showcmd


" Line wrapping
set wrap
" " but don't split words
set lbr
" "show this in front of broken lines
set showbreak=…

" split new window at the right of current
set spr

" Set the command window height to 1 lines
set cmdheight=1


" This makes more sense than the default of 1
set winminheight=0

" no welcome screen
set shortmess=atIoOTts

" Always display the status line, even if only one window is displayed
set laststatus=2

set autoindent
set noexpandtab
set tabstop=4
set shiftwidth=4
set list
"set listchars=eol:¬,nbsp:⋅,tab:\|\ ,trail:⋅,extends:>,precedes:<
set listchars=nbsp:⋅,tab:\|\ ,trail:⋅,extends:>,precedes:<

set whichwrap+=<,>,[,],h,l
set nostartofline
set backspace=indent,eol,start

" Highlight searches
set hlsearch

" " Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" " do highlight as you type your search phrase
set incsearch

" Better command-line completion
set wildmenu
set wildignore+=*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,.git,.svn
set wildmode=list:longest

set errorformat+=%*[\"]%f%*[\"]\\,\ line\ %l:\ %m
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=0

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15


" VUNDLE

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:

" original repos on github
Bundle 'tpope/vim-surround'
Bundle 'henrik/vim-indexed-search'
Bundle 'Valloric/YouCompleteMe'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'SirVer/ultisnips'
Bundle 'docunext/closetag.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'flazz/vim-colorschemes'
Bundle 'vim-scripts/PDV--phpDocumentor-for-Vim'
" vim-scripts repos
Bundle 'YankRing.vim'
Bundle 'ScrollColors'
Bundle 'L9'
Bundle 'mru.vim'
Bundle 'taglist.vim'
Bundle 'SearchComplete'
Bundle 'bufkill.vim'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'

filetype plugin indent on     " required!

au! BufRead,BufNewFile,BufWinEnter *Test.php
          \ setfiletype php.phpunit
" underscores are heavily used due to our naming convention
" so remove it from word boundary!
" note: ,b ,w ,e can be used, :h camelcasemotion
au! BufRead,BufNewFile,BufWinEnter *.php
          \ set iskeyword+=\_

au! BufRead,BufNewFile,BufWinEnter *.js
          \ setfiletype javascript.jQuery
au FileType php set omnifunc=phpcomplete#CompletePHP


" PHP Generated Code Highlights (HTML & SQL)                                              
let php_sql_query=1                                                                           
let php_htmlInStrings=1


let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

let NERDTreeShowBookmarks = 1

let g:CommandTMaxHeight = 15

" Mappings
let mapleader=","

inoremap jk <esc>

" map j to gj and k to gk, so line navigation ignores line wrap
nmap j gj
nmap k gk

" Copy Paste
map <leader>p "+p
cmap <leader>p <C-R>+
vnoremap <leader>y "+y

map <leader>W :set nowrap!<CR>

map <leader>t :set tags=~/tags/

" fast closing of html tags
imap ;; </CR><c-x><c-o><del>

nmap < <<
nmap > >>
vmap < <gv
vmap > >gv

cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-N> <End>
cnoremap <C-P> <Up>


" delete char after cursor in insert mode, same as del key
inoremap <c-l> <del>

" jump to line AND column
nnoremap ' `
nnoremap ` '

" window switching
noremap <silent> <c-l> <c-w>l
noremap <silent> <c-j> <c-w>j
noremap <silent> <c-k> <c-w>k
noremap <silent> <c-h> <c-w>h

" window resizing
map <c-down> <C-W>-
map <c-up> <C-W>+
map <c-left> <c-w>3<
map <c-right> <c-w>3>

" move to next or previous buffer with ALT+hl
nmap <m-h> :bp<cr>
nmap <m-l> :bn<cr>

" tag bindings
nmap <leader>o <c-w>g}

" Edit the vimrc file
nmap <silent> <F5> :e $MYVIMRC<CR>
nmap <silent> <S-F5> :so $MYVIMRC<CR>:so ~/.gvimrc<cr>

" save with strg-s
map <c-s> <esc>:w<cr>
imap <c-s> <esc>:w<cr>a

" delete word after cursor in insert mode
inoremap <c-s-l> <c-o>dw

inoremap <m-;> <esc>A;<esc>
nnoremap <m-;> A;<esc>

map <F4> :!ctags -h ".php" -R --exclude="\.svn,\.js" --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public \|static \|abstract \|protected \|private )+function ([^ (]*)/\2/f/' -f ~/tags/

" unmark search matches
nmap <silent> ,/ :nohlsearch<CR>

" Refactor names easily (hit ,s on the word you'd like to rename
nnoremap <Leader>S :s/<c-r><c-w>/<c-r><c-w>/g<left><left>
nnoremap <Leader>s :%s/<c-R><c-w>/<c-r><c-w>/g<left><left>

map <leader>; :TagbarToggle<cr>

map <leader>f :CommandT<cr>
map <leader><space> :CommandTBuffer<cr>

map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<cr>

map <silent> <leader>A :exec "Ack! ".expand("<cword>")<cr>
map <leader>a :Ack!<space>

map <leader><enter> :Mru<cr>

nnoremap <silent> <Leader>y :YRShow<CR>
map <silent><F3> :NEXTCOLOR<cr>:redraw<cr>
map <silent><F2> :PREVCOLOR<cr>:redraw<cr>

let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsExpandTrigger="<m-j>"
let g:UltiSnipsJumpForwardTrigger="<m-j>"
let g:UltiSnipsJumpBackwardTrigger="<m-k>"

inoremap <M-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <M-P> :call PhpDocSingle()<CR> 
vnoremap <M-P> :call PhpDocRange()<CR> 

function! OpenPHPManual(keyword)
"let browser = '/usr/bin/firefox'
let browser = '/usr/bin/chromium-browser'
let url = 'http://ro.php.net/' . a:keyword
silent exec '!' . browser . ' "' . url . '"'
endfunction
noremap <silent> <leader>k :call OpenPHPManual(expand('<cword>'))<CR>


syntax on
if has("gui_running")
    colorscheme Monokai

    set guicursor=a:block-Cursor
"cursors dont blink!
    set guicursor+=n-v:blinkon0
else
    colorscheme slate
endif

"quickfix window
map <leader>q :QFix<cr>

" toggles the quickfix window.
command! -bang -nargs=? QFix call QFixToggle(<bang>0)

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced == 0
	cclose
    else
	execute "copen " . g:jah_Quickfix_Win_Height
    endif
endfunction

" used to track the quickfix window
augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
let g:jah_Quickfix_Win_Height=10