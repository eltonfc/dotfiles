" vim:foldmethod=marker:foldlevel=0

" Encoding {{{
scriptencoding utf-8
set encoding=utf-8
filetype plugin on
" }}}

" Colors {{{
" https://github.com/joshdick/onedark.vim
packadd onedark.vim
" screen doesn't support italics :(
let g:onedark_terminal_italics = 0
colorscheme onedark
set background=dark
" Now to recover the transparent background:
" https://stackoverflow.com/a/37720708/706801
hi Normal guibg=NONE ctermbg=NONE
" }}}

" User Interface {{{
set colorcolumn=80
set cursorline
set nolinebreak
set list
set listchars=tab:⭾·
set number
set rulerformat=%55(%{strftime('%a\ %e\ %b\ %H:%M:%S\ %p')}\ %5l,%-6(%c%V%)\ %P%)
" }}}

" File navigation/completion {{{
set wildmenu
set wildmode=longest:full
cabbr <expr> %% expand('%:p:h')
" }}}

" Search {{{
set incsearch
set hlsearch
nnoremap <Leader><space> :nohlsearch<CR>
" }}}

" Windows and splits {{{
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" }}}

" Spell {{{
set spl=en,pt
map <Leader>o :setlocal spell!<CR>
"}}}

" Indentation and folding {{{
filetype indent on
set nowrap
set foldmethod=syntax
set smartindent
filetype plugin indent on
" }}}

" Tags and autocomplete {{{
set completeopt=menuone,longest
nnoremap <Leader>t :!ctags -R .
" }}}

" Filetype handling {{{
set modeline
" }}}

" LaTeX {{{
let g:tex_flavor='latex'

" Formatting paragraphs in LaTeX: an "environment-aware gqap"
" https://vim.fandom.com/wiki/Formatting_paragraphs_in_LaTeX:_an_%22environment-aware_gqap%22
au FileType tex omap lp ?^$\\|^\s*\(\\begin\\|\\end\\|\\label\)?1<CR>//-1<CR>.<CR>

" Fold at environment limits:
au FileType tex setlocal foldmarker=\\begin,\\end
au FileType tex setlocal foldmethod=marker

" Shorter tabs
au FileType tex setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType tex setlocal spell spelllang=en,pt

function! SyncTexForward()
    let execstr = "silent !zathura --synctex-forward ".line(".").":".col(".").":%:p %:p:r.pdf &"
    exec execstr
endfunction
au FileType tex nmap <Leader>f :call SyncTexForward()<CR>

" Latex Macros {{{
au FileType tex inoremap <Space><Space> <ESC>/<++><Enter>"_cf>
au FileType tex nnoremap <Space><Space> <ESC>/<++><Enter>"_cf>
au FileType tex nnoremap ;a <Esc>o\begin{array*}<Enter><Enter>\end{array*}<Esc>ki
au FileType tex inoremap ;a <Esc>o\begin{array*}<Enter><Enter>\end{array*}<Esc>ki
au FileType tex set wildignore+=,*.aux,*.fdb_latexmk,*.fls,*.lof,*.log,*.lot,*.pdf,*.synctex.gz,*.toc
" }}}

"}}}

" Python {{{
" Python formatting http://wiki.python.org/moin/Vim
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType python setlocal spell spl=en
" au FileType python setlocal foldmethod=indent "For now...
" }}}

" (Bibliographic) Notes {{{
" Open the pdf file in the markdown note
au FileType markdown nnoremap ;p /pdf =<CR>f{yi{:silent !zathura <C-R>" >&/dev/null & disown <CR><CR> z+ '' zz
" }}}

" Highlight unwanted spaces {{{
"http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
" }}}

" vimrc management {{{
 nnoremap <leader>ev :vsp $MYVIMRC<CR>
 nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

