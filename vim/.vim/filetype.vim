" my filetype file
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.mdp		setfiletype mdp
  au! BufRead,BufNewFile *.plot		setfiletype gnuplot
