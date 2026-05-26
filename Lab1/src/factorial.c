#include "factorial.h"

long long factorial(int n)
{
    long long result = 1;

    for(int i = 1; i <= n; i++)
    {
        result = result * i;
    }

    return result;
}
