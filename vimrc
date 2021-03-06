"set nocompatible              " be iMproved, required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plug 'vim-scripts/L9'

Plug 'tmhedberg/SimpylFold'

"Bundle 'Valloric/YouCompleteMe'

Plug 'scrooloose/syntastic'

Plug 'nvie/vim-flake8'

Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'jmcantrell/vim-virtualenv'

"Plugin 'heavenshell/vim-pydocstring'

"html emmet
Plug 'mattn/emmet-vim'
"golang plugin
Plug 'fatih/vim-go'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call plug#end()            " required
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
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

autocmd BufNewFile,BufRead *.java set tabstop=4  softtabstop=4  shiftwidth=4  textwidth=200  expandtab  autoindent  fileformat=unix 
autocmd BufNewFile,BufRead *.xml set tabstop=4  softtabstop=4  shiftwidth=4  textwidth=200  expandtab  autoindent  fileformat=unix 
autocmd BufNewFile,BufRead *.py set tabstop=4  softtabstop=4  shiftwidth=4  textwidth=200  expandtab  autoindent  fileformat=unix 
autocmd BufNewFile,BufRead *.js,*.css set tabstop=2  softtabstop=2  shiftwidth=2 expandtab 
autocmd BufNewFile,BufRead  *.html set tabstop=2  softtabstop=2  shiftwidth=2 expandtab 
au BufNewFile,BufRead *.sh  set tabstop=2  softtabstop=2  shiftwidth=2  expandtab autoindent
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufRead  *.yaml,*.yml set tabstop=2  softtabstop=2  shiftwidth=2 expandtab 
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"auto add python header --start
au BufNewFile *.py 0r ~/.python_header.template
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s
fun FileName()
    if line("$") > 10
        let l = 10  "这里是字母L 不是数字1
    else
        let l = line("$")
    endif
    exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")
    "最前面是数字1，这里的File Name:要和模板中一致
endfun

fun CreatedTime()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif
    exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: ".strftime("%Y-%m-%d %T")
    "这里Create Time:要和模板中一致
endfun
"auto add python header --end


set encoding=utf-8
"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

let python_highlight_all=1
syntax on


if has('gui_running')
  set background=dark
  colorscheme solarized
else
  set t_Co=256
  colorscheme zenburn
endif

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set nu

let g:ycm_autoclose_preview_window_after_completion=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Maintainer: 
""       Amir Salihefendic
""       http://amix.dk - amix@amix.dk
""
"" Version: 
""       5.0 - 29/05/12 15:43:36
""
"" Blog_post: 
""       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
""
"" Awesome_version:
""       Get this config, nice color schemes and lots of plugins!
""
""       Install the awesome version from:
""
""           https://github.com/amix/vimrc
""
"" Syntax_highlighted:
""       http://amix.dk/vim/vimrc.html
""
"" Raw_version: 
""       http://amix.dk/vim/vimrc.txt
""
"" Sections:
""    -> General
""    -> VIM user interface
""    -> Colors and Fonts
""    -> Files and backups
""    -> Text, tab and indent related
""    -> Visual mode related
""    -> Moving around, tabs and buffers
""    -> Status line
""    -> Editing mappings
""    -> vimgrep searching and cope displaying
""    -> Spell checking
""    -> Misc
""    -> Helper functions
""    -> Support Chinese Character
""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Sets how many lines of history VIM has to remember
"set history=700
"
"" Enable filetype plugins
"filetype plugin on
"filetype indent on
"
"" Set to auto read when a file is changed from the outside
"set autoread
"
"" With a map leader it's possible to do extra key combinations
"" like <leader>w saves the current file
"let mapleader = ","
"let g:mapleader = ","
"
"" Fast saving
"nmap <leader>w :w!<cr>
"
"" :W sudo saves the file 
"" (useful for handling the permission-denied error)
"command W w !sudo tee % > /dev/null
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Set 7 lines to the cursor - when moving vertically using j/k
"set so=7
"
"" Turn on the WiLd menu
"set wildmenu
"
"" Ignore compiled files
"set wildignore=*.o,*~,*.pyc
"if has("win16") || has("win32")
"    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
"else
"    set wildignore+=.git\*,.hg\*,.svn\*
"endif
"
""Always show current position
"set ruler
"
"" Height of the command bar
"set cmdheight=2
"
"" A buffer becomes hidden when it is abandoned
"set hid
"
"" Configure backspace so it acts as it should act
"set backspace=eol,start,indent
"set whichwrap+=<,>,h,l
"
"" Ignore case when searching
"set ignorecase
"
"" When searching try to be smart about cases 
"set smartcase
"
"" Highlight search results
"set hlsearch
"
"" Makes search act like search in modern browsers
"set incsearch 
"
"" Don't redraw while executing macros (good performance config)
"set lazyredraw 
"
"" For regular expressions turn magic on
"set magic
"
"" Show matching brackets when text indicator is over them
"set showmatch 
"" How many tenths of a second to blink when matching brackets
"set mat=2
"
"" No annoying sound on errors
"set noerrorbells
"set novisualbell
"set t_vb=
"set tm=500
"
"" Add a bit extra margin to the left
"set foldcolumn=1
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Enable syntax highlighting
"syntax enable 
"
"try
"    colorscheme desert
"catch
"endtry
"
"set background=dark
"
"" Set extra options when running in GUI mode
"if has("gui_running")
"    set guioptions-=T
"    set guioptions-=e
"    set t_Co=256
"    set guitablabel=%M\ %t
"endif
"
"" Set utf8 as standard encoding and en_US as the standard language
"set encoding=utf8
"
"" Use Unix as the standard file type
"set ffs=unix,dos,mac
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Turn backup off, since most stuff is in SVN, git et.c anyway...
"set nobackup
"set nowb
"set noswapfile
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Use spaces instead of tabs
"set expandtab
"
"" Be smart when using tabs ;)
"set smarttab
"
"" 1 tab == 4 spaces
"set shiftwidth=4
"set tabstop=4
"
"" Linebreak on 500 characters
"set lbr
"set tw=500
"
"set ai "Auto indent
"set si "Smart indent
"set wrap "Wrap lines
"
"
"""""""""""""""""""""""""""""""
"" => Visual mode related
"""""""""""""""""""""""""""""""
"" Visual mode pressing * or # searches for the current selection
"" Super useful! From an idea by Michael Naumann
"vnoremap <silent> * :call VisualSelection('f', '')<CR>
"vnoremap <silent> # :call VisualSelection('b', '')<CR>
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Treat long lines as break lines (useful when moving around in them)
"map j gj
"map k gk
"
"" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?
"
"" Disable highlight when <leader><cr> is pressed
"map <silent> <leader><cr> :noh<cr>
"
"" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l
"
"" Close the current buffer
"map <leader>bd :Bclose<cr>
"
"" Close all the buffers
"map <leader>ba :1,1000 bd!<cr>
"
"" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 
"map <leader>t<leader> :tabnext 
"
"" Opens a new tab with the current buffer's path
"" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"
"" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
"" Specify the behavior when switching between buffers 
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry
"
"" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif
"" Remember info about open buffers on close
"set viminfo^=%
"
"
"""""""""""""""""""""""""""""""
"" => Status line
"""""""""""""""""""""""""""""""
"" Always show the status line
"set laststatus=2
"
"" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Editing mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remap VIM 0 to first non-blank character
"map 0 ^
"
"" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
"nmap <M-j> mz:m+<cr>`z
"nmap <M-k> mz:m-2<cr>`z
"vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
"vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
"if has("mac") || has("macunix")
"  nmap <D-j> <M-j>
"  nmap <D-k> <M-k>
"  vmap <D-j> <M-j>
"  vmap <D-k> <M-k>
"endif
"
"" Delete trailing white space on save, useful for Python and CoffeeScript ;)
"func! DeleteTrailingWS()
"  exe "normal mz"
"  %s/\s\+$//ge
"  exe "normal `z"
"endfunc
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.coffee :call DeleteTrailingWS()
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Ack searching and cope displaying
""    requires ack.vim - it's much better than vimgrep/grep
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" When you press gv you Ack after the selected text
"vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
"
"" Open Ack and put the cursor in the right position
"map <leader>g :Ack 
"
"" When you press <leader>r you can search and replace the selected text
"vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
"
"" Do :help cope if you are unsure what cope is. It's super useful!
""
"" When you search with Ack, display your results in cope by doing:
""   <leader>cc
""
"" To go to the next search result do:
""   <leader>n
""
"" To go to the previous search results do:
""   <leader>p
""
"map <leader>cc :botright cope<cr>
"map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
"map <leader>n :cn<cr>
"map <leader>p :cp<cr>
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Pressing ,ss will toggle and untoggle spell checking
"map <leader>ss :setlocal spell!<cr>
"
"" Shortcuts using <leader>
"map <leader>sn ]s
"map <leader>sp [s
"map <leader>sa zg
"map <leader>s? z=
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Remove the Windows ^M - when the encodings gets messed up
"noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
"
"" Quickly open a buffer for scribble
"map <leader>q :e ~/buffer<cr>
"
"" Quickly open a markdown buffer for scribble
"map <leader>x :e ~/buffer.md<cr>
"
"" Toggle paste mode on and off
"map <leader>pp :setlocal paste!<cr>
"
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! CmdLine(str)
"    exe "menu Foo.Bar :" . a:str
"    emenu Foo.Bar
"    unmenu Foo
"endfunction 
"
"function! VisualSelection(direction, extra_filter) range
"    let l:saved_reg = @"
"    execute "normal! vgvy"
"
"    let l:pattern = escape(@", '\\/.*$^~[]')
"    let l:pattern = substitute(l:pattern, "\n$", "", "")
"
"    if a:direction == 'b'
"        execute "normal ?" . l:pattern . "^M"
"    elseif a:direction == 'gv'
"        call CmdLine("Ack \"" . l:pattern . "\" " )
"    elseif a:direction == 'replace'
"        call CmdLine("%s" . '/'. l:pattern . '/')
"    elseif a:direction == 'f'
"        execute "normal /" . l:pattern . "^M"
"    endif
"
"    let @/ = l:pattern
"    let @" = l:saved_reg
"endfunction
"
"
"" Returns true if paste mode is enabled
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE  '
"    en
"    return ''
"endfunction
"
"" Don't close window, when deleting a buffer
"command! Bclose call <SID>BufcloseCloseIt()
"function! <SID>BufcloseCloseIt()
"   let l:currentBufNum = bufnr("%")
"   let l:alternateBufNum = bufnr("#")
"
"   if buflisted(l:alternateBufNum)
"     buffer #
"   else
"     bnext
"   endif
"
"   if bufnr("%") == l:currentBufNum
"     new
"   endif
"
"   if buflisted(l:currentBufNum)
"     execute("bdelete! ".l:currentBufNum)
"   endif
"endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Support Chinese Character 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if has("multi_byte") 
"    " UTF-8 encode
"    set encoding=utf-8 
"    set termencoding=utf-8 
"    set formatoptions+=mM 
"    set fencs=utf-8,gbk,big5 
"    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)' 
"        set ambiwidth=double 
"    endif 
"    if has("win32") 
"        source $VIMRUNTIME/delmenu.vim 
"        source $VIMRUNTIME/menu.vim 
"        language messages zh_CN.utf-8 
"    endif 
"else 
"    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte" 
"endif
""turn off bell
set vb
set t_vb=
