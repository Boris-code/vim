" vimrc file content in linux
if has("syntax")
  syntax on
endif

set guifont=Menlo:h14

set background=dark

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif

" 全局配置
set nu
set ai
set magic
set cindent
set fileencodings=utf-8,gb2312,gbk,gb18030
set termencoding=utf-8
set fileformats=unix
set cursorline
set encoding=utf-8
language message zh_CN.UTF-8
" 设置tab为4个空格
set ts=4
set shiftwidth=4
set expandtab

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" """""""""""""""""""""""""""""""""""""
" F8, F11, F12 not used
" """"""""""""""""""""""""""""""""""""
" Vundle插件管理器,具体格式可以在github上搜这个项目。这个需要放在最开始
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 自己管理自己(用户名／项目名是github上的插件)
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'rust-lang/rust.vim'
" vimscripts 的直接写名字
Plugin 'vim-airline'
Plugin 'taglist.vim'
Plugin 'DoxygenToolkit.vim'
" 可以在这里写其它的
call vundle#end()
filetype plugin indent on

" power-line状态栏美化
set laststatus=2 
set t_Co=256

" 配置自动补全
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" 去除空白
nmap wb :%s/\ \{1,\}$//g<CR>

" set Tlist view
let Tlist_Showl_One_File=1
let Tlist_Exit_OnlyWindow=1

" 使用 SHIFT+Insert 插入剪贴板中的内容
inoremap <S-Insert> <ESC>"+p`]a

" case和switch对齐，break和case对齐，public和class对齐
set cinoptions=:0,b1,g0

"映射当前文件的标志，并分割出来窗口
nmap <F8> :Tlist<cr><C-W>h
nmap <F3> :Tabularize /

"映射quickfix的前一个/后一个
map <F6> :cp<CR>
map <F7> :cn<CR>

"nertdcommenter master(注释插件)
map <F9> <leader>cc
map <F10> <leader>cu

"切换头文件和源文件
nnoremap <silent> <F4> :A<cr>

" set NERDTree
nmap wm :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" settings for clang-complete
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/'
let g:clang_complete_macros = 1
"let g:clang_snippets = 1
let g:clang_auto_select = 1
let g:clang_complete_copen = 1
let g:clang_trailing_placeholder = 1
let g:clang_user_options = '-std=c++11'

colorscheme desert
