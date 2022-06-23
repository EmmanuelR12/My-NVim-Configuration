# My-NVim-Configuration
My personal configuration for the Neo vim text editor. This configuration is for package manager Vim Plug

The config is focus for web development, you can edit html,css, js and Ts languages. In addition, you can edit Vue js and Angualr Apps.

Plugs
- Theme: Plug 'morhetz/gruvbox'
- File System: Plug 'scrooloose/nerdtree'
- Icons: Plug 'ryanoasis/vim-devicons' 
- Movement between panles: Plug 'christoomey/vim-tmux-navigator'
- Auto completed: Plug 'neoclide/coc.nvim'
- Themes for Air Lane: Plug 'bling/vim-airline'
                     Plug 'vim-airline/vim-airline-themes'
- Auto completed for brackets: Plug 'jiangmiao/auto-pairs'
- Auto completed for parenthesis:Plug 'machakann/vim-sandwich'
- Shortucts html, css and more..:Plug 'mattn/emmet-vim'
- Close html tags:Plug 'alvan/vim-closetag'
- Shearch files:Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
              Plug 'junegunn/fzf.vim'
- Tool for git addition :
                      if has('nvim') || has('patch-8.0.902')
                        Plug 'mhinz/vim-signify'
                      else
                        Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
                      endif
- Show identation lines:Plug 'Yggdroot/indentLine'
- Comments:Plug 'preservim/nerdcommenter'
- Git: Plug 'tpope/vim-fugitive'
- Icons colours: Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
- Vue highlight:Plug 'posva/vim-vue' 
