:highlight LineNr term=NONE cterm=NONE ctermfg=LightGray ctermbg=DarkGray gui=NONE guifg=LightGray guibg=DarkGray
":highlight LineNr term=bold cterm=NONE ctermfg=LightGray ctermbg=DarkGray gui=NONE guifg=LightGray guibg=DarkGray
:highlight Normal term=NONE cterm=NONE ctermfg=LightGray ctermbg=DarkGray gui=NONE guifg=LightGray guibg=DarkGray
":highlight Normal term=bold cterm=NONE ctermfg=LightGray ctermbg=DarkGray gui=NONE guifg=LightGray guibg=DarkGray


""""""""""""""""""""""""""""""""""""""""
" 코딩 가이드라인 준수를 위한 vim 설정 "
""""""""""""""""""""""""""""""""""""""""
set colorcolumn=80 " 80컬럼에 붉은 줄을 표시한다. 붉은 줄을 넘기지 않도록 코딩하자.
"colorscheme desert " vi color theme

autocmd BufWritePre * mark a " 편집하던 위치 북마크.
autocmd BufWritePre * :%s/\s\+$//e " trailing whitespace 자동 제거.
autocmd BufWritePre * $put _ | $;?\(^\s*$\)\@!?+1,$d " 파일의 끝부분 빈줄 자동 제거.
autocmd BufWritePre * 0put _ | 0,0;/\(^\s*$\)\@!/-1d " 파일의 앞부분 빈줄 자동 제거.
autocmd BufWritePre * 'a " 편집하던 위치로 이동.

set autoindent " 자동으로 들여쓰기를 한다.
set cindent " C 프로그래밍을 할 때 자동으로 들여쓰기를 한다.
set smartindent " 좀 더 똑똑한 들여쓰기를 위한 옵션이다.

" set paste가 설정되어 있으면 자동 들여쓰기가 안된다.
" set paste가 설정되어 있지 않으면 vim 에서 붙여넣기 할 때 매 라인들이 들여쓰기가 된다.
" 따라서 set paste를 toggle할 수 있도록 <F4>키를 설정한다.
set pastetoggle=<F4> " set paste toggle 기능에 <F4>키를 설정한다.

set tabstop=4 " 탭을 눌렀을 때 8칸 대신 4칸 이동하도록 한다.
set shiftwidth=4 " 자동 들여쓰기를 할 때 4칸 들여쓰도록 한다.
set expandtab " 탭을 공백으로 변환한다. 만일 Makefile 등에서 탭이 필요한 경우에는 :se noet

" 이렇게 설정했는데도 불구하고 탭이 있다면 붉은색으로 경고한다.
"match ErrorMsg '	' " 이렇게 설정했는데도 불구하고 탭이 있다면 붉은색으로 경고한다.

" Makefile 등 의도한 탭이 아니라면 탭을 스페이스로 바꾸자.
" 콤마(,)와 <TAB>을 순서대로 누르면 탭을 스페이스로 변경.
map ,<TAB> :%s/	/    /g<CR>

" Tab과 Shift-Tab으로 라인주석 추가/삭제.
map <Tab> <ESC>I//<ESC>:nohl<CR>j0
map <S-Tab> <ESC>:s/\/\//<ESC>:nohl<CR>k0

" 현재 편집중인 파일 전체를 대상으로 들여쓰기를 정리한다.
"map <F9> <ESC>:mark i<CR>G=gg<CR>'i:w<CR>
map <F9> <ESC>:mark i<CR>ggVG=<ESC>'i<CR>

map ,m <ESC>:mark `<CR>
map 8 <ESC>N<ESC>dd<ESC>n<ESC>dd<ESC>k

set wrap " 자동으로 줄바꿈을 삽입하여 다음 줄로 넘어간다.
set nocompatible " vi 오리지널과 호환하는 모드를 사용하지 않음. (vim 확장)
set backspace=indent,eol,start " BS로 라인끝과 처음 자동들여쓰기한 부분을 지날 수 있음.
set nowrapscan " 검색할 때 문서의 끝에서 다시 처음으로 돌아가지 않는다.
set nobackup " 백업 파일을 만들지 않는다.
set visualbell " 키를 잘못눌렀을 때 삑 소리를 내는 대신 번쩍이게 한다.
set nu " show line number
set background=dark
set hlsearch
set history=1000 " 편집기록을 1000개까지 기억.
set showmatch " 매치되는 괄호의 반대쪽을 보여줌.
set autowrite " :next나 :make 같은 명령을 입력하면 자동으로 저장.
set title " 타이틀바에 현재 편집중인 파일을 표시.
set mousehide " Hide the mouse pointer when typing text.
set list " Show whitespace.
set listchars=tab:>-,trail:. " Show tab as >-.

set ruler " 화면 우측 하단에 현재 커서의 위치(줄,칸)를 보여준다.
set ls=2 " 항상 status 라인을 표시하도록 함.
set statusline=%<%F%h%m%r%h%w%y\ %{strftime(\"%Y/%m/%d-%H:%M\")}%=\ col:%c%V\ ascii:%b\ pos:%o\ lin:%l\,%L\ %P
set laststatus=2
set wmnu " Tab 자동 완성시 가능한 목록을 보여줌.

set sm " 함수 닫기 표시.
set fdl=1 " 폴더설정이 되어있는 파일을 열었을 때, 폴더 레벨을 설정한다. 기본값은 0이고 모두 폴딩된다.
"set fdc=3 " 소스파일이 폴딩되어 있을 때 폴딩범위를 보여주는 컬럼의 수를 설정한다.


" 영역이 지정된 상태에서 Tab과 Shift-Tab으로 들여쓰기/내어쓰기를 할 수 있도록 함.
vmap <Tab> >gv
vmap <S-Tab> <gv

" 문법 강조 기능을 사용한다.
if has("syntax")
    syntax on " Default to no syntax highlightning
endif


" Vundle Setting
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
"required!
Bundle 'gmarik/vundle'

"My Bundles here:
Bundle 'https://github.com/vim-scripts/taglist.vim.git'
Bundle 'https://github.com/vim-scripts/The-NERD-tree.git'
"Bundle 'https://github.com/vim-scripts/Source-Explorer-srcexpl.vim.git'
"Bundle 'https://github.com/vim-scripts/trinity.vim.git'
Bundle 'https://github.com/wesleyche/SrcExpl.git'
Bundle 'https://github.com/wesleyche/Trinity.git'
Bundle 'https://github.com/vim-scripts/gtags.vim.git'
Bundle 'https://github.com/thinca/vim-logcat.git'
Bundle 'https://github.com/Valloric/YouCompleteMe.git'
Bundle 'Conque-Shell'
"Bundle 'vim-logcat'
Bundle 'DoxygenToolkit.vim'

nmap ,x :Dox<CR>
nmap ,a :<ESC>A<SPACE>/**<<SPACE><SPACE>*/<ESC>hhi

nmap ,, :<ESC>O//%
nmap ,. :<ESC>O##%

nmap ,cb :ConqueTermSplit bash<CR><CR>
nmap ,vb :ConqueTermVSplit bash<CR><CR>

nmap ,sp :sp<CR><C-j>
nmap ,vp :vsp<CR><C-l>
nmap ,ls :vsp<CR><C-l>:e.<CR>


filetype plugin indent on "required!
"
"Brief help
":BundleList          - list configured bundles
":BundleInstall(!)    - install(update) bundles
":BundleSearch(!) foo - search(or refresh cache first) for foo
":BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
"see :h vundle for more details or wiki for FAQ
"NOTE: comments after Bundle command are not allowed..

"========== srcexpl.vim setting ==========
"
" // Set the height of Source Explorer window
let g:SrcExpl_winHeight = 8

" // set 100 ms for refreshing the Source Explorer
let g:SrcExpl_refreshTime = 100

" // Set "Enter" key to jump into the exact definition context
let g:SrcExpl_jumpKey = "<ENTER>"

" // Set "Space" key for back from the definition context
let g:SrcExpl_gobackKey = "<SPACE>"

" // In order to Avoid conflicts, the Source Explorer should know what plugins
" // are using buffers. And you need add their bufname into the list below
" // according to the command ":buffers!"
let g:SrcExpl_pluginList = [
            \ "__Tag_List__",
            \ "_NERD_tree_",
            \ "Source_Explorer"
            \ ]

" // Enable/Disable the local definition searching, and note that this is not
" // guaranteed to work, the Source Explorer doesn't check the syntax for now.
" // It only searches for a match with the keyword according to command 'gd'
let g:SrcExpl_searchLocalDef = 1

" // Do not let the Source Explorer update the tags file when opening
let g:SrcExpl_isUpdateTags = 0

" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to
" // create/update a tags file
let g:SrcExpl_updateTagsCmd = "ctags -B -F -R . --exclude='^out'"
"let g:SrcExpl_updateTagsCmd = "ctags --langmap=C++:.inc --c++-kinds=+p --fields=+iaS --extra=+q --sort=foldcase -R ."

" // Set "<F12>" key for updating the tags file artificially
"let g:SrcExpl_updateTagsKey = "<F12>"

let NERDTreeWinPos='right'

"========= key mapping ==========

map <Insert> :r! sed -n
map <ESC><ESC><ESC> :q!<CR>
map <F2> v]}zf
map <F3> zo

"map <F5> :Tlist<CR><C-W><C-W>
map <F5> :Tlist<CR>
map <F6> :NERDTreeToggle<CR>
map <F7> :SrcExplToggle<CR>

"Open and close all the three plugins on the same time
map <F8> :TrinityToggleAll<CR>
"Open and close the taglist.vim separately
map <C-F5> :TrinityToggleTagList<CR>
"Open and close the NERD_Tree.vim separately
map <C-F6> :TrinityToggleNERDTree<CR>
"Open and close the srcexpl.vim separately
map <C-F7> :TrinityToggleSourceExplorer<CR>
"Close all windows
map <C-F8> :q<CR>:q<CR>:q<CR>:q<CR>

"Auto reindent the entire document
map <F9> <ESC>:mark i<CR>G=gg<CR>'i:w<CR>


map <PageUp> <C-U><C-U>
map <PageDown> <C-D><C-D>

nmap <C-Left> <C-W><<C-W><<C-W><<C-W><
nmap <S-Left> <C-W><

nmap <C-Right> <C-W>><C-W>><C-W>><C-W>>
nmap <S-Right> <C-W>>
nmap <A-Right> <C-W>\|

nmap <C-Up> <C-W>+<C-W>+<C-W>+<C-W>+
nmap <S-Up> <C-W>+
nmap <A-Up> <C-W>_

nmap <C-Down> <C-W>-<C-W>-<C-W>-<C-W>-
nmap <S-Down> <C-W>-

nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l


"========= gtags setting ========
nmap <C-g> :Gtags
"nmap <C-i> :Gtags -f %<CR>
nmap <C-\> :GtagsCursor<CR>
nmap <C-n> :cn<CR>
nmap <C-p> :cp<CR>
nmap <C-Q> :cclose<CR>

map === <ESC>ggVG=


"========= ctags setting ========
"Upon vim open a file buffer, CWD is switched to the position of the current
"file
"autocmd BufEnter * silent! lcd %:p:h:gs/ /\\/

"set tags=./tags;/.
" ctags
"set complete " 계속하려면 엔터 혹은 명령을 입력하십시오, complete=.,w,b,u,t,i 출력 오류!!
"set tagbsearch
" Vim will look for tags file everywhere starting from the current directory up to the root
set tags=tags;/

" Vim will look for cscope.out file everywhere starting from the current directory up to the root
" http://vim.wikia.com/wiki/Autoloading_Cscope_Database
function! LoadCscope()
    exe "silent cs reset"
    let db = findfile("cscope.out", ".;")
    if (!empty(db))
        let path = strpart(db, 0, match(db, "/cscope.out$"))
        set nocscopeverbose " suppress 'duplicate connection' error
        exe "cs add " . db . " " . path
        set cscopeverbose
    endif
endfunction
call LoadCscope()
au BufEnter /* call LoadCscope()


if version >= 500

    func! Sts()
        let st = expand("<cword>")
        exe "sts ".st
    endfunc
    nmap ,st :call Sts()<CR>

    func! Tj()
        let st = expand("<cword>")
        exe "tj ".st
    endfunc
    nmap ,tj :call Tj()<CR>

    func! Vtj()
        let st = expand("<cword>")
        exe "vs"
    endfunc
    nmap ,tt :call Vtj()<cr><C-l>:call Tj()<cr>

    func! Tn()
        exe "tn"
    endfunc
    nmap ,tn :call Tn()<CR>

    func! Tp()
        exe "tp"
    endfunc
    nmap ,tp :call Tp()<CR>

    func! Tr()
        exe "tr"
    endfunc
    nmap ,tr :call Tr()<CR>

    func! Tl()
        exe "tl"
    endfunc
    nmap ,tl :call Tl()<CR>

endif

"======== cscope setting ========
" for ubuntu
"set csprg=/usr/bin/cscope
" for macosx
set csprg=/usr/bin/cscope " cscope location
set csto=0 " cscope DB search first
set cst " cscope DB tag DB search
set nocsverb " verbose off

func! CscopeShow()
    exe "cs show"
endfunc
nmap ,w :call CscopeShow()<CR>

func! CscopeHelp()
    exe "cs help"
endfunc
nmap ,h :call CscopeHelp()<CR>

" calls: find all calls to the function name under cursor
"       c: 이 함수를 부르는 함수들 찾기
func! CscopeCaller()
    let csc = expand("<cword>")
    "new
    exe "cs find c ".csc
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap ,c :call CscopeCaller()<CR>

" called: find functions that function under cursor calls
"       d: 이 함수에 의해 불려지는 함수들 찾기
func! CscopeCalled()
    let csd = expand("<cword>")
    "new
    exe "cs find d ".csd
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap ,d :call CscopeCalled()<CR>

" egrep: egrep search for the word under cursor
"       e: 이 egrep 패턴 찾기
func! CscopeEgrep()
    let cse = expand("<cword>")
    "new
    exe "cs find e ".cse
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap ,e :call CscopeEgrep()<CR>

" file: open the filename under cursor
"       f: 이 파일 찾기
func! CscopeFile()
    let csf = expand("<cword>")
    "new
    exe "cs find f ".csf
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap ,f :call CscopeFile()<CR>

" global: find global definition(s) of the token under cursor
"       g: 이 정의 찾기
func! CscopeGlobal()
    let csg = expand("<cword>")
    "new
    exe "cs find g ".csg
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap ,g :call CscopeGlobal()<CR>

" includes: find files that include the filename under cursor
"       i: 이 파일을 포함하는 파일들 찾기
func! CscopeIncludes()
    let csi = expand("<cword>")
    "new
    exe "cs find i ".csi
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap ,i :call CscopeIncludes()<CR>

" symbol: find all references to the token under cursor
"       s: 이 C 심볼 찾기
func! CscopeSymbol()
    let css = expand("<cword>")
    "new
    exe "cs find s ".css
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap ,s :call CscopeSymbol()<CR>

" text: find all instances of the text under cursor
"       t: Find assignments to
func! CscopeText()
    let cst = expand("<cword>")
    "new
    exe "cs find t ".cst
    if getline(1) == " "
        exe "q!"
    endif
endfunc
nmap ,t :call CscopeText()<CR>


Bundle 'a.vim'
" Ctrl+s는 소스파일과 헤더파일 전환
map <F10> <ESC>:A<CR>

"map <C-I> <ESC>0i//<ESC>j:w<CR>
"map <C-N> <ESC>k0xx:w<CR>

"map = <ESC>/JOIN<CR>DJ
"map <C-F1> <ESC>ggVG"+y
"map <C-F2> <ESC>ggVG"+gP


"""""""""" source ./mswin.vim
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
"map <C-V>     "+gP
map <S-Insert>    "+gP

"cmap <C-V>    <C-R>+
cmap <S-Insert>   <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

"exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
"exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

"imap <S-Insert>   <C-V>
"vmap <S-Insert>   <C-V>

" Use CTRL-Q to do what CTRL-V used to do
"noremap <C-Q>     <C-V>

"""""""""" source ./paste.vim
" Vim support file to help with paste mappings and menus
" Maintainer:   Bram Moolenaar <Bram@vim.org>
" Last Change:  2006 Jun 23

" Define the string to use for items that are present both in Edit, Popup and
" Toolbar menu.  Also used in mswin.vim and macmap.vim.

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.  Add to that some tricks to leave the cursor in
" the right position, also for "gi".
if has("virtualedit")
    let paste#paste_cmd = {'n': ":call paste#Paste()<CR>"}
    let paste#paste_cmd['v'] = '"-c<Esc>' . paste#paste_cmd['n']
    let paste#paste_cmd['i'] = 'x<BS><Esc>' . paste#paste_cmd['n'] . 'gi'

    func! paste#Paste()
        let ove = &ve
        set ve=all
        normal! `^
        if @+ != ''
            normal! "+gP
        endif
        let c = col(".")
        normal! i
        if col(".") < c " compensate for i<ESC> moving the cursor left
            normal! l
        endif
        let &ve = ove
    endfunc
else
    let paste#paste_cmd = {'n': "\"=@+.'xy'<CR>gPFx\"_2x"}
    let paste#paste_cmd['v'] = '"-c<Esc>gix<Esc>' . paste#paste_cmd['n'] . '"_x'
    let paste#paste_cmd['i'] = 'x<Esc>' . paste#paste_cmd['n'] . '"_s'
endi

fu! Num2Bin(var)
    let num=printf("%u", a:var)
    let bin=""
    let pos=0
    while num > 0 || pos % 4 != 0
        if 0 == pos % 4 && 0 != pos | let bin = "," . bin | endif
        let bin = num % 2 . bin
        let num = num / 2
        let pos += 1
    endwh
    if bin == ""
        let bin = "0000"
        let pos = 4
    endif
    return bin . " (" . pos . ")"
endfu

fu! CheckSymbol(var1)
    echo
    let sym = a:var1
    let config = findfile(".config", ".;")
    if sym =~ '^CONFIG_'
        let hit = 0
        for line in readfile(config, '')
            if line =~ sym . '\(=\| is\)'
                echo line
                let hit += 1
            endif
        endfor
        if hit == 0 | echo "# " . sym . " not found" | endif
    else
        if sym =~? '^\(0x\|#\|=\)\?[0-9a-f]\+$'
            if sym =~ '^\(=\|#\)' | let sym = sym[1:] | endif
            let s = sym
            let unit = ['B', 'K', 'M', 'G', 'T', 'P', 'E', 'Z']
            let cnt = 0
            while s >= 1024 && (s % 1024) == 0
                let s = s / 1024
                let cnt += 1
            endwh
            if s == sym
                echo printf("D:%u H:0x%x B:%s", sym, sym, Num2Bin(sym))
            else
                echo printf("D:%u (%u%s) H:0x%x B:%s", sym, s, unit[cnt], sym, Num2Bin(sym))
            endif
        endif
    endif
endfu

nmap <C-c> :call CheckSymbol(expand("<cword>"))<CR>

"au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
vmap ,p !xmllint --format --recover -<CR>

"Doxygen Toolkit Settings
"let g:DoxygenToolkit_commentType = "C++"
"let g:DoxygenToolkit_briefTag_pre = "@Synopsis  "
let g:DoxygenToolkit_paramTag_pre = "@param [in]   "
let g:DoxygenToolkit_returnTag    = "@retval  "
"let g:DoxygenToolkit_blockHeader = "--------------------------------------------------"
"let g:DoxygenToolkit_blockFooter = "--------------------------------------------------"
"let g:DoxygenToolkit_startCommentTag   = "/** "
"let g:DoxygenToolkit_startCommentBlock = "/* "
"let g:DoxygenToolkit_interCommentTag   = "* "
"let g:DoxygenToolkit_interCommentBlock = "* "
"let g:DoxygenToolkit_endCommentTag     = "*/"
"let g:DoxygenToolkit_endCommentBlock   = "*/"

let g:DoxygenToolkit_authorName = "KiHwan Lee"

let s:licenseTag = "Copyright (C) \<enter>\<enter>"
let s:licenseTag = s:licenseTag . "This program is free software; you can\<enter>"
let s:licenseTag = s:licenseTag . "redistribute it and/or modify it under\<enter>"
let s:licenseTag = s:licenseTag . "the terms of the GNU General Public License\<enter>"
let s:licenseTag = s:licenseTag . "as published by the FSF.\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag


" Linux symbol checker 0.53
" ====================================================
" 'C-c' : Display hexadecimal and binary values
"         Check current kernel configuration (.config)
" '\'   : C-style calculator
"         ex) 0x1234 & ((1 << 12) -1)
" =================== GIT features ===================
" 'C-g' : git blame (support visual block)
" 'gl'  : git log
" 'gL'  : git full logs
" 'ga'  : git show changed file (='<return>')
" 'gA'  : git show all changed files
" ']]'  : find next
" '[['  : find previous
" 'q'   : quit log
" ===================== OPTIONS =====================
" let g:git_window = [vert, hori(default), none]
" let g:git_resize = [vert, hori, both(default), none]
" let g:git_merges = [0, 1(default)]

let s:nibble = ["0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"]

if exists("*or")
    let s:bitfunc = ["invert", "and", "xor", "or"]
else
    let s:bitfunc = ["Invert", "And", "Xor", "Or"]
endif

if !exists('g:git_window') | let g:git_window = "hori" | endif
if !exists('g:git_resize') | let g:git_resize = "both" | endif
if !exists('g:git_merges') | let g:git_merges = 1 | endif

fu! Bitwise(var1, var2, one, two)
    let b1 = Num2Bin(a:var1)
    let b2 = Num2Bin(a:var2)
    let p1 = strlen(b1) - 1
    let p2 = strlen(b2) - 1
    let result = ""
    while p1 >= 0 || p2 >= 0
        let bit = strpart(b1, p1, 1) + strpart(b2, p2, 1)
        if bit == 0
            let result = "0" . result
        elseif bit == 1
            let result = a:one . result
        elseif bit == 2
            let result = a:two . result
        endif
        let p1 -= 1
        let p2 -= 1
    endw
    return Bin2Num(" " . result . " ")
endfu

fu! Invert(var)
    return Bitwise(a:var, 0xffffffff, 1, 0)
endfu

fu! And(var1, var2)
    return Bitwise(a:var1, a:var2, 0, 1)
endfu

fu! Xor(var1, var2)
    return Bitwise(a:var1, a:var2, 1, 0)
endfu

fu! Or(var1, var2)
    return Bitwise(a:var1, a:var2, 1, 1)
endfu

fu! Bin2Num(bin)
    let i = 0
    let num = 0
    let len = strlen(a:bin)
    while i < len
        let c = strpart(a:bin,i,1)
        let i += 1
        if c !~ '[01]' | continue | endif
        let num = num * 2 + c
    endw
    return printf("%u",num)
endfu

fu! Num2Bin(var)
    let num = printf("%x", a:var)
    let bin = ""
    let pos = 0
    let len = strlen(num)
    while pos < len
        let bin = s:nibble[str2nr(num[-1:],16)] . bin
        let num = num[0:-2]
        let pos += 1
    endw
    return bin
endfu

fu! Commas(var, nr)
    let result = ""
    let str = a:var
    let i = strlen(str) - a:nr
    let result = strpart(str,i)
    while i > 0
        let i -= a:nr
        let result = strpart(str,i,a:nr) . "," . result
    endw
    return result
endfu

fu! BinFmt(var)
    let b = Num2Bin(a:var)
    return Commas(b,4) . " (" . strlen(b) . ")"
endfu

fu! Shl(var,n)
    let s = Num2Bin(a:var)
    for i in range(a:n)
        let s .= "0"
    endfo
    return Bin2Num(s)
endfu

fu! Shr(var,n)
    let s = Num2Bin(a:var)
    for i in range(a:n)
        let s = s[0:-2]
    endfo
    return Bin2Num(s)
endfu

fu! NumFmt(sym)
    let unit = ['B', 'K', 'M', 'G', 'T', 'P', 'E', 'Z']
    let cnt = 0
    let sym = printf("%u",a:sym)
    let s = Num2Bin(sym)

    while (s[-10:] =~ '0\{10}') && strlen(s) > 0
        let s = s[0:-11]
        let cnt += 1
    endw
    if cnt == 0
        let units = ""
    else
        let units = printf("(%u%s) ", Bin2Num(s), unit[cnt])
    endif
    return printf("D:%s %sH:0x%x B:%s", Commas(sym,3), units, sym, BinFmt(sym))
endfu

fu! CheckSymbol(var)
    let sym = a:var
    if sym =~# '^CONFIG_'
        let config = findfile(".config", ".;")
        if config != ""
            let hit = 0
            for line in readfile(config, '')
                if line =~# sym . '[= ]'
                    echo line
                    let hit += 1
                    break
                endif
            endfo
            if hit == 0 | echo "# " . sym . " not found" | endif
        else
            echo "config file not found"
        endif
    else
        if sym =~? '^\(#\|=\)\?\([0-9]\+\|0x[0-9a-f]\+\)$'
            if sym =~ '^\(=\|#\)' | let sym = sym[1:] | endif
            echo NumFmt(sym)
        endif
    endif
endfu

fu! SplitExp(exp)
    let n = 0
    let spc = 0
    let max = strlen(a:exp)
    let sign = 0
    let last = 0
    let token = []
    while n < max
        if strpart(a:exp,n,1) == " "
            let sign = 1
            let spc = 1
        elseif strpart(a:exp,n,1) =~ '[+\-*/%()^&|~]'
            let sign = 1
        elseif strpart(a:exp,n,2) =~ '\(0b\|<<\|>>\)'
            let sign = 2
        endif

        if sign > 0
            if last != n
                call add(token, strpart(a:exp,last,n-last))
            endif
            if spc == 0
                call add(token, strpart(a:exp,n,sign))
            else
                let spc = 0
            endif
            let n += sign
            let last = n
            let sign = 0
        else
            let n += 1
        endif
    endw
    if last != n
        call add(token, strpart(a:exp, last, n-last))
    endif
    return token
endfu

fu! MatchParen(str, pos)
    let pos = a:pos
    if a:str[pos] == ')'
        let depth = 1
        let n = -1
    elseif a:str[pos] == '('
        let depth = 1
        let n = 1
    endif
    while depth > 0
        let pos += n
        if a:str[pos] == '('
            let depth += n
        elseif a:str[pos] == ')'
            let depth -= n
        endif
    endw
    return pos

endfu

fu! Exp2Func(tok, pat, func, argc)
    let str = a:tok
    if len(a:pat) <= 1
        let regex = a:pat[0]
    else
        let regex = '\(' . substitute(join(a:pat), ' ', '\\|', 'g') . '\)'
    endif

    while match(str, regex) != -1

        let pos = match(str, regex)
        for i in range(len(a:pat))
            if str[pos] =~ '^' . a:pat[i] . '$'
                let func = a:func[i]
                let argc = a:argc[i]
                break
            endif
        endfor

        if a:argc[i] >= 2
            let beg = pos - 1
            if str[beg] == ')'
                let beg = MatchParen(str, beg)
            endif
            if str[beg-1] =~ '\w' && beg > 0
                let beg -= 1
            endif
            let str[pos] = ','
            call insert(str, func, beg)
            let beg += 1
            let pos += 1
        else
            let beg = pos + 1
            let str[pos] = func
        endif

        let end = pos + 1
        if str[end] =~ '\w' && end + 1 < len(str)
            let end += 1
        endif
        if str[end] == '('
            let end = MatchParen(str, end)
        endif
        if end+1 < len(str)
            call insert(str, ')', end)
        else
            call add(str, ')')
        endif

        call insert(str, '(', beg)
    endw
    return str
endfu

fu! Calc(var)
    if a:var != ""
        let exp = SplitExp(a:var)
        let exp = Exp2Func(exp, ['0b'], ['Bin2Num'], [1])
        let i = 0
        while i < len(exp) - 3
            if exp[i] == "Bin2Num" && exp[i+1] == "("
                if exp[i+2] =~ '^0\+'
                    let exp[i+2] = substitute(exp[i+2],'^0\+','','g')
                endif
                call insert(exp,'"',i+3)
                call insert(exp,'"',i+2)
                let i += 2
            endif
            let i += 1
        endw
        let exp = Exp2Func(exp, ['\~'], [s:bitfunc[0]], [1])
        let exp = Exp2Func(exp, ['<<', '>>'], ['Shl', 'Shr'], [2, 2])
        let exp = Exp2Func(exp, ['&'], [s:bitfunc[1]], [2])
        let exp = Exp2Func(exp, ['\^'], [s:bitfunc[2]], [2])
        let exp = Exp2Func(exp, ['|'], [s:bitfunc[3]], [2])
        echohl MoreMsg
        echo " = " . NumFmt(eval(join(exp)))
        echohl None
    endif
endfu

fu! GitNewWindow()
    if exists('b:file')
        let l:path = b:path
        let l:file = b:file
    else
        if empty(expand("%:t"))
            return -1
        endif
        let l:path = expand("%:p:h")
        let l:file = expand("%:t")
    endif

    if g:git_window == "none"
        enew
    elseif g:git_window == "vert"
        vert bot new
    else
        bot new
    endif

    if g:git_resize == "none"

    elseif g:git_resize == "vert"
        vert res
    elseif g:git_resize == "hori"
        res
    else
        vert res | res
    endif

    setl buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap
    let b:path = l:path
    let b:file = l:file
    setl incsearch
    return 0
endfu

fu! GitExec(cmd)
    if has("win32")
        lcd `=b:path`
        let l:cmd_cd = ""
    else
        let l:cmd_cd = "cd \"" . b:path . "\";"
    endif

    silent! execute "0read ! " . l:cmd_cd . a:cmd
    setl noma | 1
endfu

fu! GitBlame() range
    let l:line = line(".")
    if GitNewWindow() < 0
        echo "File not found"
        return
    endif

    if a:firstline == a:lastline
        call GitExec('git blame ' . b:file)
        execute l:line
    else
        call GitExec('git blame -L ' . a:firstline .','. a:lastline .' '. b:file)
    endif
    setl cursorline
    map <silent> <buffer> ]] :call FindHash(1)<CR>
    map <silent> <buffer> [[ :call FindHash(-1)<CR>
    map <silent> <buffer> <CR> :call GitLog(GetHash())<CR>
    map <silent> <buffer> q :close<CR>
endfu

fu! ValidHash(hash)
    if empty("a:hash")
        echo "Hash not found"
        return -1
    elseif a:hash =~? '[^0-9a-f]' || strlen(a:hash) > 40 || strlen(a:hash) < 4
        echo "Invalid hash : " . a:hash
        return -2
    endif
    return 0
endfu

fu! GetHash()
    let l:hash = expand("<cword>")
    if l:hash == "commit"
        let l:pos=getpos('.')
        normal w
        let l:hash = expand("<cword>")
        call setpos('.', l:pos)
    endif
    return l:hash
endfu

fu! FindHash(step)
    normal g0
    let l:hash = expand("<cword>")
    let l:line = line(".") + a:step
    execute l:line
    while l:hash == expand("<cword>") && l:line > 0 && l:line <= line("$")
        let l:line += a:step
        execute l:line
    endwh
endfu

fu! GitLog(hash)
    if ValidHash(a:hash) < 0  | return | endif
    if GitNewWindow() < 0 | return | endif
    call GitExec('git show -s ' . a:hash)
    setl syntax=git
    map <silent> <buffer> ]] :call search("^commit ")<CR>
    map <silent> <buffer> [[ :call search("^commit ","b")<CR>
    map <silent> <buffer> <CR> :call GitShow(GetHash(),1)<CR>
    map <silent> <buffer> q :close<CR>
endfu

fu! GitFullLog()
    if exists('g:git_merges') && g:git_merges == 0
        let l:opts = ' --no-merges '
    else
        let l:opts = ''
    endif
    if GitNewWindow() < 0 | return | endif
    call GitExec('git log ' . l:opts . b:file)
    setl syntax=git
    map <silent> <buffer> ]] :call search("^commit ")<CR>
    map <silent> <buffer> [[ :call search("^commit ","b")<CR>
    map <silent> <buffer> <CR> :call GitShow(GetHash(),1)<CR>
    map <silent> <buffer> q :close<CR>
endfu

fu! GitShow(hash, isFile)
    if ValidHash(a:hash) < 0  | return | endif
    if !exists('g:git_merges') || g:git_merges != 0
        let l:opts = ' -m '
    else
        let l:opts = ''
    endif
    if GitNewWindow() < 0 | return | endif

    if a:isFile != 0
        let l:opts .= b:file
    else
    endif

    call GitExec('git show --format=oneline -p ' . a:hash . ' ' . l:opts)
    setl syntax=diff
    map <silent> <buffer> ]] :call search("^diff ")<CR>
    map <silent> <buffer> [[ :call search("^diff ","b")<CR>
    map <silent> <buffer> q :close<CR>
endfu

nmap <silent> \ :call Calc(input("Calculate: "))<CR>
nmap <silent> <C-c> :call CheckSymbol(expand("<cword>"))<CR>
map <silent> <C-g> :call GitBlame()<CR>
map <silent> gl :call GitLog(GetHash())<CR>
map <silent> gL :call GitFullLog()<CR>
map <silent> ga :call GitShow(GetHash(),1)<CR>
map <silent> gA :call GitShow(GetHash(),0)<CR>

map ,, :%s/cores/kernel/gc<CR>

map <C-p> :%w !lp<CR><CR>


let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>'
