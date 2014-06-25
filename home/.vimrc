set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
set nobackup
set nowritebackup
let mapleader='\'

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle.vim'
Plugin 'tpope/vim-surround'    
Plugin 'msanders/snipmate.vim' 
Plugin 'mattn/emmet-vim' 
Plugin 'tpope/vim-fugitive'    
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'  
Plugin 'Raimondi/delimitMate'   
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby' 
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'nathanaelkane/vim-indent-guides' 
Plugin 'Bogdanp/rbrepl.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'thoughtbot/vim-rspec'



"add a bunch more snipits for
Plugin 'scrooloose/snipmate-snippets'
"allow send command to tmux
Plugin 'jgdavey/tslime.vim'

Plugin '907th/vim-auto-save'

"to be able to use ack/ag in vim
Plugin 'rking/ag.vim'

Plugin 'mileszs/ack.vim'

Plugin 'tpope/vim-haml'


"themes
Plugin 'altercation/vim-colors-solarized.git'

" All of your Plugins must be added before the following line
 call vundle#end()            " require
 filetype plugin indent on    " required

"set theme
syntax enable
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized


set hidden
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
"always show position
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set cmdheight=2
"show line numbers
set number
set notimeout ttimeout ttimeoutlen=200
set pastetoggle=<F11>
set shiftwidth=2
set softtabstop=2
set cursorline

""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

""""""""""""""""""""""""""""""""""""""""
" Code Folding
""""""""""""""""""""""""""""""""""""""""
"turn on code folding
set foldenable
set foldmethod=syntax

"when oping a file fold starting at first depth 
set foldlevelstart=1

"only fold 2 deep
set foldnestmax=2
""""""""""""""""""""""""""""""""""""""""
" added motions and maping
""""""""""""""""""""""""""""""""""""""""
inoremap  jk <esc> 
inoremap  <esc> <nop>

""""""""""""""""""""""""""""""""""""""""
" custom abbrivation
""""""""""""""""""""""""""""""""""""""""
ab rtfm read the fine manual
ab psb project_strategy_block 
ab PSB ProjectStrategyBlock 



"turn on auto complete by default
let g:neocomplcache_enable_at_startup = 1
map Y y$

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

"make sure ti higlite all them stupid whitespace chars
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red
"for rspec
let g:rspec_command = 'call Send_to_Tmux("clear; time zeus test {spec}\n")'
" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

function! Reload_firefox()
  write
  silent !echo  'reload' | nc -w 1 192.168.0.36 32000 2>&1 > /dev/null
  redraw!
endfunction

map <leader>r :call Reload_firefox()<CR>
