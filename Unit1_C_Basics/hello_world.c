// Bobby Picasio

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Array of Strings/Arrays of characters

#define NUMBER 5

int main(int argc, char* argv[]) {

    printf("Hello World!");
    printf("/n🥲");
    printf("%d) option %s", 1, "one");

    

    for(int x = 0; x < NUMBER; x++) {



    }

    //statically typed//Pointers
    int whole_number = 6;
    int* whole_number_pointer = &whole_number;

    *whole_number_pointer = 46;
    printf("\n%d", whole_number);
    printf("\n%d", *whole_number_pointer);
    printf("\n%p", whole_number_pointer);

    whole_number_pointer += 1;
    printf("\n%p", whole_number_pointer);

    int* int_pointer = 
            (int*) malloc(sizeof(int));
    printf("\n%d", *int_pointer);


    //Create a double pointer using malloc 

    double* double_pointer = 
            (double*) malloc(sizeof(double));
    *double_pointer = 102.45;
    printf("\n%lf", *double_pointer);

    //segfault

    int* bad_pointer = (int*) 4;
    printf("\n%d", *bad_pointer);

    char phrase[20];

    // Arrays

    int* int_array = calloc(4, sizeof(int));

    *(int_array + 3) = 56;


    return 0; // no errors


    


}


