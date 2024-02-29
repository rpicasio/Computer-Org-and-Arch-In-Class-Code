// Bobby Picasio
// Exam Practice

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {

    int whole_number = 6; // creating a variable
    int* whole_number_pointer = &whole_number; // getting a pointer to the variable (the & symbol)

    *whole_number_pointer = 46; // setting the value of whole_number by dereferencing the pointer

    printf("\n\nwhole_number: %d", whole_number); // printing the value via its original variable
    printf("\n*whole_number_pointer: %d", *whole_number_pointer); // printing the value via dereferencing the pointer
    printf("\n\nwhole_number_pointer: %p", whole_number_pointer); // printing the pointer's value (memory address)

     // setting aside unititalized space and getting its pointer
    int* int_pointer = (int*) malloc(sizeof(int));
    printf("\n\nmalloced *int_pointer: %d", *int_pointer); // dereferncing the pointer to see what happens

    char* str = calloc(16, sizeof(char));
    printf("Enter a word: ");
    scanf("%15s", str);





}