inoremap <F1> <nop>
noremap <F1> <nop>
noremap <F11> <ESC>:colo torte<CR>
noremap <F12> <ESC>:colo pablo_my<CR>

noremap K k
noremap J j

" syntax
syntax on
"let g:c_no_curly_error = 1
"set synmaxcol=500
"let loaded_matchparen=1

"basic configure
set nocompatible
set is
set ic
set ts=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab
set nowrap
set diffopt+=context:8
set nonu
set backspace=indent,eol,start

" backup
set nowritebackup
set nobackup

"color in putty
set t_Co=256

"ctags
set tags=tags

"cscope
if filereadable("/usr/bin/cscope")

""    set cscopetag

    cs add cscope.out

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <F5> :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <F6> :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <F4> :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

"fold
"set foldmethod=indent
"set foldmethod=marker
"set foldmarker=gcmkHEADER,gcmkFOOTER
"set foldmarker={,}
"set foldlevel=10


set scrolloff=10

" viminfo and last-position-jump
set viminfo='20,\"100,<500
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" coding mapping
noremap <F2> ^i/* <ESC>$a */<ESC>
noremap <F3> <ESC>:s/\/\*\s//g<CR>:s/\s\*\///g<CR>
noremap <F8> <ESC>f)i<CR><ESC>kf(a<CR><ESC>f,li<CR><ESC>f,li<CR><ESC>f,li<CR><ESC>f,li<CR><ESC>f,li<CR><ESC>f,li<CR><ESC>f,li<CR><ESC>f,li<CR><ESC>
"inoremap { {<CR>}<CR><ESC>kO<TAB>
"inoremap ( ()<LEFT>
"inoremap [ []<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"inoremap ; <ESC>A;

function! RemoveNextDoubleChar(char)
    let l:line=getline(".")
    let l:next_char=l:line[col(".")-1]
    let l:pair_char=a:char

    if a:char == ')'
        let l:pair_char='('
    endif
    if a:char == ']'
        let l:pair_char='['
    endif

    if l:pair_char == l:next_char
        execute "normal! l"
    else
        execute "normal! a" . a:char . ""
    endif
endfunction

"inoremap ) <ESC>:call RemoveNextDoubleChar(')')<CR>i
"inoremap ] <ESC>:call RemoveNextDoubleChar(']')<CR>i

nmap Q gq

" Set VIM runtime
set runtimepath=/home/xiaoquan.li/.vim_ff,/home/xiaoquan.li/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim72,/usr/share/vim/vim73,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after

" Fuzzy Finder
if version > 701
noremap <Leader>b :FufFile<CR>
noremap <Leader>f :FufBuffer<CR>
noremap <Leader>g :FufTag<CR>
noremap <Leader>t :FufTaggedFile<CR>
let g:fuf_previewHeight=1
let g:fuf_enumeratingLimit=20
endif

" Set color
"colorscheme torte
"colorscheme pablo
"colorscheme pablo_my
"colorscheme diablo3

"autocmd FileType c,h autocmd BufWritePre <buffer> :%s/\s\+$//e
set list listchars=tab:>-,trail:-

" clang complete
let g:clang_use_library = 1
let g:clang_library_path = "/home/xiaoquan.li"
let g:clang_complete_macros = 1
let g:clang_complete_auto = 1
let g:clang_auto_select = 1

func Eatchar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunc

" print
iabbr pk gcmkPRINT("XQ %s(%d)", __FUNCTION__, __LINE__)
iabbr pu gcmPRINT("XQ %s(%d)", __FUNCTION__, __LINE__)
iabbr pt printf("XQ %s(%d) \n", __FUNCTION__, __LINE__)

" declare
" iabbr dst gceSTATUS status
" iabbr dui gctUINT32
" iabbr duip gctUINT32_PTR
" iabbr di  gctINT

iabbr oos gcoOS_<C-R>=Eatchar('\s')<CR>
iabbr kos gckOS_<C-R>=Eatchar('\s')<CR>

map H ^
map L $

map <enter> o<ESC>
