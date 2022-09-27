""==============================================================================================================================================================="
""*************************************************************Configuraciones Globales"*************************************************************************
"================================================================================================================================================================
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
filetype plugin on
"
""==============================================================================================================================================================="
"******************************************************************Plugin Section"*******************************************************************************
" ===============================================================================================================================================================
call plug#begin("~/.vim/plugged")
""Tema vim"
  Plug 'morhetz/gruvbox'
"gestor de archivs"
  Plug 'scrooloose/nerdtree'
"Iconos para del editor"
  Plug 'ryanoasis/vim-devicons' 
""Permite Moverte entre los panles de vim"
  Plug 'christoomey/vim-tmux-navigator'
"Auto completado"
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
    let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python', 'coc-tslint-plugin', 'coc-snippets', 'coc-highlight', 'coc-vetur','coc-angular','coc-flutter']  
""Temas de la barra inferior"
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
"Auto completado de llaves y corchetes"
  Plug 'jiangmiao/auto-pairs'
""Auto completo de parentesis"
  Plug 'machakann/vim-sandwich'
""Maps y completado de tags html"
  Plug 'mattn/emmet-vim'
"Cierra etiquetas html "
  Plug 'alvan/vim-closetag'
"Busqueda de archivos y cadenas"
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
""Muestra si se agrego o elimino una linea"
  if has('nvim') || has('patch-8.0.902')
    Plug 'mhinz/vim-signify'
  else
    Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
  endif
""Muestra Lineas de identacion"
  Plug 'Yggdroot/indentLine'
""Plugin para comentar "
  Plug 'preservim/nerdcommenter'
""Git"
  Plug 'tpope/vim-fugitive'
  ""Colores iconos"
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  ""Vue highlight"
  Plug 'posva/vim-vue' 
  ""Plugins for Flutter/Dart"
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'natebosch/vim-lsc'
  Plug 'natebosch/vim-lsc-dart'
  Plug 'thosakwe/vim-flutter'
  ""Plugin syntax highlight"
  Plug 'sheerun/vim-polyglot'
  ""Snippets React"
  "Plug 'SirVer/ultisnips'
  "Plug 'mlaursen/vim-react-snippets'
  call plug#end()


  "=============================================================================================================================================================="
  "*********************************************************Configuraciones de los Plugins***********************************************************************
  "==============================================================================================================================================================
  ""Nerd Commenter"
  " Create default mappings
  let g:NERDCreateDefaultMappings = 1
  let mapleader=","
  "Configuracion del tema"
  autocmd vimenter * ++nested colorscheme gruvbox
  "  if (has("termguicolors"))
  "set termguicolors
  "endif
  "syntax enable
  "colorscheme dracula
  "
  "Configuracion de airlane""
  let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
  let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
  let g:airline#extensions#tabline#buffer_nr_show = 1

  " Cargar fuente Powerline y símbolos (ver nota)
  let g:airline_powerline_fonts = 1

  set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
  "emmet"
  let g:user_emmet_expandabbr_key = '<C-a>,'
  "Configuracion nerdtree"
  let g:NERDTreeShowHidden = 1
  let NERDTreeQuitOnOpen=1
  let g:NERDTreeMinimalUI = 1
  let g:NERDTreeIgnore = []
  let g:NERDTreeStatusline = ''
  " Automaticaly close nvim if NERDTree is only thing left open
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  nnoremap <silent> <C-b> :call NERDTreeToggleAndRefresh()<CR>
  
  function NERDTreeToggleAndRefresh()
    :NERDTreeToggle
    if g:NERDTree.IsOpen()
      :NERDTreeRefreshRoot
    endif
  endfunction 

  "Terminal"
  "open new split panes to right and below
  set splitright
  set splitbelow
  "turn terminal to normal mode with escape
  tnoremap <Esc> <C-\><C-n>
  "start terminal in insert mode
  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  "open terminal on ctrl+n
  function! OpenTerminal()
    split term://bash
    resize 10
  endfunction
  nnoremap <c-n> :call OpenTerminal()<CR>

  "COC"
  " if hidden is not set, TextEdit might fail.
  set hidden
  " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup
  " Better display for messages
  set cmdheight=2
  " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300
  " don't give |ins-completion-menu| messages.
  set shortmess+=c
  " always show signcolumns
  set signcolumn=yes
  " Use tab for trigger completion with characters ahead and navigate.
  " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
  inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction
  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()
  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  " Use `[c` and `]c` to navigate diagnostics
  nmap <silent> [c <Plug>(coc-diagnostic-prev)
  nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  nmap <silent> <leader>gd <Plug>(coc-definition)
  nmap <silent> <leader> gy <Plug>(coc-type-definition)
  nmap <silent> <leader> gi <Plug>(coc-implementation)
  nmap <silent> <leader> gr <Plug>(coc-references)

  " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap for do codeAction of current line
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Fix autofix problem of current line
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

  " Use `:Format` to format current buffer
  command! -nargs=0 Format :call CocAction('format')

  " Use `:Fold` to fold current buffer
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " use `:OR` for organize import of current buffer
  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " Add status line support, for integration with other plugin, checkout `:h coc-status`
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Using CocList
  " Show all diagnostics
  nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " Show commands
  nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


  ""Configuracion colores iconos"
  let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
  let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

  let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
  let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
  " you can add these colors to your .vimrc to help customizing
  let s:brown = "905532"
  let s:aqua =  "3AFFDB"
  let s:blue = "689FB6"
  let s:darkBlue = "44788E"
  let s:purple = "834F79"
  let s:lightPurple = "834F79"
  let s:red = "AE403F"
  let s:beige = "F5C06F"
  let s:yellow = "F09F17"
  let s:orange = "D4843E"
  let s:darkOrange = "F16529"
  let s:pink = "CB6F6F"
  let s:salmon = "EE6E73"
  let s:green = "8FAA54"
  let s:lightGreen = "31B53E"
  let s:white = "FFFFFF"
  let s:rspec_red = 'FE405F'
  let s:git_orange = 'F54D27'

  let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
  let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

  let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
  let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

  let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
  let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

  let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
  let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

  ""Atajos de teclado de FZF"
  ""buscar archivos"
  nnoremap <C-p> :Files<CR> 
  ""Buscar lineas de codigo"
  nnoremap <leader>lm :BLines<cr> 

  ""ShortCuts for Flutter"
  ""wrap widged"
  nmap <silent><leader>ca <Plug>(coc-codelens-action)
  vmap <silent><leader>a  <Plug>(coc-codeaction-selected)
  nmap <silent><leader>a  <Plug>(coc-codeaction)
  ""Fluter options"
  nnoremap <leader>fa :FlutterRun<cr>
  nnoremap <leader>fq :FlutterQuit<cr>
  nnoremap <leader>fr :FlutterHotReload<cr>
  nnoremap <leader>fR :FlutterHotRestart<cr>
  nnoremap <leader>fD :FlutterVisualDebug<cr>
  "Configuration for vim close tag
  let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.js"
  let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.erb'
