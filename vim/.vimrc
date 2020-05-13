" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
filetype plugin on
scriptencoding utf-8
set encoding=utf-8

set background=dark

" Colorscheme: https://github.com/joshdick/onedark.vim
packadd onedark.vim
" Not all terminals support italics properly. If yours does, opt-in.
let g:onedark_terminal_italics = 0
colorscheme onedark
" Now to recover the transparent background:
" https://stackoverflow.com/a/37720708/706801
hi Normal guibg=NONE ctermbg=NONE

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

" Adicionando números de linhas
set number
" para quebrar linhas sem quebrar palavras
set linebreak
set spl=en,pt spell
set rulerformat=%55(%{strftime('%a\ %e\ %b\ %H:%M:%S\ %p')}\ %5l,%-6(%c%V%)\ %P%)

" Para programar em python bonitinho: http://wiki.python.org/moin/Vim
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4 spl=en

" http://twitter.com/#!/vimtips/status/102045890646261760
set foldmethod=indent

"http://notsoevil.net/2010/02/i-love-vim-4-tips-when-using-vim/
" Show Autocompletion options
set wildmenu

" Easily open files in the same directory
cabbr <expr> %% expand('%:p:h')

" These are from Luke Smith
" https://www.youtube.com/watch?v=cTBgtN-s2Zw
" Open splits below and to the right
	set splitbelow splitright

" Split navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

"http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"Highlight unwanted spaces
"
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" From Connermcd: https://github.com/connermcd/dotfiles/
set list
"set listchars=tab:⭾\ 
set listchars=tab:⭾·
set incsearch

