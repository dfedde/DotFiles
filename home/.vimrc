set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set nobackup
set nowritebackup
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
Bundle 'tomtom/tcomment_vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-haml'
Bundle 'godlygeek/tabular'
Bundle 'thoughtbot/vim-rspec'



"add a bunch more snipits for
Bundle 'scrooloose/snipmate-snippets'
"allow send command to tmux
Bundle 'jgdavey/tslime.vim'

Bundle '907th/vim-auto-save'

"to be able to use ack/ag in vim
Bundle 'rking/ag.vim'

Bundle 'mileszs/ack.vim'

Bundle 'tpope/vim-haml'


"themes
Bundle 'altercation/vim-colors-solarized.git'


"set theme
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


set hidden
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
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set spell spelllang=en_us
set shiftwidth=2
set softtabstop=2
set expandtab
set cursorline

"turn on auto complete by default
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

" "add new windows
" map <leader>h              :call WinMove('h')<cr>                                         
" map <leader>k              :call WinMove('k')<cr>                                          
" map <leader>l              :call WinMove('l')<cr>                                       
" map <leader>j              :call WinMove('j')<cr>
" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nmap <silent> <c-K> :call WinMove('k')<CR>
nmap <silent> <c-J> :call WinMove('j')<CR>
nmap <silent> <c-L> :call WinMove('l')<CR>
nmap <silent> <c-H> :call WinMove('h')<CR>
nmap <leader>s :setlocal spell! spelllang=en_us<cr>
"use javascript higliting for javascript 
autocmd BufNewFile,BufRead *.json set ft=javascript
"adds the remove function
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

filetype plugin indent on     " required!

"so that tab guids look better
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :let indent_guides_start_level=2
autocmd VimEnter,Colorscheme * :let indent_guides_guide_size=1


"for rspec
let g:rspec_command = 'call Send_to_Tmux("clear; time zeus test {spec}\n")'
" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
