" .vimrc

" VIM KEYBINDING OVERRIDES
"
"   Exit insert mode
imap qq <Esc>

"   Exit file (normal mode)
nmap qq :q<CR>  

"   Exit file with force (normal mode)
nmap qqq :q!<CR>

"   Save shortcut
nmap ww :w<CR>

"   Save and quit shortcut
nmap wq :wq<CR>


" CUSTOM KEYBINDINGS
"
" Insert a quick character after pressing space in normal mode
:nmap <Space> i_<Esc>r

" Insert space after current line (normal)
nmap <CR> o<Esc>

" Insert space before current line (normal)
nmap <S-Enter> O<Esc>


" NAVIGATION
"
"   Window Navigation
"       Use ctrl + vim nav key to switch windows
nmap <silent> <C-S-k> :wincmd k<CR>
nmap <silent> <C-S-j> :wincmd j<CR>
nmap <silent> <C-S-h> :wincmd h<CR>
nmap <silent> <C-S-l> :wincmd l<CR>

" 'Cheater' version of above
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

"   Window navigation commands available in insert mode
imap <C-k> <C-o><C-S-k>
imap <C-j> <C-o><C-S-j>
imap <C-h> <C-o><C-S-h>
imap <C-l> <C-o><C-S-l>

" BELLS
" turn on visual bell (turn off shrill noise :)
set vb


" BACKSPACE
set bs=2 

" Fix backspace in windows
set bs=indent,eol,start 


" PATHOGEN
" Easy plugin installation

execute pathogen#infect()


" HELPTAGS
" Run helptags on every doc/ directory in 'runtimepath'

execute pathogen#helptags()

"  VIM-ADDON-MW-UTILS
" required by:
"		snipMate

" call scriptmanager#Activate(["vim-addon-mw-utils"])


" Syntax highlighting
syntax on

" Number (nu)/nonumber (nonu): show line numbers
set nu
set numberwidth=4

" Folding based on indention
set foldmethod=indent

" Fold not by default
set nofoldenable

" Maximum fold depth
set foldnestmax=2


" TABS """"""""""""""""""""""""""""""""""""""""""""""""""""""

set autoindent

" tabstop: number of columns composing a tab
set tabstop=2

" expandtab/noexpandtab: Tab (i-mode) creates spaces
set expandtab

" shiftwidth:
set shiftwidth=2

"   softtabstop: number of columns used (i-mode)
"       if < tabstop && expandtab=null, tabs+spaces
"       if == tabstop && expandtab=null, tabs
"       if expandtab !=null, spaces
set softtabstop=2

" TAB SPACING - LANGUAGE SPECIFIC
" override default tabs based on lang
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType xml setlocal shiftwidth=4 tabstop=4
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType perl setlocal noexpandtab
autocmd FileType cpp setlocal noexpandtab


" LINES """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"   Draw line under current line
set cursorline

" Highlight current line (find a good, light color)
" hi CursorLine cterm=NONE ctermbg=Yellow ctermfg=white guibg=darkred guifg=white
" 
" Cursor color
"
hi Cursor guifg=white guibg=black ctermfg=white ctermbg=black

" Required for:
"   smartusline
"   others...
set nocompatible

" Required for most
filetype plugin indent on

" Never hide statusline
set laststatus=2

" Make sure statusline is visible for SmartusLine
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" SmartusLine
"   line highlighting
" 
let g:smartusline_string_to_highlight = '(%n) %f'
let g:smartusline_hi_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_insert = 'guibg=orange guifg=black ctermbg=58 ctermfg=black'
let g:smartusline_hi_virtual_replace = 'guibg=#e454ba guifg=black ctermbg=magenta ctermfg=black'
let g:smartusline_hi_normal = 'guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black'

" save files as sudo when vim was not started as such
"   TODO: figureout how this works
cmap w!! w !sudo tee > /dev/null %


" PLUGINS """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"   NERDTree
"
let g:NERDTreeDirArrows = 0
let g:NERDTreeWinSize = 20 
"
"       Start NERDTree automatically and place the cursor in main window
autocmd vimenter * NERDTree | wincmd p

"       Toggle NERDTree
nmap <silent> <special> <F2> :NERDTreeToggle<RETURN>

"       Close NERDTree if it is the only thing open
"       Courtesy scrooloose
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTress File highlighting
" courtesy ryanoasis(github)
"
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='.   a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" Color highlighting by filetype for NERDTree explorer
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


" TAGBARTOGGLE
"
"   Toggle Tagbar with F8
nmap <F8> :TagbarToggle<CR>
nmap <F7> :TagbarOpen f<CR>

"   Autofocus
let g:tagbar_autofocus = 1

"   Set Width
let g:tagbar_width = 25

"   Set Zoom Width
"       1: maximum width available
"       0: length of longest visible tag
"       >1: custom width (chars)
let g:tagbar_zoomwidth = 1

" INDENTLINE
"   dangling lines indicating space-indentation
"
"   Vim
let g:indentLine_color_term = 239

"   GVim
let g:indentLine_color_gui = '#A4E57E'

"   Define line character
"       fancier characters require UTF-8
let g:indentLine_char = '|'

"   Toggle lines with F3
nmap <silent> <special> <F3> :IndentLinesToggle<CR>




" BUFFERS
"
"
" " GRB: use fancy buffer closing that doesn't close the split
cnoremap <expr> bd (getcmdtype() == ':' ? 'Bclose' : 'bd')
"
"
" MiniBufExplorer
"
"   ToggleBufferMenu to ALT+b
nmap <silent> <C-b> :MBEToggle<CR>

"   Switch to next normal buffer in current window
nmap <silent> <C-n> :MBEbn<CR>

"   Switch to previous buffer
nmap <C-p> :MBEbp<CR>

"   ToggleBufferMenu Insert Mode
imap <C-b> <C-o><C-b>


" COLORS
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
colorscheme blackboard


" OTHER
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
" syntax highlighting to put in syntax files (.vim/syntax/LANG.vim) as they will be overwritten if used here
syntax match Tab /\t/
hi Tab guifg=blue ctermbg=blue
