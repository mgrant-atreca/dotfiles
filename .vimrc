" insert space characters whenever the tab key is pressed,
" instead of inserting a tab.  Use Ctrl-V and then <Tab> 
" in order to enter an actual tab.
set expandtab

" insert 4 spaces for a tab
set tabstop=4

" change the number of spaces used for indentation
set shiftwidth=4


" load pathogen plugins from the ~/.vim/bundle folder
execute pathogen#infect()


" enable loading the plugin files for specific file types
filetype plugin on

" turn on color syntax highlighting
syntax on


" needed to fix an issue where hdevtools doesn't look in the .cabal-sandbox
" folder for installed packages
function! FindCabalSandboxRoot()
   return finddir('.cabal-sandbox', './;')
endfunction
function! FindCabalSandboxRootPackageConf()
    return glob(FindCabalSandboxRoot().'/*-packages.conf.d')
endfunction
let g:syntastic_haskell_hdevtools_args = '-g-ilib -g-isrc -g-i. -g-idist/build/autogen -g-Wall -g-package-conf='.FindCabalSandboxRootPackageConf()


" function key shortcuts for hdevtools.  I particular, hitting F2 while
" cursor is over a Haskell identifier will display its type
au FileType haskell nnoremap <buffer> <F2> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F4> :HdevtoolsInfo<CR>


" recommended default settings for syntastic, which will perform 
" syntax checking on startup and after saving
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
