global _main

extern _fopen
extern _fread
extern _fwrite
extern _fclose
extern _exit

section .data

inputName db "input.txt",0
outputName db "output.txt",0

readMode db "rb",0
writeMode db "wb",0

section .bss

inFile      resd 1
outFile     resd 1

buffer      resb 8192
outBuffer   resb 8192

bytesRead   resd 1

section .text

_main:

; fopen(input,"rb")
push readMode
push inputName
call _fopen
add esp,8
mov [inFile],eax

test eax,eax
jz quit

; fopen(output,"wb")
push writeMode
push outputName
call _fopen
add esp,8
mov [outFile],eax

test eax,eax
jz closeInput

; fread(buffer,1,8192,file)
push dword [inFile]
push 8192
push 1
push buffer
call _fread
add esp,16
mov [bytesRead],eax

mov esi,buffer
mov edi,outBuffer

xor ebx,ebx
xor ecx,ecx

mov edx,[bytesRead]
add edx,esi

nextChar:

cmp esi,edx
jge doneConvert

mov al,[esi]
inc esi

cmp al,'0'
je bit0

cmp al,'1'
je bit1

jmp nextChar

bit0:
shl bl,1
inc cl
jmp check

bit1:
shl bl,1
or bl,1
inc cl

check:

cmp cl,8
jne nextChar

mov [edi],bl
inc edi

xor ebx,ebx
xor ecx,ecx

jmp nextChar

doneConvert:

mov eax,edi
sub eax,outBuffer

; fwrite
push dword [outFile]
push eax
push 1
push outBuffer
call _fwrite
add esp,16

; fclose
push dword [outFile]
call _fclose
add esp,4

closeInput:
push dword [inFile]
call _fclose
add esp,4

quit:
push 0
call _exit
