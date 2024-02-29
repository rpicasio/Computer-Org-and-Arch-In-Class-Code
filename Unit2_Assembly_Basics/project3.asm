; Bobby Picasio
; 2/7/2024
; Computer Organization and Architecture
; Project 3

%include "asm_io.inc"

segment .data

    favorite_number db "Enter your favorite number: ", 0        ; string that will take in a user inputs favorite number
    starting_number db "Starting Number: ", 0                   ; starting number that the user chose
    could_not_print_number db "User's favorite number", 0       ; I added this because I could not get the starting number to appear/favorite number. So I wanted to add at least something to show I tried.
    number_times_ten db "Number x 10: ", 0                      ; string that prints out the message number * 10
    number_times_seventytwo db "Number x 72: ", 0               ; string that prints out the message number * 72
    number_times_eightyone db "Number x 81: ", 0                ; string that prints out the message number * 81

segment .bss
    
    user_input resd 1                                           ; user's input basically like the scanner like in java

segment .text
    global asm_main

asm_main:
    enter   0,0               ; setup routine
    pusha

    
    mov eax, favorite_number            ; This will print the string for the user to enter a their favorite number
    call print_string                   ; printing the string from favorite number's string

    call read_int                       ; This line will read the integer from the user
    mov [user_input], eax               ; Save user input in the variable user_input

    call print_nl                       ; newline for styling

    mov eax, starting_number            ; this will print the string that displays the starting number chosen by the user
    call print_string                   ; printing the string
    
    mov eax, could_not_print_number     ; this will print the user's starting number 
    call print_string                   ; this will print the string
    call print_nl                       ; newline for styling

    mov eax, [user_input]               ; These couple of lines will multiply the users integer by 10 using the add operator
    add eax, eax                        ; Multiplying by 2 
    add eax, eax                        ; then we multiply by 2 again 
  
    add eax, eax                        ; Multiply by 2 again which is going to be 8 bc were adding 
  
    add eax, [user_input]               ; now here we add the input to 8
    add eax, [user_input]               ; and here we add the input to 9 to get to 10

    mov ebx, eax                        ; here we move ebx and eax both registers

    mov eax, number_times_ten           ; here we move eax to print the string message number * 10
    call print_string                   ; printing the string

                                        ; 8 + 2 = 10

    mov eax, ebx                        ; moving the registers after completing the statements, and arithmetic

    call print_int                      ; call the integer to be printed with the resulte of the users number * 10
    call print_nl                       ; printing a newline for styling 

    
    mov eax, [user_input]               ; This time we will multiply/add the input by 72 using add
    add eax, eax                        ; Multiply by 2 
    add eax, eax                        ; Multiply by 2  
    add eax, eax                        ; Multiply by 2 

    mov ecx, eax                        ; moving the registers

    add eax, eax                        ; Multiply by 2 
    add eax, eax                        ; Multiply by 2 
    add eax, eax                        ; Multiply by 2  
    add eax, ecx                        ; add 64 + 8 = 72 this is the secret.

    
    mov ebx, eax                        ; moving the registers

    mov eax,  number_times_seventytwo   ; now we will call the print line
    call print_string                   ; and print out the string we have saved in the string

    mov eax, ebx                        ; moving the registers

    call print_int                      ; printing the integer that is multiplied by 72
    call print_nl                       ; newline for styling

    
    mov eax, [user_input]               ; Multiply the users input by 81 
    add eax, eax                        ; Multiply by 2 
    add eax, eax                        ; Multiply by 2  
    add eax, eax                        ; Multiply by 2  
    add eax, eax                        ; Multiply by 2  
    mov ecx, eax                        ; Moving the registers
    add eax, eax                        ; Multiply by 2 
    add eax, eax                        ; Multiply by 2  
    add eax, [user_input]           
    add eax,ecx                         ; 65 + 16 = 81 

    mov ebx, eax                        ; moving the registers

    mov eax, number_times_eightyone     ; calling the string line
    call print_string                   ; printing the string line

    mov eax, ebx                        ; moving the registers

    call print_int                      ; printing the integer
    call print_nl                       ; newline for styling

    popa
    mov     eax, 0            ; return back to C
    leave                     
    ret
