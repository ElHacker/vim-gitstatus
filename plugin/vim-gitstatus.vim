" vim-gitstatus.vim
" Author:       Braulio Chavez <mailto:braulio@chamvr.com>
" Version:      0.0.0

if !exists("g:git command")
  let g:git_command = "git"
endif

function! GitStatus()
  " Get git status output
  let gs_output = system("git status | grep -e modified -e \"new file\"")
  let lines = split(gs_output, '\v\n')
  let filepaths = []
  for line in lines
    let splitted_line = split(line, ':')
    let status = trim(splitted_line[0])
    let fname = trim(splitted_line[1])
    call add(filepaths, {'filename': fname, 'text': status})
  endfor

  "Insert the output and open at the bottom
  call setqflist(filepaths)
  botright copen 10

endfunction

command! -bar GitStatus call GitStatus()
