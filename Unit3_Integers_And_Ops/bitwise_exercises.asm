; Base Author: Megan Avery Spring 2024
; Exercise Author: [Bobby Picasio]

; Purpose - to learn about the following:
;	- AND
;	- TEST
;	- OR
;	- XOR
;	- NOT

%include "asm_io.inc"

; initialized data
segment .data

; uninitialized data
segment .bss


segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha

	mov eax, 4
        mov ebx, 2
        test eax, ebx
        dump_regs 1

        

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


