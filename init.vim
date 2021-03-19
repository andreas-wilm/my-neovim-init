" gqq: word wrap
"
" ctrl-r redo
"
" S delete the entire line you’re on, and enter insert mode: S
"
" gd will take you to the local declaration.
" gD will take you to the global declaration.
" 
" g* search for the word under the cursor (like *, but g* on 'rain' will find words like 'rainbow').
" g# same as g* but in backward direction.
"
" '' Go back (' go to mark, ' temp mark before jump)
"ctrl o Go back step by step

" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
let g:ale_completion_enabled = 1

call plug#begin()
" To comment out a single line, use <leader>cc (leader is a prefix key in
" Nvim, the default leader key is backslash \); to uncomment a line, use
" <leader>cu. To comment or uncomment several lines, add a repeating number to
" corresponding command 
Plug 'scrooloose/nerdcommenter'

" In Nvim, if you yank (i.e., copy) a block of text, you do not get a visual
" hint about exactly what you have copied. Unless you are very familiar with
" Nvim, you may have copied less or more than what you want to copy, which is
" annoying. With the help of vim-highlightedyank, you can now highlight the
" text region which you have yanked. 
Plug 'machakann/vim-highlightedyank'

" Linting
Plug 'dense-analysis/ale'

" code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" colorscheme
Plug 'morhetz/gruvbox'
Plug 'danilo-augusto/vim-afterglow'

call plug#end()

colorscheme afterglow

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

let g:deoplete#enable_at_startup = 1
" https://stackoverflow.com/questions/44251106/tabbing-in-deoplete-is-backward
inoremap <silent><expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:ale_linters = {
      \   'python': ['pylint'],
      \}
let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
let g:ale_fix_on_save = 1

" colorscheme config
set background=dark " use dark mode


"" Adopted from https://github.com/jeffkreeftmeijer/neovim-sensible
"
" Use "hybrid" (both absolute and relative) line numbers
set number relativenumber
" Use the system clipboard
set clipboard=unnamed
" Use a color column on the 80-character mark
set colorcolumn=80
" Use , as the leader key
let mapleader=","
" Use ,, to switch between buffers
nnoremap <leader><leader> :b#<CR>
" Press <tab>, get two spaces
" set expandtab shiftwidth=2
" Show `▸▸` for tabs: 	, `·` for tailing whitespace: 
set list listchars=tab:▸▸,trail:·
" Enable mouse mode
set mouse=a

