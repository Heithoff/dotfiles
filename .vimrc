" .vimrc file

"================================================================="
" ****** Most important line at the top!!!! **********************"
"================================================================="
    set nocompatible                  

"================================================================="
" ****** Define leaders early in .vimrc prior to any mappings *** "
"================================================================="
    let mapleader      = "\<space>"
    let maplocalleader = "\\"
    " nnoremap - <nop>


"================================================================="
" ****** Set up plug-ins with Vundle. *************************** "
"================================================================="
    filetype off               " Temporarily disable filetype detection

     " set the runtime path to include Vundle and initialize
     set rtp+=~/.vim/bundle/Vundle.vim
     call vundle#begin()

     " **** let Vundle manage Vundle, required **** 
     Plugin 'VundleVim/Vundle.vim'

    " **** Tim Pope's plugins! ******
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-characterize'
    Plugin 'tpope/vim-repeat'       
    Plugin 'tpope/vim-unimpaired'       
    Plugin 'tpope/vim-surround'       
    Plugin 'tpope/vim-abolish'
    Plugin 'tpope/vim-scriptease'
    Plugin 'tpope/vim-eunuch'

    "**** Tmux help *** "
    Plugin 'tmux-plugins/vim-tmux'
    Plugin 'christoomey/vim-tmux-navigator'
    
    "**** Faster grep program
    Plugin  'mileszs/ack.vim'
    let g:ackprg = "ag --vimgrep"

    " **** vim-airline for a better status bar**** 
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_powerline_fonts                     = 1 "Use the special font characters
    let g:airline#extensions#whitespace#enabled       = 0 "Don't give a warning message for whitespace problems
    let g:airline#extensions#tabline#enabled          = 1 "Display buffers as tab titles
    let g:airline#extensions#tabline#buffer_min_count = 2     "Do not use labels in the tabline until there are at least two buffers open.
    let g:airline#extensions#tabline#fnamemod         = ':t'  "Display only the filename in the tabline, not the entire path.
    let g:airline#extensions#tabline#formatter        = 'unique_tail_improved'
    " let g:airline_theme                               = 'base16_monokai'
    let g:airline_theme                               = 'cool'
    " let g:airline_theme                               = 'apprentice'

    " **** Get a bunch of extra colorschemes, a way to switch between them, and a colorizer ****"
    Plugin 'flazz/vim-colorschemes'
    " Plugin 'altercation/vim-colors-solarized'
    Plugin 'ryan-hanson/vim-lucid-colorscheme'
    Plugin 'xolox/vim-misc'
    Plugin 'xolox/vim-colorscheme-switcher'
    Plugin 'arcticicestudio/nord-vim'
    " Plugin 'cocopon/iceberg.vim'
    " Plugin 'lilydjwg/colorizer'

    " **** Matrix screensaver
    Plugin 'uguu-org/vim-matrix-screensaver'
   

    " **** Taglist plug-in ****
    Plugin 'vim-scripts/taglist.vim'
    nnoremap <leader>tl :TlistToggle<cr>
    
    " **** NERDTree file explorer**** 
    Plugin 'scrooloose/nerdtree'
    let NERDTreeIgnore=['\.pyc$', '\.swp','\~$']
    
    " *** Breakout game *** "
    Plugin 'johngrib/vim-game-code-break'

    " **** Tabular, to align text easily**** 
    Plugin 'godlygeek/tabular'
      " Align by equal signs
      nnoremap <Leader>t=  :Tabularize /=<CR>
      "
      " Align by colons
      nnoremap <Leader>t:  :Tabularize /:<CR>
      
      " Align by spaces
      nnoremap <Leader>t<space>  :Tabularize / <CR>

      " Align by a Tcl set assignment.  
      "     \v = very magic regex 
      "     set +\w+ + = 'set' plus a second word surrounded by spaces
      "     \zs = This marks the start of the regex match, 
      "           which will be the next word.
      nnoremap <Leader>tset :Tabularize /\vset +\w+ +\zs/<CR>


    " **** Mark.vim:  multi-color highlighting. ****
    Plugin 'Tuxdude/mark.vim'

    " *** Visualize the undo tree history ***
    Plugin 'chrisbra/histwin.vim'

    " All of your Plugins must be added before the following line
     call vundle#end()            " required

     " Restore filetype detection settings.
     filetype plugin indent on    " required
" ************* Vundle activation complete *********************** "
"
"================================================================="

" **** optional plugins from distribution ($VIMRUNTIME/pack)
    packadd! matchit
"================================================================="


"================================================================="
" ********************* 'set' Settings  ************************** "
"================================================================="
    " ESSENTIAL! Lets you open a second buffer without saving the first
    set hidden

    " Define where the .swp file will go.
    "   My default used to be .,./tmp,/etc/var,/tmp.  I got an email from the
    "   sysadmin saying that a .swp file of a .gz file blew up /etc/var to 100%
    set directory=.,/tmp

    "  Tabs and indentations
    set smartindent                   " Automatically sets the correct the indent point after a carriage return
              "(this might need to turned off when pasting text from clipboard
    " set backspace=indent,eol,start    " The backspace key wraps around from start of line to eol.
    set backspace=indent,eol,start
    set expandtab                     " The tab key will actually produce spaces, not tabs. 
    set softtabstop=4                 " Spaces will seem even more like tabs.
    set tabstop=4                     " Tabstop is 8 characters wide"
    set shiftwidth=4                  " Text will shift by 4 characters when doing shift commands 
    " let g:python_recommended_style=0  " This will disable tab settings from ftplugin/python.vim file.

    " Manages how non-visible characters appear when set list is turned on.
    set nolist
    set encoding=utf-8                " Typical encoding for Unicode stuff.
    set listchars=tab:▶\ ,space:␣

    " Cursor control
    set virtualedit=all               " Let you move the cursor all over the place, even on empty space.
    set mouse=a                       " Lets you use the mouse to scroll and select.
    set scrolloff=2                   " Keeps cursor 2 lines from extreme top and bottom during scroll
    set noshowmatch                   " Do not briefly jump the cursor back to opening brace after typing closing brace.
                                          " (The standard matchparen plugin will still highlight matching pairs.)
    " Better splits (new windows appear below and to the right)
    set splitbelow
    set splitright

    " Don't automatically wrap text
    set nowrap

    " Search settings
    set ignorecase                    " Ignore cases during searches.  'VIM' will match search for 'vim'
    set smartcase                     " Match capital letters when included in search pattern, but otherwise ignore
    set incsearch                     " Incremental search. Actively show successful searches while you're typing a search
    set hlsearch                      " Highlight all the matches.  Don't just move to the location.

    " Substitution settings
    set gdefault                      " Always include /g at the end of a substitution expression.
    
    " Line numbering 
    set number                        " Displays line numbers.
    " set relativenumber                " Displays relative line numbers before and after current line.
  
    " Status bar contents (might be superceded by Airline plug-in)
    set laststatus=2                  " Displays the status line always 2 lines tall
    set showcmd                       " Display the most recently typed command at bottom of screen.
    set showmode                      " Displays which mode is currently active.
    set ruler                         " Displays row, column info at bottom of screen.
    set wildmenu                      " creates a wildcard menu for autocompletion choices after pressing tab
    set wildignore+=*.swp,*/tmp/*,*.pyc
    set wildmode=full

    " Timeout scenarios
    set timeout           " Wait for a given amount of time to disunambiguate a mapping or keycode
    set timeoutlen=500    " Wait 500ms for the rest of a mapping to complete (default is 1000ms)
    set ttimeoutlen=100   " Wait 100ms for the rest of an abbreviation (default is -1, same as timeoutlen)
                     
    " others
    set clipboard=unnamed             " Let the system clipboard use unnamed register!
    set novisualbell                  " Turn off visual bell
    set history=500                   " History is 500 commands deep
    set viminfo='0,<50,s10,h          " Changed from the default '100,<50,s10,h.  This is to prevent jumplist
                                         " from using previously edited files.
    set ttyfast                       " This means that my terminal can redraw quickly
    " set previewheight=4               " The height of the preview window
    set modelines=0                   " Ignores vim modelines (little vim messages at bottom of files)
    set showbreak=↪                   " When lines are wrapped, a wrapped line is continued by a ↪ (type ^Vu21aa)
    set isfname+={,}                  " Include the '{' and '}' characters when running the gf command.
    set isfname-==                    " Do not include '=' sign in a fname
    set isfname-=,                    " Do not include comma in a fname
    set shellcmdflag=-fc              " -f tells Vim to skip the .cshrc file for the system calls in Vim.  



"================================================================="
" ****** Colors +  GUI ********
"================================================================="
    syntax enable                     " Enables syntax highlighting 

    " Some font specific variables (see their help pages for explanations)
    let g:monokai_term_italic = 1
    let g:monokai_gui_italic  = 1

    if has("gui_running")
        " if has("gui_gtk2")
            set guifont=Hack\ 14
            " colorscheme iceberg
            colorscheme apprentice
        " endif
    else            
        " set Vim-specific sequences for RGB colors
        " let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
        " let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
        if !exists('$TMUX')
            " set termguicolors
        endif
        " colorscheme iceberg
        colorscheme apprentice
        " or if I'm in a projector, uncomment below
        " set background=light
        " colorscheme desert
    endif

    " Highlights the cursor's line  (must be set after syntax enable)
    set cursorline
"================================================================="
" ****** Mappings ***********************************************"
"================================================================="
    " Save your fingers stretching up to the ESC key!!!
    " (and put cursor where I like it)
    inoremap jk <esc>l

    " Always do very magic searches
    " nnoremap / /\v
    " nnoremap ? ?\v

    " Speed shortcut
    nnoremap : ;
    nnoremap ; :
    xnoremap ; :

    " Better scroll left and right
    nnoremap zl 20zl
    nnoremap zh 20zh


    " Stay in visual mode after indenting (so you can do it again)
    xnoremap < <gv
    xnoremap > >gv

    " I use hjkl instead of arrow keys in normal mode, so map them
    "  to commands to jump to grep results.  
    "  (From Damian Conway's Mastering Vim video on Safari.)
    nnoremap <silent> <RIGHT> :cnext<CR>
    nnoremap <silent> <RIGHT><RIGHT> :cnfile<CR><C-G>
    nnoremap <silent> <LEFT> :cprev<CR>
    nnoremap <silent> <LEFT><LEFT> :cpfile<CR><C-G>

    " Search for visually highlighted text (credit to Practical Vim, 2nd ed)
    xnoremap * :<c-u>call <SID>VSetSearch('/')<cr>/<c-r>=@/<cr><cr>
    xnoremap # :<c-u>call <SID>VSetSearch('?')<cr>/<c-r>=@/<cr><cr>
    function! s:VSetSearch(cmdtype)
        let temp = @s
        normal! gv"sy
        let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
        let @s = temp
    endfunction

    " Turn off highlighting from a previous match
    nnoremap <leader><cr> :noh<cr>

    " Remove accidentally going into Ex mode when pressing Q
    nnoremap Q <nop>

    " Yank a whole word even when cursor isn't at the beginning
    nnoremap yw yiw

    " Move by screen line rather than file line. Useful for long wrapped lines.
    "  ...but will act like regular motion if preceded by a count.
    "    (credit to https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/
    noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
    noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

    " Let gj and gk function as regular j and k now
    nnoremap gj j 
    nnoremap gk k 

    " Make Y yank everything from the cursor to the end of the line.
    " Acts more like C or D now.  By default Y acts like yy.
    nnoremap Y y$

    " Jump cursor beginning of line in command mode.  <C-B> already does this,
    " but this is to match tcsh-style.
    cnoremap <C-A> <Home>

    "******* Fix terminal problems for Del, Up, Down, Left, Right in insert mode.
    "    <c-O> in insert mode lets you a single normal command and then 
    "     return back to insert mode
    " inoremap [3~  <c-O>x
    " inoremap OA <c-O>k
    " inoremap OB <c-O>j
    " inoremap OC <c-O>l
    " inoremap OD <c-O>h

    "**** Easily EDIT and SOURCE the .vimrc file
    nnoremap <leader>sv :source $MYVIMRC<cr>
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>


    "*** MOVE a line down (hyphen) or up (underscore) 
    "      (doing it with an Ex command instead of 'ddp' prevents disturbing  the registers)
    nnoremap <silent> -- :m+1<cr>
    nnoremap <silent> __ :m-2<cr>

    "*** Also MOVE a visual selection down (hyphen) or up (underscore) 
    "      (The trick is to actually move the line preceding or following the
    "      visual selection to the other side of the visual selection.
    "      Another trick is to delete the '<,'> stuff that appears.
    xnoremap <silent> -- :<c-u>'>+1m'<-1<cr>gv
    xnoremap <silent> __ :<c-u>'<-1m'><cr>gv

    "*** Add an empty line above or below
    nnoremap <leader>O O<esc>j
    nnoremap <leader>o o<esc>k
    

    "*** Going to beginning and end of lines with H and L **********
    nnoremap H 0
    nnoremap L $
    xnoremap H 0
    xnoremap L $

    "*** Replaces my common typos at the command line
    cnoremap Q<cr> q<cr>
    cnoremap Bd<cr> bd<cr>

    "**** Jump between windows more easily
    nnoremap <c-j> <c-w>j
    nnoremap <c-k> <c-w>k
    nnoremap <c-h> <c-w>h
    nnoremap <c-l> <c-w>l
    "**** <NUL> is for unmappable characters like <c-space> in case I use a
    "       tmux keystroke <c-space>hjkl by mistake
    nnoremap <NUL>j <c-w>j
    nnoremap <NUL>k <c-w>k
    nnoremap <NUL>h <c-w>h
    nnoremap <NUL>l <c-w>l

    
    "**** Open filename under cursor in splitright
    "      this doesn't check for file existence.
    nnoremap <c-w>f :vsplit <cfile><CR>
    "**** Open filename under cursor in splitright, 
    "      but this one uses gf, which checks file existence.
    nnoremap <c-w><c-f> gf:b#<cr>:vsp #<cr>
                  
    " Open/Close the NERDTree window. 
    nnoremap <leader>q :NERDTreeToggle<CR>      

    " "**** Operating-Pending remaps ***
    " "With this:  'dp' can be used instead of 'di(' to delete inside ()
    " onoremap p i(
    " onoremap b i{

    " ********** Buffer cycling ********
    nnoremap <C-n> :bnext<CR>
    nnoremap <C-p> :bprev<CR>
    "
    " ********** Delete the current buffer  ********
    nnoremap <C-c> :bn\|bd #<CR>

    " ********** Paste mode short cuts ***********
    nnoremap <F5> :set paste<CR>
    nnoremap <F6> :set nopaste<CR>
    inoremap <F5> <C-O>:set paste<CR>
    inoremap <F6> <nop>
    set pastetoggle=<F6>                                      

    " *********** Adding signs to the margin**********
    "    Refer to vim help for more info
    sign define information text=!> texthl=Error  
    nnoremap <F7> :exe ":sign place " . line(".") . " line=" . line(".") . " name=information file="  . expand("%:p")<CR>
    nnoremap <C-F7> :sign unplace<CR>
    
    " ****Quickly get the filename under the cursor into the command line ****
    cnoremap =cf <C-R>=expand(expand("<cfile>"))<cr>

" ***** End of mappings *****************************************

"================================================================="
" ***** Autocmds ************************************************
"================================================================="

 " *****  Stuff for python *******
    " Reference:  https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven
    augroup py_filetype
        au!
        " Define folds by indentation and use space bar to toggle folds
        autocmd FileType python set foldmethod=indent
        autocmd FileType python set foldlevel=99
        autocmd FileType python nnoremap <space> za
        " Color whitespace at end of lines red.
        autocmd FileType python syn match BadWhitespace /\s\+$/
        autocmd FileType python highlight BadWhitespace ctermbg=red guibg=darkred 
        " Use F9 and F10 to execute the Python script that you're editing directly from Vim
        autocmd FileType python nnoremap <buffer> <F9>  :exec '!python'    shellescape(@%, 1)<cr>
        autocmd FileType python nnoremap <buffer> <F10> :exec '!python -i' shellescape(@%, 1)<cr>
        " change "namemain" to "if __name__ == '__main__':"
        autocmd FileType python iabbrev namemain if __name__ == '__main__':
    augroup end

  
 " *****  Stuff for tcsh *******
    autocmd BufEnter,BufNew .aliases.*  call SetFileTypeShell("tcsh") 
    autocmd BufEnter,BufNew *cshrc*  set filetype=tcsh
    autocmd FileType tcsh set includeexpr=substitute(v:fname,'{USER}','USER','g')


 " *****  Equal splits after resizing terminal.
    " autocmd VimResized * wincmd =
    
 " *****  Format options are local to buffers, so setlocal must be used
    " Do not automatically auto-wrap comments using textwidth,
    "  or automatically insert the current comment leader after "  hitting 'o' or 'O'
    autocmd FileType * setlocal formatoptions-=c formatoptions-=o
" ***** End of Autocommands *************************************


"================================================================="
" ****** FUNCTIONS *****
"================================================================="
 " ======== Diff Toggle (from www.bestofvim.com/tip/diff-diff) ======
    nnoremap <silent> <Leader>df :call DiffToggle()<CR>

    " The ! overwrites any existing definition by this name.
    function! DiffToggle()
        " Test the setting 'diff', to see if it's on or off.
        " (Any :set option can be tested with &name.
        " See :help expr-option.)
        if &diff
            diffoff
        else
            diffthis
        endif
    :endfunction


"================================================================="
    ab pl#! #!/usr/intel/pkgs/perl/5.8.0/bin/perl
    ab py#! #! /usr/intel/bin/python3.6.1
    ab sh#! #!/bin/tcsh
    iabbrev @@ christopher.b.heithoff@intel.com
" *************************
