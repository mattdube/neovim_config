
" << STARTERS >>
luafile ~\AppData\Local\nvim\plugins.lua
filetype indent plugin on
set encoding=utf-8
scriptencoding utf-8

let g:mapleader = ","
set cursorline          " show cursorline
set colorcolumn=80

" UI configuration
syntax on
syntax enable

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" vim-autoformat
noremap <F3> :Autoformat<CR>

luafile ~\AppData\Local\nvim\plugins.lua

" << PLUGINS >>
""" Vim-Plug
call plug#begin()

" Color themes
Plug 'endel/vim-github-colorscheme'
Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'
Plug 'haishanh/night-owl.vim'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "{{{		" File tree
  nnoremap <silent> <F4> :NERDTreeToggle<CR>
  nnoremap <silent> <F5> :NERDTreeFind<CR>
  nnoremap <F9> :NERDTreeToggle D:\Users\Matt\GitHub
"}}}
Plug 'airblade/vim-gitgutter'                                       " Track git changes
Plug 'jreybert/vimagit'
" Push to remote
nnoremap <leader>gP :! git push<CR>  " git Push

Plug 'w0rp/ale'                                                     " Async Linting
Plug 'scrooloose/nerdcommenter'                                     " Easy commenting
Plug 'tpope/vim-surround'                                           " Operations around surrounding
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'											"  use <Tab> for all your insert completion needs (:help ins-completion)
Plug 'airblade/vim-rooter'

" fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

" multiple cursors
Plug 'terryma/vim-multiple-cursors'


Plug 'jalvesaq/Nvim-R'                                              " Enhancements for R

" snippet framework beginning
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'


" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'Chiel92/vim-autoformat'


Plug 'gaalcaras/ncm-R' " snippets
Plug 'ncm2/ncm2-ultisnips' " ncm and ultisnips integration
Plug 'SirVer/ultisnips'  " snippet engine
" snippets framework end
Plug 'chrisbra/csv.vim' "for viewing data directly in vim R (Nvim-R)

" autocomplete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}                         " Autocompletion framework

Plug 'ryanoasis/vim-devicons'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
Plug'bling/vim-bufferline'

" Behaviour/tools
" Plug 'nhooyr/neoman.vim'                                                " Using vim as a manpager
Plug 'rhysd/git-messenger.vim'                                          " See git commit message for current line with <Leader>gm
Plug 'romainl/vim-qf'                                                   " Automatically close quickfix windows that become orphaned
" Plug 'tpope/vim-repeat'                                                 " Add repeat support with '.' for lots of plugins
Plug 'tpope/vim-sensible'                                               " Sensible vim defaults
" Plug 'wakatime/vim-wakatime'                                            " Automatic timetracking of programming [wakatime.com]

" Load Indentpython
Plug 'vim-scripts/indentpython.vim'
" Load indentation checker
Plug 'nvie/vim-flake8'

" Load vimcmdline. This is the suggested plugin to load for jupyter-console /
" ipython REPL.
Plug 'xuesoso/vimcmdline'

" jupyter-vim
Plug 'jupyter-vim/jupyter-vim'

" Load jupytext
Plug 'goerz/jupytext.vim'

call plug#end()
"
" << COLORSCHEMES >>
set background=dark
" colorscheme PaperColor
colorscheme night-owl

" let g:airline_theme='papercolor'
"let g:lightline = {
"      \ 'colorscheme': 'PaperColor',
"      \ }
"  
let g:lightline = {
  \   'colorscheme': 'nightowl',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }

let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline


let maplocalleader = ","
" the default is , you can also set it to <\space> if you don’t like my setting
  
" <<R Markdown >>

" set rmarkdown file type for safety
au BufNewFile,BufRead *.Rmd set filetype=rmd

" << R Settings >>
nmap <LocalLeader>test <Plug>RClearConsole " idem
  
nmap <LocalLeader>rr <Plug>RStart  " rr is easier than rf
vmap <LocalLeader>rr <Plug>RStart " idem
nmap <LocalLeader>rq <Plug>RClose " rq = rquit, easier to remember
vmap <LocalLeader>rq <Plug>RClose " idem

let R_rconsole_width = 75
let R_min_editor_width = 20

" settings :: Nvim-R plugin
" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1

" R commands in R output are highlighted
let g:Rout_more_colors = 1

" First use tab and shift tab to browse the popup menu and use enter to expand:

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

inoremap <c-c> <ESC>

inoremap ncm2_ultisnips#expand_or("<CR>”, 'n')
inoremap pumvisible() ? "<C-n>" : "<Tab>"
inoremap pumvisible() ? "<C-p>" : "<S-Tab>"
" However the previous lines alone won’t work, we must disable the UltiSnips Expand Trigger, I set it to ctrl-0
let g:UltiSnipsExpandTrigger="<c-0>"

" some nice keybindding, D = cursor down one line when finished the code
" localleader+rv = view data, +rg = plot(graphic), +rs = summary, all without sending lines to R buffer, very useful
" Other useful features like Rformat and R RBuildTags aren’t covered here, see Nvim-R for more info.
" useful when in Rmarkdown, send chunk

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
autocmd BufNewFile,BufRead *.ipynb,*.py set syntax=python
let g:jupytext_filetype_map = {'md': 'python'}
let g:jupytext_to_ipynb_opts = '--to=ipynb --update'
autocmd BufNewFile,BufRead *.md set filetype=tex


" Configurations for vimcmdline
autocmd FileType python nmap <silent> <A-s> m0?```python<CR>jv/```<CR>k<Space>`0:delmarks 0<CR>:nohl<CR>
autocmd FileType python nmap <silent> <A-Space> m0v/```<CR>k<Space>`0:delmarks 0<CR>:nohl<CR>
let cmdline_app = {}
let cmdline_app['python'] = 'jupyter-console'
let cmdline_follow_colorscheme = 1




"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <silent> <leader>\ <c-^>


" Copy to system clipboard
vnoremap  <leader>y  "+y
vnoremap  <leader>Y  "+yg$
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from system clipboard
nnoremap <leader>p :set paste<CR> "+p :set nopaste<CR>
nnoremap <leader>P :set paste<CR> "+P :set nopaste<CR>
vnoremap <leader>p :set paste<CR> "+p :set nopaste<CR>
vnoremap <leader>P :set paste<CR> "+P :set nopaste<CR>

" Remap arrow keys to buffer switching
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Remap shift + arrow keys to open new tabs
nnoremap <S-Left> :0tabnew<CR>
nnoremap <S-Right> :$tabnew<CR>

set number