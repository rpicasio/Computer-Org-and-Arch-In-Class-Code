; Base Author: Megan Avery Spring 2024
; Exercise Author: [YOUR NAME HERE]
; 
; Purpose - to learn about the following:
;	-  directives (dx, resx, & times)
;	- printing ints and characters
;	- dumping memory
;	- printing strings
;	- reading chars and ints

%include "asm_io.inc" ; directive

age equ 30            ; symbol
%define fav_number 34 ; macro

; initialized data
segment .data

fav_color db "purple 💜", 0 ; string
least_fav_color db "yellow 💛", 0 ; string
letter db "A" ; character
number dd 95 ; integer
first dd 66 ; first letter of my name
nice_string db "Hello World!", 0 ; string
char_prompt db "Enter a character: ", 0 ; entering an character
number_prompt db "Enter a number: ", 0 ; entering an integer

many_numbers times 5 dd "T"

many_chars times 5 db "Z"



; uninitialized data
segment .bss

space_for_number resd 1 ; space for 1 integer
space_for_char resb 1



segment .text
        global  asm_main
asm_main:
        enter   0,0               ; setup routine
        pusha


      ;  move dword [number], 116
      ;  mov eax, [number]
      ; dump_regs 1

      ;  call print_int
      ;  call print_nl

      ;  mov al, [letter]
      ;  call print_char

      ;  mov eax, [first]
      ;  call print_int
      ;  call print_nl
      ;  call print_char

      ;  dump_mem 1, fav_color, 2

      ;  mov eax, fav_color + 3
      ;  call print_string

      ;  mov eax, least_fav_color
      ;  call print_string

      ;  mov eax, nice_string
      ;  call print_nl
      ;  call print_string
      ;  call print_nl
      ;  dump_mem 1, nice_string, 0

      ;  mov eax, char_prompt
      ;  call print_string
      ;  call read_char
      ;  call print_nl
      ;  call print_char

      ;  mov eax, [space_for_number]
      ;  call print_int
      ;  call print_int

      ; mov eax, number_prompt
      ; call print_string
      ; call read_int
      ; mov dword [space_for_number], eax

      ; mov eax, char_prompt
      ; call print_string
      ; call read_char
      ; call print_nl
      ; call print_char

;       mov eax, char_prompt
;       call print_string
;       call read_char
;       mov byte [space_for_char], al

;       call read_int
;       mov dword [space_for_number], eax

        ; dump_mem 1, many_chars, 0
        ; call print_nl
        ; dump_mem 2, many_chars + 3, 0


        

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret


