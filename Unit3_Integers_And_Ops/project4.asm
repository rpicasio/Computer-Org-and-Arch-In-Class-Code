; Bobby Picasio
; 2/19/24
; Computer Org and Arch
; Project 4: An 8-Bit Integer


%include "asm_io.inc"

; initialized data
segment .data

        welcome_message db "Welcome to Project4! :) ", 0                   ; Welcome message welcoming the programmer to the program
        format_string db "----------------------", 0                       ; Formatting string that helps the program look better
        twos_complement_num db "Enter a number in two's complement: ", 0   ; String asking the user to take in a number in two’s complement representation
        num_in_signed_magnitude db "In signed magnitude: ", 0              ; String taking the number in twos complement in 8-bit signed magnitude
        num_shift_left db "Number to shift by: ", 0                        ; String asking the user to shift the original number to the left by that many bits
        num_carry db "Carry: ", 0                                          ; String printing out the carry bit that “fell off” the left edge
        signs db "+-", 0                                                   ; Signs that hold the sign of the number

; uninitialized data
segment .bss

        user_input resb 1                                               ; Takes in user input
        sign resb 1                                                     ; Takes in the sign of the number that is inputted
        shift_count resb 1                                              ; Takes in the number of bits by which the input number will be shifted.
        carry resb 1                                                    ; Takes the carry flag, which will be set to the outcome of arithmetic operations.

segment .text

    global  asm_main
        asm_main:
        enter   0,0                                                     ; setup routine
        pusha

        call print_nl                                                   ; Printing a newline for formatting
        mov eax, welcome_message                                        ; This will put the welcome message variable into EAX
        call print_string                                               ; Printing the string from the welcome message string
        call print_nl                                                   ; Printing a newline for formatting

        mov eax, format_string                                          ; This will print the string for the format string
        call print_string                                               ; Printing the string from the format string
        call print_nl                                                   ; Printint a newline for formatting


        call print_nl                                                   ; Printing a newline for formatting
        mov eax, twos_complement_num                                    ; This will put the twos_complement_num variable into EAX
        call print_string                                               ; Printing the string from the twos_complement_num
        call read_int                                                   ; Taking in an int in two’s complement representation.
        mov [user_input], eax                                           ; Stores the contents of the EAX into the memory reserved for user_input.


        
        call print_nl                                                   ; Printing a newline for formatting
        mov eax, num_in_signed_magnitude                                ; This will put the num_in_signed_magnitude variable into EAX
        call print_string                                               ; Printing the string from the num_in_signed_magnitude
        mov al, [user_input]                                            ; Puts the byte stored in the memory of user_input into AL
        shr al, 7                                                       ; Shifts AL 7 bits to the right
        movzx eax, al                                                   ; Zero-extends the contents AL into EAX.

        mov ebx, signs                                                  ; This will put the signs variable into EBX
        add ebx, eax                                                    ; Add the value in EAX to EBX
        mov al, [ebx]                                                   ; Puts the sign into AL
        call print_char                                                 ; printing the signs for the int

        mov al, [user_input]                                            ; Puts the byte stored in user_input into AL
        and al, 0b01111111                                              ; Perform a bitwise AND operation between AL and the binary value 01111111 masking out the most significant bit to make sure the number is positive.
        call print_int                                                  ; Printing the integer
        call print_nl                                                   ; Printing a newline for formatting


        call print_nl                                                   ; Printing a newline for formatting
        mov eax, num_shift_left                                         ; Storing num_shift_left into EAX
        call print_string                                               ; Printing the string with the num_shift_left message
        call read_int                                                   ; Read an integer from user input and stores it in AL
        mov [shift_count], al                                           ; Puts the integer input to the side


        movsx ax, byte [user_input]                                     ; Sign-extend the 8-bit user input to 16 bits and store it in AX
        mov cl, [shift_count]                                           ; Put the shift count into the new CL register
        sal ax, cl                                                      ; Shift the value in AX left by the value in CL
        mov [user_input], al                                            ; Store the least significant byte into user_input
        call print_nl                                                   ; Printing a newline for formatting 

    

        mov eax, num_carry                                              ; Store num_carry into EAX
        call print_string                                               ; Print the num_carry string


        xor ecx, ecx                                                    ; Sets ECX to zero
        mov eax, [user_input]                                           ; Puts the value stored in user_input into EAX
        mov ecx, [num_shift_left]                                       ; Puts the value stored in num_shift_left into ECX
        shl eax, cl                                                     ; Shifts the value in EAX left by the number of bits in CL 
        shr eax, 8                                                      ; Shifts the value in EAX right by 8 bits    
        mov ebx, 1                                                      ; Puts the value of 1 into EBX    
        and eax, ebx                                                    ; Performs a bitwise AND operation between the values in EAX and EBX, storing the result in EAX
        mov dword [num_carry], eax                                      ; Stores the result into num_carry
        xor eax, eax                                                    ; Clears EAX 
        xor ebx, ebx                                                    ; Clears EBX 
        xor ecx, ecx                                                    ; Clears ECX 

        mov eax, carry                                                  ; Stores carry into eax
        call print_string                                               ; Prints the string      
        xor eax, eax                                                    ; Clears EAX   
                   


        mov eax, [num_carry]                                            ; Puts the value stored in num_carry into the EAX
        call print_int                                                  ; Prints the value in EAX as an int
        call print_nl                                                   ; Printing a newline for formatting
        xor eax, eax                                                    ; Clears EAX
        call print_nl                                                   ; Printing a newline for formatting


        mov eax, num_in_signed_magnitude                                ; Stores num_in_signed_magnitude into EAX
        call print_string                                               ; Prints the string
        mov al, [user_input]                                            ; Puts the value stored in user_input into AL
        shr al, 7                                                       ; Shifts AL 7 bits to the right
        movzx eax, al                                                   ; Zero-extend the value in AL to EAX

        mov ebx, signs                                                  ; Stores signs into EBX
        add ebx, eax                                                    ; Add the value in EAX to EBX 
        mov al, [ebx]                                                   ; Move the byte at EBX into AL
        call print_char                                                 ; Printing the sign
        mov al, [user_input]                                            ; Put the value stored in user_input into AL
        and al, 0b01111111                                              ; Clear the most significant bit of AL to remove the sign bit
        call print_int                                                  ; Prints the magnitude
        call print_nl                                                   ; Printing a newline for formatting

        popa
        mov     eax, 0            ; return back to C
        leave                     
        ret

