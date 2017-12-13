{ ... }:

let
  plugins = ''
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = "bubblegum"
 
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_aggregate_errors = 1
    let g:syntastic_haskell_checkers = []
    let g:syntastic_javascript_checkers=['eslint']
    let g:syntastic_javascript_eslint_exec = '$(npm bin)/eslint'

    autocmd BufWritePost *.hs GhcModCheckAndLintAsync

    call deoplete#enable()
    let g:necoghc_enable_detailed_browse = 1
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

    let g:javascript_plugin_flow = 1
    let g:jsx_ext_required = 0

    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    xmap <C-k> <Plug>(neosnippet_expand_target)
    
    if has('conceal')
      set conceallevel=2 concealcursor=niv
    endif
  '';
  text = ''
    set encoding=utf-8
    syntax on
    filetype on
    filetype plugin indent on

    colorscheme afterglow
    set background=dark
    set t_Co=256
  '';
  behaviour = ''
    set autoread

    set smartindent
    set tabstop=2
    set shiftwidth=2
    set expandtab
    set smarttab
    set backspace=eol,start,indent

    set number
    set ruler
    set showcmd

    set wildmenu
    set wildignore=*.o,*~,*.ibc

    set colorcolumn=80

    set ignorecase
    set smartcase
    set hlsearch
    set incsearch

    set mouse=a

    map j gj
    map k gk

    set magic

    set showmatch

    set laststatus=2

    set nobackup
    set noswapfile

    cmap w!! w !sudo tee > /dev/null %

    cnoreabbrev t tabedit
  '';
in ''
  ${plugins}
  ${text}
  ${behaviour}
''
