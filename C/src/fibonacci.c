#include <stdio.h>

// Função para calcular Fibonacci usando iteração
int fibonacci(int n) {
    if (n <= 1) return n;
    int a = 0, b = 1, temp;
    for (int i = 2; i <= n; i++) {
        temp = a + b;
        a = b;
        b = temp;
    }
    return b;
}

int main(void) {
    int n = 10; // até qual número da sequência calcular
    printf("Fibonacci sequence up to %d terms:\n", n);

    for (int i = 0; i < n; i++) {
        printf("%d ", fibonacci(i));
    }

    printf("\n");
    return 0;
}
