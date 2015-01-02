set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
let mapleader='\'

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
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
Plugin 'tomtom/tcomment_vim'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'kana/vim-textobj-user'
Plugin 'godlygeek/tabular'
Plugin 'thoughtbot/vim-rspec'

Plugin 'tpope/vim-repeat'

"to work better with tmux
Plugin 'sjl/vitality.vim'

"Use tab for text compleation
Plugin 'ervandew/supertab'

"damn sexy status bar (also tabs)
Plugin 'bling/vim-airline'

" allows keycords for vim hotkeys
Plugin 'dfedde/vim-arpeggio'

Plugin 'noprompt/vim-yardoc'


"add a bunch more snipits for
Plugin 'scrooloose/snipmate-snippets'

"allow send command to tmux
Plugin 'jgdavey/tslime.vim'

"use a singe keystorke to run test in most contexts
Plugin 'jgdavey/vim-turbux'

Plugin '907th/vim-auto-save'

"For vim note taking
Plugin 'xolox/vim-notes'
Plugin 'xolox/vim-misc'

Plugin 'mileszs/ack.vim'

Plugin 'tpope/vim-haml'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'tpope/vim-unimpaired'
"exicure ruby in a file
Plugin 't9md/vim-ruby-xmpfilter'

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


set nohidden
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
set cursorline
set relativenumber


""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
" let vim take care of saving and loading for me
set autoread
set autowrite
set autowriteall
:au FocusLost * silent! wa

" persistent-undo
set undodir=~/.vim/undo

""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent

""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""

" spell checking is on by default
setlocal spell! spelllang=en_us

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

""""""""""""""""""""""""""""""""""""""""
" Code Folding
""""""""""""""""""""""""""""""""""""""""
"turn on code folding
set foldenable
set foldmethod=syntax

"when oping a file fold starting at first depth 
"set foldlevelstart=1

"only fold 2 deep
"set foldnestmax=2
""""""""""""""""""""""""""""""""""""""""
" added motions and mapping
""""""""""""""""""""""""""""""""""""""""
inoremap  jk <esc>
xnoremap  jk <esc>
inoremap <C-[> <esc>

noremap yy Y

" execute this file 
noremap <leader>e :w<CR>:!%<CR>

"open the relative file in a new tab ### this may be be cool tho have as a scritp that could find the one if its open
noremap  <leader>A :tabe<cr><c-o>:A<cr> 

""""""""""""""""""""""""""""""""""""""""
" custom abbrivation
""""""""""""""""""""""""""""""""""""""""
ab rtfm read the fine manual
ab psbl project_strategy_block
ab PSBl ProjectStrategyBlock
ab teh the
ab feild field
ab clockin ⌚ in  
ab clockout ⌚ out 

""""""""""""""""""""""""""""""""""""""""
" Note Taking settings
""""""""""""""""""""""""""""""""""""""""
let g:notes_directories = ['~/Documents/Notes']
let g:notes_shadowdir   =  '~/Documents/shadow_dir'


""""""""""""""""""""""""""""""""""""""""
" Easy motion
""""""""""""""""""""""""""""""""""""""""
"  ____  _____ __  __  _____     _______ ____  
" |  _ \| ____|  \/  |/ _ \ \   / / ____|  _ \ 
" | |_) |  _| | |\/| | | | \ \ / /|  _| | | | |
" |  _ <| |___| |  | | |_| |\ V / | |___| |_| |
" |_| \_\_____|_|  |_|\___/  \_/  |_____|____/ 
"                                              

""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""
let g:airline_detect_whitespace = 0
let g:airline_powerline_fonts=1

""""""""""""""""""""""""""""""""""""""""
" clipboard
""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus

map Y y$

""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

""""""""""""""""""""""""""""""""""""""""
" Turbux
""""""""""""""""""""""""""""""""""""""""
let g:turbux_command_rspec = 'rspec --require /home/dcfedde/Downloads/vim_formatter.rb --format VimFormatter --out rspec.quickfix --format Fuubar --color' " default: rspec"

let g:no_turbux_mappings = 1

map <leader>T <Plug>SendTestToTmux
map <leader>t <Plug>SendFocusedTestToTmux

" map <leader>T :cg rspec.quickfix <cr>
" map <leader>t :cg rspec.quickfix <cr>

""""""""""""""""""""""""""""""""""""""""
" xmpfilter
""""""""""""""""""""""""""""""""""""""""
let g:xmpfilter_cmd = "seeing_is_believing"

autocmd FileType ruby nmap <buffer> <leader>m <Plug>(seeing_is_believing-mark)
autocmd FileType ruby xmap <buffer> <leader>m <Plug>(seeing_is_believing-mark)
autocmd FileType ruby imap <buffer> <leader>m <Plug>(seeing_is_believing-mark)

autocmd FileType ruby nmap <buffer> <leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby xmap <buffer> <leader>c <Plug>(seeing_is_believing-clean)
autocmd FileType ruby imap <buffer> <leader>c <Plug>(seeing_is_believing-clean)

" xmpfilter compatible
autocmd FileType ruby nmap <buffer> <leader>r <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby xmap <buffer> <leader>r <Plug>(seeing_is_believing-run_-x)
autocmd FileType ruby imap <buffer> <leader>r <Plug>(seeing_is_believing-run_-x)

" auto insert mark at appropriate spot.
autocmd FileType ruby nmap <buffer> <leader>R <Plug>(seeing_is_believing-run)
autocmd FileType ruby xmap <buffer> <leader>R <Plug>(seeing_is_believing-run)
autocmd FileType ruby imap <buffer> <leader>R <Plug>(seeing_is_believing-run)


"adds the remove function
command! -complete=file -nargs=1 Remove :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

"so that tab guids look better
let g:indent_guides_auto_colors = 0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :let indent_guides_start_level=2
autocmd VimEnter,Colorscheme * :let indent_guides_guide_size=1

"make sure to highlight all them stupid whitespace chars
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" "for rspec
" let g:rspec_command = 'call Send_to_Tmux("clear; time zeus test {spec}\n")'
" vim-rspec mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>


