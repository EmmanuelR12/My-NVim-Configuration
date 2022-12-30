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
  "Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
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
  ""Plug Snippets React"
  Plug 'SirVer/ultisnips'
  Plug 'mlaursen/vim-react-snippets'
  ""Manjeo de simbolos en el codigo"
  Plug 'tpope/vim-surround'
  call plug#end()


  "=============================================================================================================================================================="
  "*********************************************************Configuraciones de los Plugins***********************************************************************
  "==============================================================================================================================================================
  ""Nerd Commenter"
  " Create default mappings
  let g:NERDCreateDefaultMappings = 1
  let mapleader=","

  "Configuracion del tema"
  "autocmd vimenter * ++nested colorscheme gruvbox
  colorscheme tokyonight-night

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
  let g:airline_theme='violet'

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
  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  set signcolumn=yes

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: There's always complete item selected by default, you may want to enable
  " no select by `"suggest.noselect": true` in your configuration file.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  " Make <CR> to accept selected completion item or notify coc.nvim to format
  " <C-g>u breaks current undo, please make your own choice.
  inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  "if has('nvim-0.4.0') || has('patch-8.2.0750')
  "nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  "inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  "vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  "vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  "endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
  ""Abrir buffers"
  nnoremap <leader>b :Buffers<cr>

  let g:fzf_preview_window = ['right,50%', 'ctrl-/']

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
