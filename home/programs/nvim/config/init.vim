"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
set termguicolors               " Displays the correct full color scheme.
set number relativenumber       " Display line numbers
set incsearch                   " Incremental search
set cursorline                  " Cursor line
"set laststatus=2                " Always show statusline

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:suda_smart_edit = 1       " suda plugin
let g:highlightedyank_highlight_duration = -1       " permanent yank highlight

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colour Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
packadd! omni
syntax enable
colorscheme omni
highlight Normal ctermbg=NONE guibg=NONE     "Sets background transparency

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                                           
" => Number line                                                     
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""                                                       
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:imap ii <Esc>                  

" center screen after search
nnoremap n nzzzv
nnoremap N Nzzzv

" Alias write and quit to Q
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>1 :q!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q w
cnoreabbrev Qall qall


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vmap for maintain Visual Mode after shifting > and <
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap < <gv
vmap > >gv

nnoremap <esc> :noh<return><esc>


