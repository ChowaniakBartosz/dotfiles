" Load vim plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
" Load basic settings
source $HOME/.config/nvim/general/settings.vim
" Load key mappings
source $HOME/.config/nvim/keys/mappings.vim

" vimwiki settings
let g:vimwiki_list = [{'path':'~/notes', 'syntax':'markdown', 'ext':'.md'}]
let g:vimwiki_ext2syntax = {'.md':'markdown', '.markdown':'markdown', '.mdown':'markdown'}

" makes vimwiki markdown links as [link](link.md) instead of [link](link)
let g:vimwiki_markdown_link_ext = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Sets airline theme
let g:airline_theme='base16_gruvbox_dark_hard'
set showtabline=2
set noshowmode
