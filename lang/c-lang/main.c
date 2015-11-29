#include <stdio.h>

int plus(int a, int b) {
    return a + b;
}

int plus_auto(int a) {
    return a+1;
}

int plus_double(int a) {
    return a*a;
}

int main() {
    printf("hello word\n");
    int a = 5;
    int b = 77;
    int c = plus(a, b);
    printf("a=%d, b=%d, a+b=%d\n", a, b, c);
    return 0;
}
