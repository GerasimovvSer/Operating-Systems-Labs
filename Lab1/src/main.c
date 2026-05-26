#include <stdio.h>
#include "factorial.h"

int main()
{
    int n;

    printf("Enter number: ");
    scanf("%d", &n);

    long long result = factorial(n);

    printf("Factorial = %lld\n", result);

    return 0;
}
