
set mouse=a 	" 開啟滑鼠功能 ssh遠端狀態下就不行了
set nocompatible " 和vi不同模式

"swap 檔的資料夾  資料夾必需先建起來
set directory=$HOME/.vim/tmp/
" ==== 換行 tab 空白 縮排 ====
"set autoindent	"(ai)自動縮排
set smartindent "自動縮排
"set nowrap      "不要自動折行
set softtabstop=4
set tabstop=4 	" tab 的字元數
set shiftwidth=4
" set list" 顯示 空白 換行 tab 字元
set backspace=indent,eol,start	" 在編輯模式下也能刪除字元
set showmatch	" 设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号

" ==== 外觀 ====

colorscheme molokai		" 主題

set number			" 顯示行號
set background=dark             " 設定背景為暗，有些colorscheme需要
syntax on                       " 語法上色顯示
set t_Co=256                    " 支援256色
set guifont=Source\ Code\ Pro\ for\ Powerline:h16

"开启光亮光标行
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white


" ==== Search ====
set hlsearch	" 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set ignorecase           " =ic 設定搜尋忽略大小寫(打開對中文會有問題)


" ==== Encoding ====
set encoding=utf-8                " 大概就是設定為UTF8吧
set fileencodings=utf-8
set termencoding=utf-8
set langmenu=none	" 顯示語系 none = 英文
set helplang=cn		" 說明文件 語言

" ==== 狀態列 ====
set ruler			" (ru)右下角狀態列顯示行號列號
set laststatus=2    " 狀態列常駐
set showcmd			" 顯示目前輸入的指令
set showmode        " 在狀態列顯示目前VI模式
" set statusline=%4*%<\%m%<[%f\%r%h%w]\ [%{&ff},%{&fileencoding},%Y]%=\[Position=%l,%v,%p%%] : 狀態列要顯示的內容

"====底下這邊是告訴VIM哪些檔案可以忽略 nerdtree時好用
"" Disable output and VCS files 編譯出來的.o，版本控制之類的
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
" Disable archive files 壓縮檔直接忽略
set wildignore+=*.ZIP,*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
" " Disable music files 音樂
set wildignore+=*.mp3,*.mp4,*.m4a,*.m4r
" " Disable pictures 照片
set wildignore+=*.png,*.jpg,*.jpeg,*.gif,*.bmp,*.svg
" " Ignore bundler and sass cache 這是Ruby on Rails的，沒用就忽略吧
" set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
" " Disable temp and backup files VIM自己的.swp
set wildignore+=*.swp,*~,._*
set wildignore+=Thumbs.db

" ==== Vundle Plugin ====
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'ap/vim-css-color'
"Plugin 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'toyamarinyon/vim-swift'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'kshenoy/vim-signature'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/a.vim'

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


" ==== END Vundle Plugin ====

" ==== Powerline ====
"let g:Powerline_symbols = 'fancy'
" ========
" ==== AirLine ====
let g:airline#extensions#tabline#enabled = 1
set timeoutlen=50
let g:airline_powerline_fonts = 1

let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

" ========

" ==== NERDTree ====
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <F6> :NERDTreeToggle<CR>

" only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let NERDTreeIgnore=['\.png$','\.jpg$', '\.gif$', '\.dmg$', '\.$','.DS_Store' , '\.git$', '\.svn$', '\.clean$', '\.swp$', '\.bak$', '\.hg$', '\.hgcheck$', '\~$' ]
let NERDTreeIgnore+=['\.a$', '\.so$', '\.class$','\.swf$','\.meta$','\.jar$' ]

" ========

" ==== Tagbar ====
nmap <F8> : TagbarToggle<CR>
" ========
"
"
" ==== molokai ====
let g:molokai_original = 1
let g:rehash256 = 1
" =======
"
" ==== CtrlP ====
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" ========
" ==== YouCompleteMe ====
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_use_ultisnips_completer = 1

" ========
" ==== UltiSnips ====
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-y>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ========
