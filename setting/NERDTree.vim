Plugin 'scrooloose/nerdtree'
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
