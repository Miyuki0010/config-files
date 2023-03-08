:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set nocompatible
:set ma

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' " Airline themes
Plug 'ghifarit53/tokyonight-vim'
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'wfxr/minimap.vim' " Requiers https://github.com/wfxr/code-minimap)
Plug 'andweeb/presence.nvim' " Discord Rich presence)
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Tree sitter
Plug 'https://github.com/tpope/vim-endwise' " Endwise vim
Plug 'rstacruz/vim-closer' " Auto bracket closer
Plug 'mbbill/undotree' "Undo Tree
Plug 'junegunn/limelight.vim' " Limelight for 
Plug 'junegunn/goyo.vim' " goyo for focusing
call plug#end()

nnoremap <C-f> :NERDTreeFocus
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <F5> :UndotreeToggle<CR>

nmap <F8> :TagbarToggle<CR>

let g:lightline = {'colorschemes' : 'tokyonight'} 

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


inoremap <expr> <Tab> pumvisible() ? coc_select_confirm() : "<Tab>"

let g:minimap_width = 10
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1

" ## Focused work
let g:limelight_conceal_ctermfg = 240
function FocusStart()
    Limelight
        Goyo
endfunction
command! Focus call FocusStart()
function FocusEnd()
    Limelight! " At end of goyo end limelight too
endfunction
autocmd! User GoyoLeave call FocusEnd() " If Goyo is ended, end Focus.
