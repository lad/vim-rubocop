" Vim plugin for running rubocop
"
" Author:   Louis A. Dunne <louisadunne@gmail.com>
" License:  GPLv2
" URL:      https://github.com/lad/vim-rubocop
"
" grep-prog idea from Vincent Driessen original pep8 plugin

if !hlexists('GreenBar')
  hi GreenBar term=reverse ctermfg=white ctermbg=darkgreen guifg=white guibg=darkgreen
endif

let s:THIS_FILE = 0
let s:ALL_FILES = 1

function! s:Rubocop(arg)
  set lazyredraw
  cclose

  let l:grepformat = &grepformat
  let l:grepprg = &grepprg
  set grepformat&vim
  let &grepformat = '%f:%l:%c:%m'
  let &grepprg = 'rubocop --format emacs'
  if exists('g:rubocop_config')
    let &grepprg = &grepprg . ' --config ' . g:rubocop_config
  endif

  if a:arg == s:THIS_FILE
    silent! grep! %
  else
    silent! grep! .
  endif

  let &grepformat = l:grepformat
  let &grepprg = l:grepprg

  let l:qflist=getqflist()
  if empty(l:qflist)
    set nolazyredraw
    redraw!
    echohl GreenBar
    echomsg "Correct!"
    echohl None
  else
    execute 'belowright copen ' . max([float2nr(winheight(0) * 0.25), 4])
    set nolazyredraw
    redraw!
  endif
endfunction

command! RubocopThis      call s:Rubocop(s:THIS_FILE)
command! RubocopAll       call s:Rubocop(s:ALL_FILES)
