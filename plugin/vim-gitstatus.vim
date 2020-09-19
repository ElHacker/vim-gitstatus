" vim-gitstatus.vim
" Author:       Braulio Chavez <mailto:braulio@chamvr.com>
" Version:      0.0.0

if !exists("g:git command")
  let g:git_command = "git"
endif

function! GitStatus()
  " Get git status output
  let gs_output = system("git status --porcelain | grep -e '^ M' -e '^\??'")
  let lines = split(gs_output, '\v\n')
  let filepaths = []
  for line in lines
    let trimmed_line = trim(line)
    let splitted_line = split(line, ' ')
    let status_symbol = trim(splitted_line[0])
    if status_symbol == "M"
      let status = "modified"
    elseif status_symbol == "??"
      let status = "new file"
    else
      continue
    endif
    let fname = trim(splitted_line[1])
    call add(filepaths, {'filename': fname, 'text': status})
  endfor

  "Insert the output and open at the bottom
  call setqflist(filepaths)
  botright copen 10

endfunction

command! -bar GitStatus call GitStatus()
