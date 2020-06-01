"
"  ████     ██                           ██
" ░██░██   ░██                          ░░
" ░██░░██  ░██  █████   ██████  ██    ██ ██ ██████████
" ░██ ░░██ ░██ ██░░░██ ██░░░░██░██   ░██░██░░██░░██░░██
" ░██  ░░██░██░███████░██   ░██░░██ ░██ ░██ ░██ ░██ ░██
" ░██   ░░████░██░░░░ ░██   ░██ ░░████  ░██ ░██ ░██ ░██
" ░██    ░░███░░██████░░██████   ░░██   ░██ ███ ░██ ░██
" ░░      ░░░  ░░░░░░  ░░░░░░     ░░    ░░ ░░░  ░░  ░░
"

" general {{{
" basic {{{
" leader key
let mapleader = ' '

" cache
set nobackup
set noswapfile
set undodir=~/.config/nvim/cache/undo
set undofile

" coffee pasta
set clipboard=unnamedplus

" plebs mode
set mouse=a

set updatetime=100

" encoding
scriptencoding utf-8
" }}}

" looks {{{
"
" o┏━┓┳━┓┳━┓┳━┓┳━┓┏━┓
" ┃┃  ┣━ ┃━┃┣━ ┃┳┛┃ ┳
" ┇┗━┛┻━┛┇━┛┻━┛┇┗┛┇━┛

" syntax highlighting
color iceberg
syntax on
set synmaxcol=512

" statusline
set laststatus=2
set noruler
set noshowcmd
set noshowmode
source $HOME/.config/nvim/colors/statusline.vim

" show matching brackets/parenthesis
set showmatch
set matchtime=3

" disable startup message
set shortmess+=I

" autocompletion menu
set pumheight=10

" show line numbers
set number relativenumber
set numberwidth=1

" line wrapping
set wrap

" highlight current line
set cursorline
"set cursorcolumn

" minimal number to keep above/below the cursor
set scrolloff=5

" show invisibles
set list
set listchars=
set listchars+=tab:·\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░

" vim diff highlighting
if &diff
	hi DiffAdd      ctermbg=NONE   ctermfg=2      cterm=NONE
	hi DiffChange   ctermbg=NONE   ctermfg=3      cterm=NONE
	hi DiffDelete   ctermbg=NONE   ctermfg=1      cterm=NONE
	hi DiffText     ctermbg=NONE   ctermfg=7      cterm=NONE
endif

" line highlighting if it is longer than 80 characters
hi OverLength             ctermbg=none   ctermfg=1      cterm=underline
"match OverLength /\%81v.\+/

" folding {{{
"set nofoldenable
"set foldlevel=99
"set foldminlines=99
"set foldlevelstart=99
" }}}
" }}}

" indentation {{{
filetype plugin indent on
set autoindent
set noexpandtab
set shiftround
set shiftwidth=4
set tabstop=4

augroup langindentation
	autocmd Filetype c,cpp      setlocal tabstop=2 shiftwidth=2 softtabstop=2 noexpandtab
	autocmd Filetype css        setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	autocmd Filetype html       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	autocmd Filetype json       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	autocmd Filetype php        setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	autocmd Filetype scss       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	autocmd Filetype yaml       setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
augroup END
" }}}

" searching {{{
set hlsearch
set ignorecase
set inccommand=nosplit
set incsearch
set infercase
set smartcase

" disable hlsearch
nnoremap <silent><C-s> :noh<cr>:echo<cr>
" }}}

" buffers {{{
set hidden

" tabs
nnoremap <C-o> :tabnew<cr>
nnoremap <C-c> :tabclose<cr>

" tab management
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
nnoremap <M-0> 10gt

" split
set splitright
set splitbelow

" split style
set fillchars=vert:▒

" split management
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" }}}

" wildmenu {{{
" find
set path+=**

" lazy file name tab completion
set wildmenu
set wildignorecase
set wildmode=longest:full,full

" ignore files vim doesnt use
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*
" }}}

" netrw {{{
" this hides the netrw banner
let g:netrw_banner = 0

" netrw listing style
let g:netrw_liststyle = 4

" how to open new files
let g:netrw_browse_split = 0

" this makes the netrw window size only a quarter of the screen's width
let g:netrw_winsize = 25

" open netrw
nnoremap <silent><leader>E :E<cr>

" close buffer
nnoremap <silent><leader>d :bw<cr>

" ignore files that vim doesn't use
let g:netrw_list_hide= '.*\.swp$,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\=/\=$'
" }}}
" }}}

" mapping {{{
" switch to normal mode
inoremap jk <esc>

" when line overflows, it will go
" one _visual_ line and not actual
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" spell-check (English US and Polish)
noremap <F6> :setlocal spell! spelllang=en_us<cr>
noremap <F7> :setlocal spell! spelllang=pl<cr>

" enable and disable auto comment
nnoremap <leader>c :setlocal formatoptions-=cro<cr>
nnoremap <leader>C :setlocal formatoptions+=cro<cr>

" enable and disable auto indent
nnoremap <leader>i :setlocal autoindent<cr>
nnoremap <leader>I :setlocal noautoindent<cr>

" replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" check file in shellcheck:
noremap <leader>s :sp \| terminal shellcheck %<cr>:resize 15<cr>

" deletes all trailing whitespace
noremap <leader>fw :%s/\s\+$//e<cr>

" exit/open terminal
noremap <C-A-t> :split term://zsh<cr>:resize 15<cr>
"tnoremap <Esc> <C-\><C-n>
tnoremap <C-e> <C-\><C-n>

" execute file
nnoremap <leader>x :!chmod +x %<cr>
nnoremap <leader>e :!./%<cr>

" abbreviations
iab @@ Cherrry9@disroot.org

augroup BufferWrite
	au!
	" automatically deletes all trailing whitespace on save.
	"autocmd BufWritePre * %s/\s\+$//e
	" when shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
	" run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xdefaults !xrdb %
	" update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
	" reload vim when configuration is updated
	autocmd BufWritePost init.vim,iceberg.vim source $MYVIMRC
augroup end
" }}}

" plugins {{{
" setup {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	echo 'Downloading junegunn/vim-plug to manage plugins...'
	silent call system('mkdir -p ~/.config/nvim/{autoload,bundle,cache/{cache,undo,backups,swaps}}')
	silent call system('pip3 install --user pynvim msgpack')
	silent call system('curl -flo ~/.config/nvim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
	execute 'source  ~/.config/nvim/autoload/plug.vim'
	augroup plugsetup
		au!
		autocmd VimEnter * PlugInstall
	augroup end
endif
" }}}

" load {{{
call plug#begin('~/.config/nvim/bundle')

" syntax hl {{{
Plug 'sheerun/vim-polyglot'
" }}}

" autocompletion && linting {{{
" Conquer Of Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}

" snippets {{{
" snippets engine
Plug 'SirVer/ultisnips'
" default snippets
Plug 'honza/vim-snippets'
" coc integration with ultisnips
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
" }}}

" git integration {{{
" it should be illegal
Plug 'tpope/vim-fugitive'
" shows diff markers
Plug 'airblade/vim-gitgutter'
" commit browser
Plug 'junegunn/gv.vim'
" }}}

" features {{{
" show colors preview
Plug 'lilydjwg/colorizer'

" extend %
Plug 'isa/vim-matchit'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" fuzzy searching
Plug 'kien/ctrlp.vim'

" move lines
Plug 'matze/vim-move'

" split management between vim and tmux
Plug 'christoomey/vim-tmux-navigator'

" notes
Plug 'vimwiki/vimwiki'

" vanilla vim is to easy
Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 1
"" }}}

call plug#end()
" }}}

" coc {{{
" run code actions
vmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction)

" coc list
nmap <silent><leader>cl  :CocList<cr>

" autocompletion {{{
" completion with tab or shift-tab
inoremap <expr><silent><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><silent><S-tab> pumvisible() ? "\<c-p>" : "\<tab>"

" refresh
inoremap <silent><expr> <c-space> coc#refresh()

" trigger snippets
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" real tab
inoremap <A-tab> <tab>

" real enter
inoremap <M-cr> <cr>
" }}}

" linting {{{
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format)

" apply AutoFix to problem on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" list errors and warnings
nmap <silent><leader>cd  :CocList diagnostics<cr>

" add `:Format` command to format current buffer
command! -nargs=0 Format :call CocAction('format')

" add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" }}}

" definition {{{
" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" rn - symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" highlight symbol under cursor 
autocmd CursorHold * silent call CocActionAsync('highlight')

" <leader>K - get hint on whatever's under the cursor
nnoremap <silent><leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

"snippets {{{
" trigger snippet expand
imap <C-j> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger="<c-j>"

" select text for visual placeholder of snippet
vmap <C-j> <Plug>(coc-snippets-select)

" expand and jump (make expand higher priority)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" jump to next placeholder
let g:coc_snippet_next = '<c-j>'
let g:UltiSnipsJumpForwardTrigger="<c-j>"

" jump to previous placeholder
let g:coc_snippet_prev = '<c-k>'
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" mulltiple cursor {{{
nmap <silent> <C-c> <Plug>(coc-cursors-position)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)
" }}}
" }}}

" git {{{
let g:gitgutter_max_signs = 1500
let g:gitgutter_diff_args = '-w'

" custom symbols
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = ':'

" maping
nnoremap <silent>ghp :GitGutterPreviewHunk<cr>
nnoremap <silent>ghs :GitGutterStageHunk<cr>
nnoremap <silent>ghu :GitGutterUndoHunk<cr>
nnoremap <silent>[h  :GitGutterPrevHunk<cr>
nnoremap <silent>]h  :GitGutterNextHunk<cr>
" }}}

" fuzzy searching {{{
" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_map = '<c-p>'
nnoremap <Tab> :CtrlPBuffer<cr>
" }}}

" vimwiki {{{
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/dox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
augroup vimwiki
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex
augroup end
" }}}
" }}}

" feature {{{
" restore cursor position {{{
function! ResCur()
	if line("'\"") <= line('$')
		normal! g`"
		return 1
	endif
endfunction

if has("folding")
  function! UnfoldCur()
    if !&foldenable
      return
    endif
    let cl = line(".")
    if cl <= 1
      return
    endif
    let cf  = foldlevel(cl)
    let uf  = foldlevel(cl - 1)
    let min = (cf > uf ? uf : cf)
    if min
      execute "normal!" min . "zo"
      return 1
    endif
  endfunction
endif

augroup resCur
  autocmd!
  if has("folding")
    autocmd BufWinEnter * if ResCur() | call UnfoldCur() | endif
  else
    autocmd BufWinEnter * call ResCur()
  endif
augroup END
" }}}

" zoom {{{
map <leader>z :call Zoom()<cr>
function! Zoom() abort
	if winnr('$') > 1
		if exists('t:zoomed') && t:zoomed
		execute t:zoom_winrestcmd
		let t:zoomed = 0
	else
		let t:zoom_winrestcmd = winrestcmd()
		resize
		vertical resize
		let t:zoomed = 1
		endif
	else
		execute 'silent !tmux resize-pane -Z'
	endif
endfunction
" }}}

" toggle statusbar {{{
nnoremap <silent><S-T> :call ToggleHiddenAll()<cr>
let s:hidden_all = 0
function! ToggleHiddenAll()
	if s:hidden_all  == 0
		let s:hidden_all = 1
		set laststatus=1
		set noruler
		set noshowcmd
		set showmode
	else
		let s:hidden_all = 0
		set laststatus=2
		set noruler
		set noshowcmd
		set noshowmode
	endif
endfunction
" }}}

" show syntax highlighting groups {{{
nmap <silent><F10> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists('*synstack')
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}
" }}}

" vim: fdm=marker
