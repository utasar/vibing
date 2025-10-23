#include <stdio.h>

int factorial(int n);

int main() {
    int x = 6;
    int y = factorial(x);
    
    printf("%d! = %d\n", x, y);

    return 0;
}

int factorial(int n)
{
    printf("%d! was called...\n", n);
    // check for base case
    if (n == 0)
    {
        printf("%d! has returned 1\n", n);
        return 1;
    }
    // otherwise, execute the general case
    else
    {
        int result = n * factorial(n - 1);
        printf("%d! has returned %d\n", n, result);
        return result;
    }
}
