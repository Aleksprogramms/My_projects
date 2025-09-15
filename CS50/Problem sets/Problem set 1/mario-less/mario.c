#include <cs50.h>
#include <stdio.h>

int get_positive_int(void);

int main(void)

{
    int height = get_positive_int();

    int number_of_spaces = height - 1; // I use it to place " " before, before "#"
    int number_of_hashes = 1;          // Here the number of Hashes that need to be placed

    for (int i = 0; i < height; i++) // loop for the number of lines
    {
        for (int k = 0; k < number_of_spaces; k++) // place " "
        {
            printf(" ");
        }
        number_of_spaces -= 1;                     // we need less and less them
        for (int j = 0; j < number_of_hashes; j++) // place "#"
        {
            printf("#");
        }
        number_of_hashes += 1; // we need more and more them
        printf("\n");
    }
}

int get_positive_int(void) // func from Lecture 1

{
    int n;
    do // loop :) have seen only in C
    {
        n = get_int("Height: ");
    }
    while (n < 1);
    return n;
}
