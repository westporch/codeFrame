"                _      ______                            
"               | |    |  ____|                           
"   ___ ___   __| | ___| |__ _ __ __ _ _ __ ___   ___ 
"  / __/ _ \ / _` |/ _ \  __| '__/ _` | '_ ` _ \ / _ \   
" | (_| (_) | (_| |  __/ |  | | | (_| | | | | | |  __/ 
"  \___\___/ \__,_|\___|_|  |_|  \__,_|_| |_| |_|\___|	v1.0
"
" CodeFrame is a vim plugin that makes the skeleton of programming languages. 
" Copyright (C) 2016  Hyun-gwan Seo <westporch@gmail.com>.
" 
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
" GNU General Public License for more details.

" You should have received a copy of the GNU General Public License along
" with this program; if not, write to the Free Software Foundation, Inc.,
" 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

let g:file_size = getfsize(expand(@%))                                                     
let g:file_type = expand('%:e')

function Set_cursor_position()
    call cursor(line('.')+1, 1)
endfunction

if file_size <= 0

    if file_type == "c" 
		"silent를 입력해야 Press ENTER or type command to continue 메시지가 출력되지 않음.
		"r을 입력하면 현재 커서의 아래에 결과를 출력함. 0r은 현재 커서의 위에 결과를 출력함.
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/c.txt
    	call search('{', "b")
        call Set_cursor_position() 
    elseif file_type == "cpp"
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/c++.txt
    	call search('{', "b")
        call Set_cursor_position() 
    elseif file_type == "java"
        let java_file_name = expand('%:t')
python << EOF
import vim 
import os
name = vim.eval("java_file_name")
target = open(os.path.expanduser('~/.vim/plugin/codeFrame/Languages/java.txt'), 'w')
target.write("public class %s\n" %(os.path.splitext(name)[0]))
target.write("{\n")
target.write("\tpublic static void main(String[] args)\n")
target.write("\t{\n")
target.write("\n\t}\n")
target.write("}\n")
target.close()
EOF
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/java.txt
    	call search('{', "b")
        call Set_cursor_position() 
    elseif file_type == "php"
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/php.txt
        call search('<', "b")
        call Set_cursor_position() 

    elseif file_type == "py"
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/python.txt
        call Set_cursor_position() 
    elseif file_type == "pl"
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/perl.txt
        call Set_cursor_position() 
    elseif file_type == "rb"
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/ruby.txt
        call Set_cursor_position() 
    elseif file_type == "html"
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/html.txt
        call search('<body>', "b")
        call Set_cursor_position() 
    elseif file_type == "sh"
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/bash.txt
        call Set_cursor_position() 
    elseif file_type == "md"
        silent 0r !cat ~/.vim/plugin/codeFrame/Languages/markdown.txt
        call Set_cursor_position()
    endif

endif               
