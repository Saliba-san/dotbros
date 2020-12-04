set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

call plug#begin('~/.vim/plugged')
  " Editor
    Plug 'dense-analysis/ale'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/vim-easy-align'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
    Plug 'junegunn/fzf.vim'
    Plug 'https://github.com/vim-scripts/taglist.vim.git'
    Plug 'sheerun/vim-polyglot'
    Plug 'kshenoy/vim-signature' 
    Plug 'ervandew/supertab'
    " Snippets
      Plug 'SirVer/ultisnips'
      Plug 'honza/vim-snippets'
  " Style
    Plug 'Dave-Elec/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'ap/vim-css-color'
    Plug 'https://github.com/itchyny/lightline.vim.git'
  " Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
  " C++ 
    Plug 'https://github.com/ycm-core/YouCompleteMe.git'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  " Latex
    Plug 'lervag/vimtex'
    Plug 'https://github.com/mbajobue/scim-latex-tables.git'
  " Markdown
    Plug 'https://github.com/mipmip/vim-scimark.git'
    Plug 'plasticboy/vim-markdown'
  " SuperCollider
    Plug 'supercollider/scvim'
  " R
    Plug 'jalvesaq/Nvim-R'
  " GoYo
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
  " Julia
    Plug 'https://github.com/JuliaEditorSupport/julia-vim.git'

call plug#end()
" Tags
  " C++
    autocmd filetype cpp :set tags+=$HOME/.vim/tags/cpp<CR>

    command IncludeGL execute ":set tags+=$HOME/.vim/tags/gl"

    " Create ctags from my project
    command Ctags execute ":!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q ."

cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"vim polyglot settings.
 let g:go_highlight_build_constraints = 1
 let g:go_highlight_extra_types = 1
 let g:go_highlight_fields = 1
 let g:go_highlight_functions = 1
 let g:go_highlight_methods = 1
 let g:go_highlight_operators = 1
 let g:go_highlight_structs = 1
 let g:go_highlight_types = 1
 let g:go_highlight_function_parameters = 1
 let g:go_highlight_function_calls = 1
 let g:go_highlight_generate_tags = 1
 let g:go_highlight_format_strings = 1
 let g:go_highlight_variable_declarations = 1
 let g:go_auto_sameids = 1

"vim fzf
  let g:fzf_out = { 'window': { 'width': 0.8, 'height': 0.8 } }

"make calcurse markdown compatible
autocmd BufRead, BufNewFile /tmp/calcurse* set filetype=markdown
autocmd BufRead, BufNewFile ~/calcurse/notes/* set filetype=markdown

filetype plugin indent on
" Editor
  set completeopt-=preview
  set shell=bash
  set backupdir=$HOME/.vim/vimbackup/  " but not when they clog .
  set directory=$HOME/.vim/vimswap/  " Same for swap files
  set viewdir=$HOME/.vim/vimviews/    " same for view files
  " SpellCheck
  set spelllang=pt_br

" Style
  let g:gruvbox_contrast_dark = 'hard'
  let g:gruvbox_material_contrast_dark = 'hard'
  let g:gruvbox_invert_selection='0'
  let g:gruvbox_transparent_bg= '0'
  let g:gitgutter_override_sign_column_highlight=1
	colorscheme gruvbox
	set background=dark
    " LightLine
      set noshowmode
      let g:lightline = {
          \ 'colorscheme': 'gruvbox_material',
          \ 'active' : {
          \   'left' : [ [ 'mode' ],
          \              [ 'filename', 'modified' ] ],
          \   'right': [ [ 'lineinfo' ],
          \              [ 'percent' ],
          \              [ 'filetype'] ]
          \            }
          \ }
 
	let g:limelight_conceal_ctermfg = 'gray'
	let g:limelight_conceal_ctermfg = 240
	let g:limelight_conceal_guifg = 'DarkGray'
	let g:limelight_conceal_guifg = '#777777'

	"Goyo settings
  command Prosa execute(":call ToggleProse()") 
	function! s:goyo_enter()
			set noshowmode
			set noshowcmd
			set nocursorline
      setlocal spell spelllang=pt_br
			silent Limelight
      silent Prosa
       
	endfunction

	function! s:goyo_leave()
			set noshowmode
			set noshowcmd
			set nocursorline
      setlocal nospell
			Limelight!
      Prosa
	endfunction

	autocmd! User GoyoEnter nested call <SID>goyo_enter()
	autocmd! User GoyoLeave nested call <SID>goyo_leave() 

  map <C-p> :Prosa<CR>
  map Q :Goyo 70%x85%<CR>

    " Tab config
      set shiftwidth=2
      set tabstop=2
      set expandtab

    " Line Numbering 
      set nu " number lines
      set rnu " relative line numbering

    " Some things that should be default
      set shortmess+=I " disable startup message
      set incsearch " incremental search (as string is being typed)
      set nohlsearch " no highlight search 
      set lbr " line break
      set showmatch           " highlight matching [{()}]
      set laststatus=2        " Show the status line at the bottom
      set mouse+=a            " A necessary evil, mouse support
      set splitbelow splitright
      set scrolloff=1

"Undo
  set undofile " Maintain undo history between sessions
  set undodir=$HOME/.vim/undodir
  set history=8192 " more history

" Snippets
  "Trigger config
  let g:UltiSnipsExpandTrigger="<S-tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"
  let g:UltiSnipsEditSplit="vertical"
" Shortcut maps
	" Leader shit
    let mapleader = " "
    nnoremap <SPACE> <Nop>

  " Yank
    map Y "+y

  " Native manager
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k
    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l

    tnoremap <C-j> <C-w>j
    tnoremap <C-k> <C-w>k
    tnoremap <C-h> <C-w>h
    tnoremap <C-l> <C-w>l

    nnoremap <Up> :resize +2<CR>
    nnoremap <Down> :resize -2<CR>
    nnoremap <Left> :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>

  " Native Comands
    nnoremap S :%s//g<Left><Left>
    vnoremap <Leader>n :norm<SPACE>

  " Plugins Keys
    " Nerd Tree
      nnoremap <Leader>n :NERDTreeToggle<CR>
      nnoremap <Leader>f :NERDTreeFind<CR>
    " TagList
      nnoremap <F12> :TaglistToggle<CR>
    " Easy-Align
      xmap ga <Plug>(EasyAlign)
      nmap ga <Plug>(EasyAlign)
    " Signature
      map <Leader>m :SignatureToggle<CR>
      map <Leader><C-m> :SignatureListMarkers<CR>
    " Colorscheme
      command ColGb execute ":colorscheme gruvbox"
      nnoremap <Leader>t :ColGb<CR>
      command ColGbm execute ":colorscheme gruvbox-material"
      nnoremap <Leader>g :ColGbm<CR>

"SuperCollider
let g:scFlash = 1
let g:sclangTerm = "st -e $SHELL -ic"
autocmd BufRead,BufNewFile *.sc set filetype=sc
  " shorcuts
  autocmd filetype supercollider map <Leader>1 <F5>
  autocmd filetype supercollider map <Leader>2 <F6>
  autocmd filetype supercollider map <Leader>0 :SClangStart<CR>
  autocmd filetype supercollider map <Leader>9 :SCtags<CR>
"Latex
  let g:tex_flavor = 'latex'
  autocmd BufRead,BufNewFile *.Rnw set filetype=tex
  autocmd filetype tex map <Leader>s :setlocal spell spelllang=pt_br<CR>
  augroup latex
    autocmd filetype tex map <C-m> :! pdflatex %<CR>
    autocmd filetype tex map <Leader>z :! zathura $(echo % \| sed "s/tex$/pdf/g") & disown<CR>
    autocmd filetype tex inoremap ;fig \begin{figure}[H]<CR>\centering<CR>\includegraphics{}<CR>\captions{}\label{}<CR>\end{figure}<ESC>2kwa
    autocmd filetype tex inoremap ;p \usepackage{}<left>
    autocmd filetype tex inoremap ;eq \begin{equation}<cr>\end{equation}o
    autocmd filetype tex inoremap ;s \section{}<left>
    autocmd filetype tex inoremap ;i \emph{}<left>
    autocmd filetype tex inoremap ;b \bold{}<left>
    autocmd filetype tex inoremap ;r \ref{}<left>
    autocmd filetype tex vnoremap ;$ c$<ESC>pa$<ESC>
    autocmd filetype tex vnoremap ;i c\emph{<ESC>pa}<ESC>
    autocmd filetype tex vnoremap ;b c\bold{<ESC>pa}<ESC>
    autocmd filetype tex vnoremap ;r c\ref{<ESC>pa}<ESC>
  augroup end

"Autocmds

  " Python
    " Compile and run
    autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
  " C
    " Compile and run
    autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

  " C++
    " Compile and run
    autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
    " Compile and run into an image.ppm
    autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r').' > image.ppm'<CR>
    " Compile paralellyzed  and run into an image.ppm
    autocmd filetype cpp nnoremap <F6> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' -fopenmp && time ./'.shellescape('%:r').' > image.ppm'<CR>

" Prose mode
let g:ProseOn=0

function! ToggleProse()
    if !g:ProseOn
        call Prose()
    else
        call ProseOff()
    endif
endfunction

function! Prose()
    echo "Prose: On"
    let g:ProseOn=1

    noremap j gj
    noremap k gk
    noremap 0 g0
    noremap $ g$
    noremap A g$a
    noremap I g0i
    setlocal linebreak nonumber norelativenumber foldcolumn=2
    setlocal spell spelllang=pt_br
    hi! link FoldColumn Normal

endfunction

function! ProseOff()
    echo "Prose: Off"
    let g:ProseOn=0

    noremap j j
    noremap k k
    noremap 0 0
    noremap $ $
    noremap A A
    noremap I I
    setlocal nospell
    setlocal nolinebreak number relativenumber t_Co=256 foldcolumn=0

endfunction
