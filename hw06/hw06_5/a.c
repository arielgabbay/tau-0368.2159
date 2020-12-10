#include <stdio.h>
#include <stdlib.h>

int fib(int);

int main(int argc, char * argv[]) {
	int arg = atoi(argv[1]);
	printf("%d\n", fib(arg));
}
