#include <stdio.h>

int sum(int a, int b) {
    return a + b;
}

int main(void) {
    int x = 7;
    int y = 5;
    int s = sum(x, y);
    printf("Sum: %d\n", s);
    return 0;
}
