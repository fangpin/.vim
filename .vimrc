set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

execute pathogen#infect()
let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']

let g:fencview_autodetect=0
set rtp+=$GOROOT/misc/vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示相关  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set go=             " 不要图形按钮  
syntax enable
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

if has('gui_running')
    colorscheme solarized
    set background=dark
    set guifont=Menlo:h16
else
    colorscheme desert
endif

set showcmd         " 输入的命令显示出来，看的清楚些  
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" vim 复制到mac剪贴板
vmap "+y :w !pbcopy<CR><CR>  
nmap "+p :r !pbpaste<CR><CR> 

au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"#!/bin/bash") 
		call setline(2, "# File Name: ".expand("%")) 
		call setline(3, "# Author: fangpin") 
		call setline(4, "# Mail: fpfangpin@163.com") 
		call setline(5, "# Created Time: ".strftime("%c")) 
		call setline(6, "") 
		call setline(7, "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call setline(2,"# coding=utf-8")
        "call append(line("."),"# coding=utf-8")
		call append(line(".")+1, "# File Name: ".expand("%")) 
		call append(line(".")+2, "# Author: fangpin") 
		call append(line(".")+3, "# Mail: fpfangpin@163.com") 
		call append(line(".")+4, "# Created Time: ".strftime("%c")) 
	    call append(line(".")+5, "") 
	    call append(line(".")+6, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
		call append(line("."), "# File Name: ".expand("%")) 
		call append(line(".")+1, "# Author: fangpin") 
		call append(line(".")+2, "# Mail: fpfangpin@163.com") 
		call append(line(".")+3, "# Created Time: ".strftime("%c")) 
	    call append(line(".")+4, "")
	    call append(line(".")+5, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	> File Name: ".expand("%")) 
		call append(line(".")+1, "	> Author: fangpin") 
		call append(line(".")+2, "	> Mail: fpfangpin@163.com") 
		call append(line(".")+3, "	> Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include<iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+8, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"键盘命令
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map! <C-O> <C-Y>,
imap <C-k> <C-y>,
imap <C-j> <ESC>
imap jj <ESC>
imap JJ <ESC>
set mouse=v
nnoremap <leader>CC <Plug>CRV_CRefVimInvoke
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"列出当前目录文件  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录  
map <C-F3> \be  
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"C，C++ java hash python 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!gcc % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
        exec "!g++ -std=c++11 % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
    if &filetype == 'c'
        exec "!gcc % -g -o %<"
    elseif &filetype == 'cpp'
	    exec "!g++ -std=c++11 % -g -o %<"
    endif
"linux use g++
	"exec "!gdb -tui ./%<"
"Mac os x use llvm
    exec "!lldb ./%<"
endfunc


"代码格式优化化

map <F6> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
"当打开vim时自动打开NERDTree
"autocmd vimenter *  NERDTree
"当打开nerdtree后重定位到主窗口
"autocmd VimEnter * wincmd p
"当打开vim时自动打开Tagbar
autocmd vimenter *  Tagbar

" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"退出VIM时自动关闭tagbar
autocmd bufenter * if (winnr("$") == 3 && exists("b:TagbarType") &&b:TagbarType == "primary")  | qa | endif


" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"自动保存
set autowrite
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase




set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu,preview
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"设置tags  
set tags+=~/.vim/cpptags
"set tags+=tags  
set autochdir 


"python补全
let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

set nocompatible               " be iMproved
"filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Plugin 'alvan/vim-closetag'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'https://github.com/wincent/command-t.git'
Bundle 'Auto-Pairs'
Bundle 'python-imports.vim'
Bundle 'synmark.vim'
Bundle 'SQLComplete.vim'
Bundle 'ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/syntastic'
Bundle 'http://github.com/c9s/colorselector.vim'
Bundle 'https://github.com/Lokaltog/vim-powerline'
Bundle 'https://github.com/vim-scripts/a.vim.git'
Bundle 'https://github.com/majutsushi/tagbar.git'
Bundle 'https://github.com/scrooloose/nerdtree'
Bundle 'https://github.com/scrooloose/nerdcommenter.git'
Bundle 'https://github.com/tpope/vim-surround'

"snipmate
" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
 Plugin 'honza/vim-snippets'
"
"" Trigger configuration. Do not use <tab> if you use
let g:UltiSnipsExpandTrigger="<tab>"
" "

runtime macros/matchit.vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"
"ctrlp设置

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

"nerdtree 设置
let NERDTreeIgnore=['\.pyc']
let g:NERDTreeWinSize=20
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif


"tagbar 设置 
nmap <F4> :TagbarToggle<CR>
"let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_ctags_bin='~/.vim/bundle/ctags'
