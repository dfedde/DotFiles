set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let mapleader='\'  
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'    
Bundle 'msanders/snipmate.vim' 
Bundle 'mattn/emmet-vim' 
Bundle 'tpope/vim-fugitive'    
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-rails'  
Bundle 'Raimondi/delimitMate'   
Bundle 'scrooloose/syntastic'
Bundle 'vim-ruby/vim-ruby' 
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nathanaelkane/vim-indent-guides' 
Bundle 'Bogdanp/rbrepl.vim'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
  "
  " " Brief help
  " " :BundleList          - list configured bundles
  " " :BundleInstall(!)    - install(update) bundles
  " " :BundleSearch(!) foo - search(or refresh cache first) for foo
  " " :BundleClean(!)      - confirm(or auto-approve) removal of unused
  "  bundles
  " "
  " " see :h vundle for more details or wiki for FAQ
  " " NOTE: comments after Bundle command are not allowed..
  "
set hidden
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
"set spell spelllang=en_us
set shiftwidth=2
set softtabstop=2
set expandtab
"turn on auto compeate by default
let g:neocomplcache_enable_at_startup = 1
map Y y$
nnoremap <C-L> :nohl<CR><C-L>

function! WinMove(key) 
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr()) "we havent moved
      if (match(a:key,'[jk]')) "were we going up/down
        wincmd v
      else 
        wincmd s
      endif
      exec "wincmd ".a:key
    endif
endfunction

"add new windows
map <leader>h              :call WinMove('h')<cr>                                         
map <leader>k              :call WinMove('k')<cr>                                          
map <leader>l              :call WinMove('l')<cr>                                       
map <leader>j              :call WinMove('j')<cr>
"move threu windows
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>
"use javascript higliting for javascript 
autocmd BufNewFile,BufRead *.json set ft=javascript
"adds the remove function
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

syntax on
filetype plugin indent on     " required!

"so that tab guids look better
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :let indent_guides_start_level=2
autocmd VimEnter,Colorscheme * :let indent_guides_guide_size=1

