scriptencoding utf-8
set encoding=utf-8


" Colorscheme: https://github.com/joshdick/onedark.vim
packadd onedark.vim
" Not all terminals support italics properly. If yours does, opt-in.
let g:onedark_terminal_italics = 0
colorscheme onedark
set background=dark
" Now to recover the transparent background:
" https://stackoverflow.com/a/37720708/706801
hi Normal guibg=NONE ctermbg=NONE

filetype plugin on

" Easily open files in the same directory
cabbr <expr> %% expand('%:p:h')

"http://vim.wikia.com/wiki/Highlight_unwanted_spaces
"Highlight unwanted spaces
"
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" These settings can be easily read in :help
"
set colorcolumn=80
set completeopt=menuone,longest
set cursorline
set incsearch
set foldmethod=syntax
set linebreak
set list
set listchars=tab:⭾·
set number
set rulerformat=%55(%{strftime('%a\ %e\ %b\ %H:%M:%S\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set smartindent
set spl=en,pt
set splitbelow splitright
set wildmenu
set wildmode=longest:full

""" (Re)mappings
" Split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Leader>o :setlocal spell!<CR>

"""END

""" LaTeX related stuff
" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
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

""Latex Macros
au FileType tex inoremap <Space><Space> <ESC>/<++><Enter>"_cf>
au FileType tex nnoremap <Space><Space> <ESC>/<++><Enter>"_cf>
au FileType tex nnoremap ;a <Esc>o\begin{array*}<Enter><Enter>\end{array*}<Esc>ki
au FileType tex inoremap ;a <Esc>o\begin{array*}<Enter><Enter>\end{array*}<Esc>ki
""END

"""END

""" Python
" Python formatting http://wiki.python.org/moin/Vim
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType python setlocal spell spl=en
"""END


""" (Bibliographic) Notes
au FileType markdown nnoremap ;p /pdf =<CR>f{yi{:silent !zathura <C-R>" 2>/dev/null & disown <CR><CR>
"""END
