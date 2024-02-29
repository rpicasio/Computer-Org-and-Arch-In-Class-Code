// Bobby Picasio
// Computer Organization and Architecture
// Project 2: Pointer Practice

#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

//Function calls that perform each function

void memDump(char *str);
int getHash(char *str);
bool isPalindrome(char *str);
void printFromIndex(char *str);
void reverseString(char *str);







// Asking the user to enter a word 

int main(int argc, char* argv[]){

    // setting the char character max to 16 because in computer science we start from 0

    char response[16];

    //printing what I want to ask the user

    printf("Enter an all lowercase word, max of 15 characters: ");

    // print prompts before each scanf
    scanf("%16s", response);

    // This will print out the selection of the options for the user to press which will include these options memDump, getHash, isPalindrome, printFromIndex 

    int options;

    //I added this for styling so it looks cleaner

    printf("----------------------\n");

    printf("Choose an option:\n");
    printf("(1) Memory dump\n");
    printf("(2) Print hash value\n");
    printf("(3) Determine if your word is a palindrome\n");
    printf("(4) Print the word from an index\n");
    printf("(5) Reverse the string\n");

    //I added this for styling so it looks cleaner

    printf("----------------------\n");

    // this print statement will print the users options number

    printf("Option (number): ");
    

     // print prompts before each scanf
    
    scanf("%d", &options);

    // This is the code behind the selection of choices, and if you select a choice, it will return what the option is meant to return

     // Based on user's choice, call the appropriate function
    if (options == 1) {

    memDump(response);

    } else if (options == 2) {

    printf("Hash value: %d\n", getHash(response));

    } else if (options == 3) {

    if (isPalindrome(response)) {

        printf("Hooray! This word is a palindrome :)))) \n");

    } else {

        printf("Sadly The word is not a palindrome :'(((( \n");

    }
    } else if (options == 4) {

    printFromIndex(response);

    } else if (options == 5) {

    reverseString(response);
    
    printf("Reversed String: %s\n", response);
    
    } else {

    printf("Invalid choice.\n");

    }




    // ensure that there are no errors
    return 0; // no errors





}

//Function memDump that takes in a pointer and prints out a table with the address, ascii value in base 10, and character of each element in the string

void memDump(char *str) {


    printf("Memory Dump:\n");
    printf("Address:   ASCII:   Character:\n");

// printing out the actual values of Address, ASCII, and Character. Using pointers.

    while (*str != '\0') {

        printf("%p    %d    %c\n", (void *)str, *str, *str);
        str++;

    } 




}

// GetHash method that will calculate and return the hash value of the string

int getHash(char *str) {

    // intitiating the variable that will hold the hash value

    int Value = 0;

    //while loop incrementing the hash value and setting the value not equal to 0.

    while(*str != '\0') {

        Value += *str;

        str ++;

    }

    return Value;





}

// method will return true if the string that the user inputs is a palindrome, and if not returns false

bool isPalindrome(char *str) {

    char *check = str;

    while(*check != '\0') {

        check ++;

    }

    // this while loop will also check if the word is a palindrome and if it isn't it returns false

    check --;

    while(str < check) {

        if(*str != *check) {

            return false;

        }

        str ++;
        
        check --;
    }

    // if so it returns true

    return true;



}

// methos that asks the user for a starting index, validate it, and print the string starting from the index of the str

void printFromIndex(char *str) {

    int begginingIndex;

    printf("Enter the strings starting index: ");
    scanf("%d", &begginingIndex);


    int length = 0;

    char *val = str;

    while(*val != '\0') {

        length ++;
        val++;

    }

    // if the user inputs a number that is greater than the strings actual index it will throw a message error

    if(begginingIndex < 0 && begginingIndex >= length) {

        printf("Invalid index, try again :( )");


    } else {

        // if the user inputs a correct number within the bounds of the strings index it will return the index of that string

        printf("Substring from index %d: %s\n", begginingIndex, str + begginingIndex);



    }



}

// EXTENSION: this method will reverse the string, and make the string backwards for the user

void reverseString(char *str) {

    // initiate a varaible and use the operator "strlen" to determine and take in the length of the string.

    int stringLength = strlen(str);

    // this basic for loop will reverse the characters in the input string.
    // the - 1 will reverse the string

    for (int a = 0, b = stringLength - 1; a < b; a++, b--) {
        
        char extension = str[a];
        str[a] = str[b];
        str[b] = extension;

    }




}
