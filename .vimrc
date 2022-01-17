call plug#begin('~/.local/share/nvim/plugged')
  Plug 'w0rp/ale'
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'hsanson/vim-openapi'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-repeat'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  Plug 'sheerun/vim-polyglot'

  Plug 'kien/ctrlp.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'ludovicchabant/vim-gutentags'

  Plug 'vim-scripts/BufOnly.vim'

  Plug 'arcticicestudio/nord-vim'
  Plug 'morhetz/gruvbox'

  " these plugins show vertical lines to make seeing indents easier
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'Yggdroot/indentLine'
call plug#end()

" theme
syntax enable
" set Vim-specific sequences for RGB colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if (has("termguicolors"))
  set termguicolors
endif

set cursorline

" let g:gruvbox_contrast_light='hard'
" set background=light
" colorscheme gruvbox

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_status_lines = 1
let g:nord_uniform_diff_background = 1
let g:nord_cursor_line_number_background = 1
augroup nord-theme-overrides
  autocmd!
  autocmd ColorScheme nord highlight Comment ctermfg=14 guifg=#B48EAD
augroup END
colorscheme nord

let g:indentLine_char = '┊'
let g:vim_dockerfile_conceal = 0
let g:vim_dockerfile_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_json_conceal = 0
let g:vim_json_conceal_code_blocks = 0

let g:airline_powerline_fonts = 1
set lazyredraw
" fix nerdtree cursorline issue
hi NERDTreeFile ctermfg=14

" remove swap files
set noswapfile

" line numbers
set nu
set relativenumber

" ; -> command mode
nnoremap ; :

" quick escape
inoremap jj <ESC>

" split line
nnoremap J i<CR><Esc>
nnoremap K :join<CR><Esc>

" space leader
let mapleader = " "

" copy to clipboard
vnoremap <C-c> "+y

" clear whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" NERDTree
" open nerdtree when opening vim on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" close vim if nerdtree is the last buffer open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" display column with preferred width
if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=black
endif

"show hidden files in nerdtree, hide gitignore files in nerdtree/ctrl-p
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.un\~$', 'tags', '.heaps', '.git$', '.vscode$', '__pycache__', '\.pyc$', '\.swp$', 'node_modules', 'venv', '.DS_Store', '.terraform', '.tfstate*']

let NERDTreeHighlightCursorline=0

" toggle nerdtree
nmap <leader>n :NERDTreeToggle<CR>
" find opened buffer in NERDTree
nmap <leader>f :NERDTreeFind<CR>

" map ctrl-n and ctrl-b to navigate through grep results
nmap <silent> <C-N> :cn<CR>zv
nmap <silent> <C-B> :cp<CR>zv

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" buffer navigation
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
set hidden
" move to next buffer in tabline
nmap <leader>l :bnext<CR>
" move to previous buffer in tabline
nmap <leader>h :bprevious<CR>
" close current buffer
nmap <leader>w :bp <BAR> bd #<CR>
" close all but current buffer
nmap <leader>a :BufOnly<CR>
" move to numbered buffer
nmap <leader>t :<C-U>exe "buffer".v:count1<CR>
" move to previously used buffer
nmap <leader>b :e #<CR>

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" j/k work in column mode
nnoremap j gj
nnoremap k gk

" undo file and save on lost focus
au FocusLost * :wa
set undofile

" searching
nnoremap / /\v
vnoremap / /\v
set incsearch
set hlsearch
nnoremap <leader><backspace> :noh<cr>

" deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:neosnippet#enable_completed_snippet = 1
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#custom#var = 1

" column
" display column with preferred width
if (exists('+colorcolumn'))
    autocmd BufNewFile,BufRead * setlocal colorcolumn=100
    highlight ColorColumn ctermbg=black
  endif

" w0rpAle
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠️'
let g:ale_set_highlights = 1
let g:ale_linters = {
\  'openapi': ['yamllint', 'ibm_validator'],
\  'javascript': ['eslint'],
\  'python': ['flake8']
\}

" The Silver Searcher
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ ~/.ignore
  let g:ctrlp_user_command = 'ag --path-to-ignore ~/.ignore %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif
nnoremap T :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>


" ctrl p
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_root_markers = ['serverless.yml', '.gitignore']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }
" ctrl p do not show preview
set completeopt-=preview


" markdown editing
au BufRead,BufNewFile *.md set wrap linebreak nolist textwidth=0 wrapmargin=0

" vtl editing
au BufNewFile,BufRead *.vtl set ft=velocity

let g:AutoPairsMultilineClose = 0

" fugitive
nnoremap <space>gs :belowright Git<CR>
nnoremap <space>gc :belowright Git commit -v<CR>
nnoremap <space>gp :Git push<CR>

" TAGS
" goto tag
nnoremap gt <C-]>
" goto tag preview
nnoremap gp <C-w>}
set statusline+=%{gutentags#statusline()}
let g:gutentags_project_root = ['.git', 'serverless.yml']
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]
let g:gutentags_exclude_filetypes=['gitcommit']

" Markdown Todo
function! MarkTodoTask()
  let line = getline('.')
  if line =~ '\[ \]'
    .s/\[ \]/\[-\]/
  elseif line =~ '\[-\]'
    .s/\[-\]/\[\x\]/
  elseif line =~ '\[x\]'
    .s/\[x\]/\[\ \]/
  endif
endfunction

" Markdown Format
function! MarkdownFormat()
  setlocal tw=100 formatoptions+=tw
  normal gggqG
endfunction
autocmd FileType markdown nnoremap - :call MarkTodoTask()<CR>
autocmd FileType markdown nnoremap <leader>m :call MarkdownFormat()<CR>

" Scratch pad
function! Scratch()
  split ~/.scratch
  setlocal bufhidden=hide
  setlocal nobuflisted
  resize 10
endfunction
noremap <C-s> :call Scratch()<CR>
