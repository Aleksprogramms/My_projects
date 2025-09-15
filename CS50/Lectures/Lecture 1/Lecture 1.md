

# Lecure 1

some infos about vscode

some infos about cmd

data types....)))))))

style 50 good idea i like it


```C:

#include <cs50.h>
#include <stdio.h>

int get_positive_int(void);
void meow(int n);

int main (void)

{
    int times = get_positive_int();
    meow(times);

}

int get_positive_int(void)

{
    int n;
    do // loop :) have seen only in C
    {
        n = get_int("Number: ");
    }
    while (n<1);
    return n;
}

for (int i = 0; i < 0; i++)
{
    // code here
}
```