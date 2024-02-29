// Bobby Picasio

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Array of Strings/Arrays of characters

#define NUMBER 5

int main(int argc, char* argv[]) {

    printf("Hello World!");
    printf("🥲");
    printf("%d) option %s", 1, "one");

    

    for(int x = 0; x < NUMBER; x++) {



    }

    //statically typed//Pointers
    int whole_number = 6;
    int* whole_number_pointer = &whole_number;

    *whole_number_pointer = 46;
    printf("\n%d", whole_number);

    return 0; // no errors
    


}


