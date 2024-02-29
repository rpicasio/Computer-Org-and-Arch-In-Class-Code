#include <stdio.h>
#include <stdlib.h>

int main() {
    int* starting_number = malloc(sizeof(int));

    printf("Enter your favorite number: ");
    scanf("%d", starting_number);

    printf("\n");

    printf("Starting number: %d\n", *starting_number);

    int times10 = *starting_number * 10;
    printf("Number * 10: %d\n", times10);

	int times72 = *starting_number * 72;
	printf("Number * 72: %d\n", times72);

    // extension
	int times81 = *starting_number * 81;
	printf("Number * 81: %d\n", times81);

	free(starting_number);
}
