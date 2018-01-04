runtime! autoload/pathogen.vim

if exists('g:loaded_pathogen')
  call pathogen#infect()
end

if has("gui_running")
    set guioptions=egmrt
    set showtabline=2
endif

""" fix for some stupid terms
if &term == "screen"
	let term = "xterm"
endif

set nocompatible

" set listchars=tab:▹\ ,eol:¬
" set list
""" syntax colors
syntax on
filetype on
filetype indent on
filetype plugin on
compiler ruby

if has("autocmd")
	" File type detection
	filetype on
	filetype plugin indent on

	"default settings"
	set ts=2 sts=2 sw=2 expandtab

	" Styles depending on file type
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType c,cpp setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType html,php setlocal ts=4 sts=4 sw=4 expandtab
	autocmd FileType xml setlocal ts=2 sts=2 sw=2 expandtab

	" Treat different file types as one we know:
	autocmd BufNewFile,BufRead *.rss,*.atom setfiletype xml
	autocmd BufNewFile,BufRead Thorfile,Rakefile setfiletype ruby
endif

set smarttab
set expandtab
set autoindent
set noeol
set binary

""" ignore list
set wildignore+=*.o,*.obj,*.class,.git,bin,target

""" autocomplete config
set wildmode=list:longest,full

""" show mode in use (insert, visual, ...)
set showmode
set showcmd

""" mouse behavior like in terminal (without X)
set mouse=c

""" no wrap lines (duh!)
set nowrap

""" indent control
set autoindent
set smartindent

""" show match parentesis
set showmatch

""" statusline config
""" %y = file type
""" %f = file path
""" %t = file name
""" %l = current line
""" %c = current column
""" %V = current virtual column
""" %P = position into file
set laststatus=2
set statusline=%y\ %f\ %=\ %(%-l,%-c%-V\ %-P%)

""" show reduced msgs
set shm=filmnrwxt

set linebreak

colorscheme desert
set background=dark

""" cursor line
"""set cursorline

""" highlight search
set hlsearch

""" folding settings
set nofoldenable
augroup vimrc
	au BufReadPre * setlocal foldmethod=indent
	au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

""" remapping leader to comma key
let mapleader = ","

""" reload .vimrc
nmap <leader>v :source $MYVIMRC<CR>
nmap <leader>V :tabnew $MYVIMRC<CR>

nmap <leader>f :set foldmethod=indent<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>w :set wrap<CR>
nmap <leader>W :set nowrap<CR>


let g:tex_flavor='latex'

""" some sanite mappings
cab WQ wq | cab Wq wq | cab W w | cab Q q

" Indent XML readably
function! DoPrettyXML()
	1,$!xmllint --format --recover -
endfunction
command! PrettyXML call DoPrettyXML()
match Todo /\s\+$/

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" New vim file
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"
let g:html_indent_inctags = "body,html,head,p,tbody,header"
