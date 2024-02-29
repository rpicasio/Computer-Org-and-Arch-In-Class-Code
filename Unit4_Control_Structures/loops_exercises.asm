; Base Author: Megan Avery Spring 2024
; Exercise Author: [Bobby Picasio]
;
; Purpose - to learn about loops in NASM

%include "asm_io.inc"
segment .data						; initialized data

rocket db "🚀!", 0
perfect_prompt db "Enter a power of 2: ", 0
perfect db "PERFECT", 0
another_perfect_prompt db "Again! ", 0
fear_the_goat db "Fear the 🐐!", 0
reaction db "Reaction? ", 0


segment .bss						; uninitialized data


segment .text						; code
        global  asm_main
asm_main:
        enter   0,0               	; setup routine
        pusha

		; TODO: FOR EXERCISE

                mov ecx, 5

        ; for block start of the loop
        for:
               
                ; body of loop
                mov eax, ecx
                call print_int
                call print_nl

                loop for

                ;OUTSIDE OF THE LOOP

                ; print rocket ship
                mov eax, rocket
                call print_string
                call print_nl
;----------------------------------------------------------

		; TODO: WHILE EXERCISE

                mov eax, perfect_prompt
                call print_string
                call read_int

        ; while block start of the loop
        while:

                mov ebx, eax
                dec ebx
                and eax, ebx
                cmp eax, 0
                jnz endwhile            ; if missing infinite loop

                mov eax, perfect
                call print_string
                call print_nl
                ; update - if missing while loop

                ; update
                mov eax, another_perfect_prompt
                call print_string
                call read_int


                jmp while
        
        
        endwhile:

;------------------------------------------------------------------

		; TODO: DO WHILE EXERCISE
                
        ; do block
        do:

                call read_char
                mov eax, fear_the_goat
                call print_string
                call print_nl

                mov eax, reaction
                call print_string
                call read_char


                cmp eax, "!"
                jne do

;--------------------------------------------------------------------


        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret
