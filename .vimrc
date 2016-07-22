" disable compatibility with vi?
set nocompatible
" filetype off

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()

" Plugin 'wting/rust.vim'

" all of your plugins must be added before the following line
" call vundle#end() " required
filetype plugin indent on " required

" enable using project-specific .vimrc files"
set exrc

" restrict usage of some commands in non-default .vimrc
" files for security reasons
set secure

" enable folding for all languages that have a syntax
" set foldmethod=syntax

" highlight characters beyond 80 columns.  Check for existence
" of colorcolumn property as it is not supported in earlier
" vim versions
if exists('+colorcolumn')
  set colorcolumn=80
  highlight ColorColumn ctermbg=darkgray
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" insert space characters whenever the tab key is pressed,
" instead of inserting a tab.  Use Ctrl-V and then <Tab> 
" in order to enter an actual tab.
set expandtab

" for help with indenting in java, etc.
set autoindent

" create closing parens
set si

" show line numbers
set number

" don't wrap
set nowrap

" set showmode
set showmode

" set the text width for automatic word wrapping
set tw=80

set smartcase
set smarttab
set smartindent
set softtabstop=4
" set incsearch
" set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect
set completeopt=menuone,menu,longest
set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set t_Co=256
set cmdheight=1

" execute pathogen#infect()

"Java anonymous classes. Sometimes, you have to use them.
set cinoptions+=j1

let java_comment_strings=1
let java_highlight_java_lang_ids=1
let java_mark_braces_in_parens_as_errors=1
let java_highlight_all=1
let java_highlight_debug=1
let java_ignore_javadoc=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 150

" insert 4 spaces for a tab
set tabstop=4

" change the number of spaces used for indentation
set shiftwidth=4


" enable loading the plugin files for specific file types
" filetype plugin on

" turn on color syntax highlighting
syntax on

" set a colorscheme
" colorscheme wombat256

" instead of using syntastic, use ghcmod-vim to run ghc-mod syntax checking,
" linting.  This is because ghc-mod versions 5.4.0 and later are
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" to hook into GHC's code completion capabilities we map several keyboard
" commands to ghc-mod functions:
" map <silent> tw :GhcModTypeInsert<CR>
" map <silent> ts :GhcModSplitFunCase<CR>
" map <silent> tq :GhcModType<CR>
" map <silent> te :GhcModTypeClear<CR>

" enable familiar tab completion by configuring supertab to dispatch to
" neco-ghc's tab completion routines instead of the usual local variable
" completion.
" let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" if has("gui_running")
"   imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
" else " no gui
"   if has("unix")
"     inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
"   endif
" endif

" configure necoghc to be the default tab completion method:
" let g:haskellmode_completion_ghc = 1
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" configure nerdtree to toggle with \n (where \ is the default leader):
map <Leader>n :NERDTreeToggle<CR>

" use tabularize to map specific keys to some common Haskell patterns for
" aligning code:
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" use the ctrl-p fuzzy file search plugin to allow quick browing of a project
" based on a fuzzy text search of the filename or its contents.  Bind the panel
" launch to \t:
map <silent> <Leader>t :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'

