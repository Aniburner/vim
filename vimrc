 "__     _____ __  __ ____   ____ 
 "\ \   / /_ _|  \/  |  _ \ / ___|
  "\ \ / / | || |\/| | |_) | |    
   "\ V /  | || |  | |  _ <| |___ 
    "\_/  |___|_|  |_|_| \_\\____|

" :w !sudo tee % "当不小心没有用sudo权限打开文件导致不能保存时的命令

" Vundle 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
Plugin 'vim-airline/vim-airline'
Plugin 'connorholyday/vim-snazzy'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kshenoy/vim-signature' " add marks into code
Plugin 'jiangmiao/auto-pairs'
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" convenience
let mapleader=" "
syntax on
map R :source $MYVIMRC<CR>
map s <nop>
map S :w<CR>
map Q :q<CR>
map ; :
"split screen
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map sk :set splitbelow<CR>:split<CR>
map si :set nosplitbelow<CR>:split<CR>
" press space space to jump to the next <++> and edit it 
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <C-h> <++> 
" use figlet to insert art ASCII
map fl :r !figlet
" change word to uppercase in insert mode
inoremap <C-u> <Esc>gUiwea
" some functions 
set number
"set relativenumber 
set cursorline
set wrap
set showcmd
set showmode
set wildmenu
set ignorecase
set smartcase
set scrolloff=3
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent "C/C++ auto shift
set showmatch
"set mouse=a  Enable mouse usage (all modes) "use mouse

" spelling check, suggestion, dictionary
map <LEADER>sc :set spell!<CR>
map <LEADER>ss z=
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s 
" Change Cursor pattern in alacritty terminal
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" search highlight
set hlsearch
exec "nohlsearch"
set incsearch
" = for search next, - for last, zz for move to center, space+Enter for
" nohighlight
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>
" moving operation
noremap j h
noremap k j
noremap h i
noremap H I
noremap i k
noremap J 7h
noremap K 5j
noremap L 7l
noremap I 5k
" goto the start/end of the line
noremap <C-j> 0
noremap <C-l> $

"<F5> 编译运行
map <F5> :call ComplieAndRun() <CR>
"<C-F5> 调试
map <C-F5> :call Rungdb() <CR>
"编译
func! ComplieAndRun()
	exec "w"
	if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -std=c++11 -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java' 
        exec "!javac %" 
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
       "exec "!time python2.7 %"
        exec "!time python3.6 %"
    elseif &filetype == 'html'
        exec "!google-chrome % &"
    endif
endfunc
"调试
func! Rungdb()
	exec "w"
	exec "!g++ % -std=c++11 -g -o %<"
	exec "!gdb ./%<"
endfunc

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

  "____  _             _       
 "|  _ \| |_   _  __ _(_)_ __  
 "| |_) | | | | |/ _` | | '_ \ 
 "|  __/| | |_| | (_| | | | | |
 "|_|   |_|\__,_|\__, |_|_| |_|
                "|___/         
" snazzy
let g:SnazzyTransparent = 1
color snazzy

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
noremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
noremap g/ :YcmCompleter GetDoc<CR>
noremap gt :YcmCompleter GetType<CR>
noremap gr :YcmCompleter GoToReferences<CR>

" NERDTree
map nt :NERDTree<CR>

" NREDTree-git 
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" vim-signature 
   "mx           Toggle mark 'x' and display it in the leftmost column
   "dmx          Remove mark 'x' where x is a-zA-Z
 "
   "m,           Place the next available mark
   "m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
   "m-           Delete all marks from the current line
   "m<Space>     Delete all marks from the current buffer
   "]`           Jump to next mark
   "[`           Jump to prev mark
   "]'           Jump to start of next line containing a mark
   "['           Jump to start of prev line containing a mark
   "`]           Jump by alphabetical order to next mark
   "`[           Jump by alphabetical order to prev mark
   "']           Jump by alphabetical order to start of next line having a mark
   "'[           Jump by alphabetical order to start of prev line having a mark
   "m/           Open location list and display marks from current buffer
 "
   "m[0-9]       Toggle the corresponding marker !@#$%^&*()
   "m<S-[0-9]>   Remove all markers of the same type
   "]-           Jump to next line having a marker of the same type
   "[-           Jump to prev line having a marker of the same type
   "]=           Jump to next line having a marker of any type
   "[=           Jump to prev line having a marker of any type
   "m?           Open location list and display markers from current buffer
   "m<BS>        Remove all markers
   "This will allow the use of default behavior of m to set marks and, if the line already contains the mark, it'll be unset. The default behavior of ]', [', ]` and [` is supported and enhanced by wrapping around when beginning or end of file is reached.

 "The command :SignatureToggle can be used to show/hide the signs. Note that this does not delete any of the marks but only hides them. This is a buffer-specific command.
 "
 "If for some reason, the marks and their sign displays go out of sync, use :SignatureRefresh to refresh them.
 "
 "For more details on customization refer the help
