if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'aceofall/gtags.vim'
Plug 'skywind3000/vim-preview'
Plug 'Yggdroot/LeaderF', {'do':'./install.sh'}
Plug 'skywind3000/asyncrun.vim'

" Initialize plugin system
call plug#end()

set term=xterm
syntax enable
syntax on
colorscheme desert
set nu!
set foldmethod=syntax
" set autoindent
" set cindent
" set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set ai!
set showmatch
set ruler
set backspace=2
set fenc=utf-8
set hlsearch
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set csprg=gtags-cscope
"---------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") ==1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"---------------------------------------------------------------------------
"配置airline主题
"let g:airline_theme='badwolf'
"配置airline插件
" These lines setup the environment to show graphics and colors correctly.
set t_Co=256
let g:airline_powerline_fonts = 1
set laststatus=2 " Always display the statusline in all windows
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  " powerline 符号
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
"---------------------------------------------------------------------------
"配置indentLine
let g:indentLine_char='|'
let g:indentLine_enabled=1
"---------------------------------------------------------------------------
"nmap <c-v> +gp
"nmap <c-c> +y
"---------------------------------------------------------------------------
"vim-preview引入如下命令:
"PreviewTag       [tagname]       Display the tag in the preview window circularly
"PreviewFile      [+cmd] filename Display the file in the preview window
"PreviewClose     N/A             Close the preview window
"PreviewGoto      command         Open the previewing file in a non-preview window
"PreviewScroll    offset          Scroll preview window without leaving current window or inser mode
"PreviewQuickfix  [linenr]        Preview file in quickfix list
"PreviewSignature [function name] Preview the function signature circularly in the command line
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
"---------------------------------------------------------------------------
"LeaderF配置
let g:Lf_ShortcutF = '<C-P>'
nnoremap <C-f> :LeaderfFunction<CR>
"---------------------------------------------------------------------------
" asyncrun配置
let g:asyncrun_open = 6
let g:asyncrun_bell = 1
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
"---------------------------------------------------------------------------
