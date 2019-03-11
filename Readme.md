# 安装方法

    mv .vim .vim.bk
    cd && git clone http://github.com/fangpin/.vim
	cd ~/.vim && ./install
	
# 主要特点

- 常见dict 自动补全
- 完善NERDTree的用法
	- <F3>可以快速打开和关闭
- 增加syntastic，在保存代码时自动检查代码中的错误
- 增加代码格式优化功能
	- 按F6可以格式化C/C++/python/perl/java/jsp/xml/代码
- 高亮显示列功能
- 缩进自动提示功能(indentLine)
- 按F5可以直接编译并执行C、C++、java代码以及执行shell脚本
- 按“F8”可进行C、C++代码的调试
- 自动插入文件头 ，新建C、C++源文件时自动插入表头：包括文件名、作者、联系方式、建立时间等，读者可根据需求自行更改
- “F3”可列出当前目录文件，打开树状文件目录
- "F4"可以打开
- 支持鼠标选择、方向键移动
- 代码高亮，自动缩进，显示行号，显示状态行
- 按“Ctrl + P”可自动补全
- []、{}、()、""、' '等都自动补全
- ctrlp goto anything

# 主要插件
- Bundle 'tpope/vim-fugitive'
- Bundle 'Yggdroot/indentLine'
- let g:indentLine_char = '┊'
- Bundle 'L9'
- Bundle 'FuzzyFinder'
- Bundle 'https://github.com/wincent/command-t.git'
- Bundle 'Auto-Pairs'
- Bundle 'python-imports.vim'
- Bundle 'CaptureClipboard'
- Bundle 'ctrlp-modified.vim'
- Bundle 'last_edit_marker.vim'
- Bundle 'synmark.vim'
- Bundle 'SQLComplete.vim'
- Bundle 'Javascript-OmniCompletion-with-YUI-and-j'
- Bundle 'jslint.vim'
- Bundle "pangloss/vim-javascript"
- Bundle 'Vim-Script-Updater'
- Bundle 'ctrlp.vim'
- Bundle 'tacahiroy/ctrlp-funky'
- Bundle 'jsbeautify'
- Bundle 'The-NERD-Commenter'
- Bundle 'django_templates.vim'
- Bundle 'Django-Projects'
- Bundle 'mattn/emmet-vim'
- Bundle 'scrooloose/syntastic'
- Bundle 'http://github.com/c9s/colorselector.vim'
- Bundle 'https://github.com/Lokaltog/vim-powerline'
- Bundle 'https://github.com/vim-scripts/a.vim.git'
- Bundle 'https://github.com/tpope/vim-commentary.git'
- Bundle 'https://github.com/majutsushi/tagbar.git'


# 补充
tagbar插件需要ctags支持，与mac xcode中的有些不兼容，需要下载ctags源码重新编译，并在vimrc中修改ctags的路径。例如  let g:tagbar_ctags_bin='~/ctags'
