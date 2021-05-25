" ============================================================================
" Global variables
" ============================================================================
" Disable default plugin
let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:did_install_syntax_menu   = 1
let g:loaded_2html_plugin       = 1

" map leader
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

" indent for Line continuation.(\)
let g:vim_indent_cont = 0

" markdown syntax
let g:markdown_fenced_languages = [
\  'go',
\  'sh',
\  'json',
\  'yaml',
\  'lua',
\  'vim',
\]

" use lua syntax in .vim file
let g:vimsyn_embed = 'l'

" ============================================================================
" Global options
" ============================================================================
" encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,cp932
set fileformats=unix,dos,mac

" Appearance
set display=lastline
set laststatus=2
set nocursorcolumn
set nocursorline
set nowrap
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set scrolloff=8
set synmaxcol=256
set showcmd
set signcolumn=yes
set noshowmode
set showtabline=2
set background=dark
set termguicolors
set diffopt^=vertical
set shortmess+=c
set shortmess-=S
set helplang=ja,en

" edit
set smarttab
set expandtab
set autoindent
set shiftwidth=2
set shiftround
set tabstop=2
set virtualedit=block,onemore
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start

" buffer
set hidden
set switchbuf=useopen

" window
set splitbelow
set splitright
set winwidth=30
set winheight=1
set cmdwinheight=5
set noequalalways

" search
set ignorecase
set smartcase
set incsearch
set hlsearch

" performance
set updatetime=300
set ttimeoutlen=10
set lazyredraw

" Completion
set completeopt=menuone,noinsert,noselect
set pumheight=10

" cmdline
set wildmenu 
set wildmode=full
set wildchar=<Tab>

" data files
set nobackup
set noswapfile
set undofile

" clipborad
if has('clipboard')
  set clipboard=unnamedplus
endif

" grep
if executable('rg')
  let &grepprg = 'rg --vimgrep --hidden'
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

if has('nvim')
  set inccommand=split
  set pumblend=10
endif

" ============================================================================
" Mapping
" ============================================================================
" reload vimrc
nnoremap <Leader>s <cmd>source $MYVIMRC<CR>

" Clear search highlight
nnoremap <Esc><Esc> <cmd>nohlsearch<CR><Esc>
nnoremap <C-l>      <cmd>nohlsearch<CR><C-l>

" Multi line move
noremap k gk
noremap j gj
noremap gk k
noremap gj j

" Move cursor like emacs in Insert Mode
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <C-o>^
inoremap <C-e> <End>
inoremap <C-d> <Del>
imap     <C-h> <BS>

" Move cursor like emacs in Cmdline-mode
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>

" forward match from cmdline history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Move cursor the begining and end of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Move between windows
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" resize window
nnoremap <Left>  5<C-w><
nnoremap <Right> 5<C-w>>
nnoremap <Up>    2<C-w>-
nnoremap <Down>  2<C-w>+

" Quit the current window
nnoremap <C-q> <cmd>q<CR>
inoremap <C-q> <cmd>q<CR><Esc>
tnoremap <C-q> <cmd>q!<CR>

" Not yank is delete operation
nnoremap x "_x
xnoremap x "_x
nnoremap X "_X
xnoremap X "_X

" Yank EOF
nnoremap Y y$

" Does not move when using *
nnoremap * *N

" Indent in visual and select mode automatically re-selects.
vnoremap > >gv
vnoremap < <gv

" Disable dangerous key
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>

" Toggle options
nmap [Toggle] <Nop>
map <Leader>o [Toggle]
nnoremap [Toggle]n  <cmd>setlocal number! number?<CR>
nnoremap [Toggle]rn <cmd>setlocal relativenumber! relativenumber?<CR>
nnoremap [Toggle]c  <cmd>setlocal cursorline! cursorcolumn!<CR>
nnoremap [Toggle]w  <cmd>setlocal wrap! wrap?<CR>
nnoremap [Toggle]p  <cmd>set paste! paste?<CR>

" terminal
nnoremap <Leader>ts <cmd>split  term://$SHELL<CR>
nnoremap <Leader>tv <cmd>vsplit term://$SHELL<CR>
nnoremap <Leader>tt <cmd>tabnew term://$SHELL<CR>
nnoremap <Leader>tw <cmd>terminal<CR>
tnoremap <silent> <Esc> <C-\><C-n>
function s:ToggleTerminal()
  let l:bufferNum = bufnr('ToggleTerminal')
  if l:bufferNum == -1 || bufloaded(l:bufferNum) != 1
    silent! split term://$SHELL
    file ToggleTerminal
  else
    let l:windowNum = bufwinnr(l:bufferNum)
    if l:windowNum == -1
      silent! execute 'bel sbuffer '.l:bufferNum
      startinsert
    else
      silent! execute l:windowNum.'wincmd w'
      hide
    endif
  endif
endfunction
nnoremap <C-t> <cmd>call <SID>ToggleTerminal()<CR>
tnoremap <C-t> <cmd>call <SID>ToggleTerminal()<CR>

" quickfix/loclist
nnoremap [q <cmd>cprev<CR>
nnoremap ]q <cmd>cnext<CR>
nnoremap [l <cmd>lprevious<CR>
nnoremap ]l <cmd>lnext<CR>
function s:toggleqf() abort
  let l:qid = getqflist({'winid' : 1}).winid
  let l:lid = getloclist(0, {'winid' : 1}).winid
  if l:qid == 0 && l:lid == 0
    silent cwindow
    if &ft != 'qf'
      try
        silent lwindow
      catch /E776/
      endtry
    endif
  elseif l:qid != 0 && l:lid == 0
    silent cclose
    try
      silent lwindow
    catch /E776/
    endtry
  elseif l:qid == 0 && l:lid != 0
    silent lclose
  else
    cclose
    lclose
  endif
endfunction
nnoremap <silent> <script> Q <cmd>call <SID>toggleqf()<CR>

" ============================================================================
" Command
" ============================================================================
" Caputre result for Ex-Command.
command! -nargs=1 -complete=command Capture
\ <mods> new |
\ setlocal buftype=nofile bufhidden=hide noswapfile |
\ call setline(1, split(execute(<q-args>), '\n'))

" Count for char in current buffer.
command! -nargs=0 Wc %s/.//nge
" ============================================================================
" autocmd
" ============================================================================
" open help in vertical window.
function! s:qfenter(cmd)
  let l:lnum = line('.')
  if get(get(getwininfo(win_getid()), 0, {}), 'loclist', 0)
    let l:cmd = 'll'
    let l:ccmd = 'lclose'
  else
    let l:cmd = 'cc'
    let l:ccmd = 'cclose'
  endif
  silent! execute a:cmd
  silent! execute l:cmd l:lnum
  silent! execute l:ccmd
endfunction
function s:cfilter() abort
  let l:query = input('Cfilter: ', '')
  if empty(l:query) | redraw | return | endif
  execute 'Cfilter' l:query
endfunction
augroup vimrc_filetype
  autocmd!
  autocmd FileType gitcommit setlocal spell spelllang=cjk,en
  autocmd FileType git setlocal nofoldenable
  autocmd FileType text setlocal textwidth=0
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType qf setlocal signcolumn=no
  autocmd Filetype qf ++once packadd cfilter
  autocmd Filetype qf nnoremap <silent> <buffer> p <CR>zz<C-w>p
  autocmd Filetype qf nnoremap <silent> <buffer> q <C-w>c
  autocmd Filetype qf nnoremap <buffer> <LocalLeader>f <cmd>call <SID>cfilter()<CR>
  autocmd Filetype qf nnoremap <buffer> <C-m> <cmd>call <SID>qfenter('wincmd p')<CR>
  autocmd Filetype qf nnoremap <buffer> <C-t> <cmd>call <SID>qfenter('tabnew')<CR>
  autocmd Filetype qf nnoremap <buffer> <C-x> <cmd>call <SID>qfenter('wincmd p <bar> new')<CR>
  autocmd Filetype qf nnoremap <buffer> <C-v> <cmd>call <SID>qfenter('wincmd p <bar> vnew')<CR>
  autocmd BufEnter *.txt,*.jax if &buftype == 'help' | wincmd L | endif
  autocmd FileType help setlocal signcolumn=no
  autocmd FileType help nnoremap <silent> <buffer> q <C-w>c
  autocmd FileType help nnoremap <buffer> <CR> <C-]>
  autocmd FileType help nnoremap <buffer> <BS> <C-T>
  autocmd TermOpen * setlocal signcolumn=no nolist
  autocmd TermOpen * startinsert
  autocmd TextYankPost * silent! lua return (not vim.v.event.visual) and require'vim.highlight'.on_yank()
augroup END

" ============================================================================
" abbrev
" ============================================================================
" Shortening for ++enc=
cnoreabbrev ++u ++enc=utf8
cnoreabbrev ++c ++enc=cp932
cnoreabbrev ++s ++enc=sjis

" ============================================================================
" Plugin
" ============================================================================
" vim-plug
if !filereadable(stdpath('data') .. '/site/autoload/plug.vim')
  echom 'download plug.vim!'
  new
  execute 'terminal curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
  \ --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  finish
endif

call plug#begin(stdpath('data') .. '/plugins')
" Enhanced
Plug 'ChristianChiarulli/nvcode-color-schemes.vim'
Plug 'hoob3rt/lualine.nvim'
Plug 'hrsh7th/vim-eft'
Plug 'tyru/columnskip.vim'
Plug 'tyru/caw.vim', { 'on': '<Plug>(caw:hatpos:toggle)' }
Plug 'machakann/vim-sandwich'
Plug 'machakann/vim-swap'
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'
Plug 'lambdalisue/pastefix.vim'
" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Extension
Plug 'glidenote/memolist.vim', { 'on': [ 'MemoNew', 'MemoList', 'MemoGrep' ] }
Plug 'lambdalisue/gina.vim', { 'on': 'Gina' }
Plug 't9md/vim-quickhl', { 'on': '<Plug>(quickhl-manual-this)' }
Plug 'tweekmonster/startuptime.vim', { 'on': 'StartupTime' }
" FileType
Plug 'kevinoid/vim-jsonc', { 'for': 'jsonc' }
Plug 'mattn/vim-gomod', { 'for': 'gomod' }
Plug 'kyoh86/vim-go-coverage', { 'for': 'go' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'godlygeek/tabular', { 'for': 'markdown' }
Plug 'mattn/vim-maketable', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim',
\ { 'do': { -> mkdp#util#install() },'for': ['markdown', 'vim-plug']}
call plug#end()

" ============================================================================
" Plugin config
" ============================================================================
" enhanced -------------------------------------------------------------------
" nvcode
function s:nvcode_mod() abort
  highlight! link DiffAdd GitSignsAdd
  highlight! link DiffChange GitSignsChange
  highlight! link DiffDelete GitSignsDelete
  highlight! link CocHighlightText Underlined
  let g:terminal_color_0 = '#5C6370'
  let g:terminal_color_1 = '#E06C75'
  let g:terminal_color_2 = '#98C379'
  let g:terminal_color_3 = '#E5C07B'
  let g:terminal_color_4 = '#61AFEF'
  let g:terminal_color_5 = '#C678DD'
  let g:terminal_color_6 = '#56B6C2'
  let g:terminal_color_7 = '#ABB2BF'
  let g:terminal_color_8 = '#4B5263'
  let g:terminal_color_9 = '#BE5046'
  let g:terminal_color_10 = '#98C379'
  let g:terminal_color_11 = '#D19A66'
  let g:terminal_color_12 = '#61AFEF'
  let g:terminal_color_13 = '#C678DD'
  let g:terminal_color_14 = '#56B6C2'
  let g:terminal_color_15 = '#3E4452'
endfunction
augroup vimrc_colorscheme
  autocmd!
  autocmd ColorScheme nvcode call s:nvcode_mod()
augroup END
colorscheme nvcode

" lualine.nvim
lua << EOF
require'lualine'.setup {
  options = {
    icons_enabled = false,
    theme = 'codedark',
    component_separators = '',
    section_separators = '',
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = { {'branch', icon = '', icons_enabled = true} },
    lualine_c = {
      {'filename'},
      {'diff'},
      {'diagnostics', 
        sources = {'coc'},
        color_error = '#bf616a',
        color_warn = '#ebcb8b',
        color_info = '#88c0d0',
        symbols = {error = '×:', warn = '⚠:', info = 'Ⓘ:'}
      },
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
EOF

" vim-eft
nmap ; <Plug>(eft-repeat)
xmap ; <Plug>(eft-repeat)
nmap f <Plug>(eft-f)
xmap f <Plug>(eft-f)
omap f <Plug>(eft-f)
nmap F <Plug>(eft-F)
xmap F <Plug>(eft-F)
omap F <Plug>(eft-F)
nmap t <Plug>(eft-t)
xmap t <Plug>(eft-t)
omap t <Plug>(eft-t)
nmap T <Plug>(eft-T)
xmap T <Plug>(eft-T)
omap T <Plug>(eft-T)

" columnskip.vim
nmap sj <Plug>(columnskip:nonblank:next)
omap sj <Plug>(columnskip:nonblank:next)
xmap sj <Plug>(columnskip:nonblank:next)
nmap sk <Plug>(columnskip:nonblank:prev)
omap sk <Plug>(columnskip:nonblank:prev)
xmap sk <Plug>(columnskip:nonblank:prev)

" caw.vim
let g:caw_no_default_keymappings = 1
nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

" vim-swap
omap i, <Plug>(swap-textobject-i)
xmap i, <Plug>(swap-textobject-i)
omap a, <Plug>(swap-textobject-a)
xmap a, <Plug>(swap-textobject-a)

" vim-operator-replace
map R <Plug>(operator-replace)

" Coc.nvim -------------------------------------------------------------------
let g:coc_data_home = stdpath('data') .. '/coc/'
let g:coc_global_extensions = [
\ 'coc-diagnostic',
\ 'coc-git',
\ 'coc-go',
\ 'coc-json',
\ 'coc-lists',
\ 'coc-markdownlint',
\ 'coc-pairs',
\ 'coc-sh',
\ 'coc-snippets',
\ 'coc-translator',
\ 'coc-vimlsp',
\ 'coc-yaml',
\ ]

nmap <silent> gd              <Plug>(coc-definition)
nmap <silent> gy              <Plug>(coc-type-definition)
nmap <silent> gi              <Plug>(coc-implementation)
nmap <silent> gr              <Plug>(coc-references-used)
nmap <silent> <F2>            <Plug>(coc-rename)
nmap <silent> <LocalLeader>ca <Plug>(coc-codeaction)
nmap <silent> <LocalLeader>cl <Plug>(coc-codelens-action)
nmap <silent> <LocalLeader>m  <Plug>(coc-format)
nmap <silent> <LocalLeader>x  <Plug>(coc-refactor)
nmap <silent> [d              <Plug>(coc-diagnostic-prev)
nmap <silent> ]d              <Plug>(coc-diagnostic-next)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

augroup vimrc_coc
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END

nnoremap <Leader>L      <cmd>CocList<CR>
nnoremap <LocalLeader>d <cmd>CocList diagnostics<CR>
nnoremap <LocalLeader>s <cmd>CocList outline<CR>
nnoremap <LocalLeader>w <cmd>CocList symbols<CR>

inoremap <silent><expr> <C-x><C-o> coc#refresh()

" coc-lists
nnoremap <Leader>f <cmd>CocList files<CR>
nnoremap <Leader>b <cmd>CocList --normal buffers<CR>
nnoremap <Leader>l <cmd>CocList lines<CR>
function s:grep() abort
  let l:query = input('Grep: ', '')
  if empty(l:query) | redraw | return | endif
  execute 'CocList -N --normal grep ' l:query
endfunction
nnoremap <Leader>a <cmd>call <SID>grep()<CR>

" coc-pairs
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
\ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" coc-snippet
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-Tab>'
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-y>" :
\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()

" coc-git
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)
nmap gc <Plug>(coc-git-commit)
nnoremap <Leader>gu <cmd>CocCommand git.chunkUndo<CR>

" coc-translator
vmap <silent> T <Plug>(coc-translator-pv)

" coc-go
augroup vimrc_coc_go
  autocmd!
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
  autocmd FileType go nnoremap <buffer> <LocalLeader>a <cmd>CocCommand go.test.toggle<CR>
  autocmd FileType go nnoremap <buffer> <LocalLeader>tj <cmd>CocCommand go.tags.add json<cr>
  autocmd FileType go nnoremap <buffer> <LocalLeader>ty <cmd>CocCommand go.tags.add yaml<cr>
  autocmd FileType go nnoremap <buffer> <LocalLeader>tx <cmd>CocCommand go.tags.clear<cr>
augroup END

" Extention ------------------------------------------------------------------
" memolist.vim
let g:memolist_memo_suffix = 'md'
let g:memolist_template_dir_path = stdpath('config') .. '/etc/memotemplates'
let g:memolist_ex_cmd = 'CocList files'
nnoremap <Leader>mn <cmd>MemoNew<CR>
nnoremap <Leader>mg <cmd>MemoGrep<CR>
nnoremap <Leader>ml <cmd>MemoList<CR>

" gina.vim
function s:gina_settings() abort
  let l:gina_cmd_opt = {'noremap': 1, 'silent': 1}
  call gina#custom#command#option('status','-s')
  call gina#custom#command#option('status','--opener', 'tabedit')
  call gina#custom#command#option('log','--opener', 'tabedit')
  call gina#custom#command#option('commit', '-v')
  call gina#custom#command#option('show','--show-signature')
  call gina#custom#command#option('branch','--opener', 'split')

  call gina#custom#mapping#nmap(
  \ '/.*', 'q', '<cmd>bd<CR>', l:gina_cmd_opt
  \ )
  call gina#custom#mapping#nmap(
  \ 'status',
  \ '<C-c>',
  \ '<cmd>Gina commit<CR>',
  \ l:gina_cmd_opt)
  call gina#custom#mapping#nmap(
  \ 'commit', 
  \ '<C-c>', 
  \ '<cmd>Gina status --opener=edit<CR>',
  \ l:gina_cmd_opt)
  call gina#custom#mapping#nmap(
  \ 'status',
  \ 'p',
  \ '<cmd>call gina#action#call(''diff:vsplit'')<CR>',
  \ l:gina_cmd_opt,
  \ )
  call gina#custom#mapping#nmap(
  \ '/\%(blame\|log\|reflog\)',
  \ 'p',
  \ '<cmd>call gina#action#call(''show:commit:vsplit'')<CR>',
  \ l:gina_cmd_opt,
  \ )
  call gina#custom#mapping#nmap(
  \ 'branch',
  \ 'D',
  \ '<cmd>call gina#action#call(''branch:delete'')<CR>',
  \ l:gina_cmd_opt
  \  )

  call gina#custom#execute(
  \ '/\%(ls\|log\|reflog\|grep\)',
  \ 'setlocal noautoread',
  \ )
  call gina#custom#execute(
  \ '/\%(status\|branch\|ls\|log\|reflog\|grep\)',
  \ 'setlocal cursorline',
  \ )
endfunction

augroup vimrc_gina
  autocmd!
  autocmd User gina.vim ++once call s:gina_settings()
augroup END

nnoremap <Leader>gs <cmd>Gina status<CR>
nnoremap <Leader>gl <cmd>Gina log --graph<CR>
nnoremap <Leader>gd <cmd>Gina compare<CR>
nnoremap <Leader>gb <cmd>Gina branch -av<CR>

" vim-quickhl
nmap mm <Plug>(quickhl-manual-this)
xmap mm <Plug>(quickhl-manual-this)
nmap mM <Plug>(quickhl-manual-reset)
xmap mM <Plug>(quickhl-manual-reset)

" FileType -------------------------------------------------------------------
" vim-markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_emphasis_multiline = 0
augroup vimrc_markdown
  au!
  autocmd FileType markdown nnoremap <buffer> <LocalLeader>o <cmd>Toch<CR>
  autocmd FileType markdown nnoremap <buffer> <LocalLeader>f <cmd>TableFormat<CR>
augroup END

" vim-maketable
augroup vimrc_maketable
  au!
  autocmd FileType markdown vnoremap <silent> <buffer> mt :MakeTable!<CR>
  autocmd FileType markdown nnoremap <buffer>          mt <cmd>UnmakeTable!<CR>
augroup END

" markdown-preview.nvim
augroup vimrc_markdown_preview
  au!
  autocmd FileType markdown nnoremap <buffer> <LocalLeader>p <cmd>MarkdownPreview<CR>
augroup END
