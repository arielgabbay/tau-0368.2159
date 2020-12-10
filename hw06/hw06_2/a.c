#include <stdio.h>

int D[4];

int f(int, int, int*);

int t(int a, int b) {
	register int value asm("s0");
	register int c asm("s2");
	register int * d asm("s3") = D;
	if (a < b)
		c = a+b;
	else {
		a=a+b;
		c=b-a;
	}
	for(int i=1;i<=10;i++) {
		value += a;
		a*=2;
	}
	d[4] = value;
	return a;
}

int main() {
	printf("%d %d\n", t(0, 0), D[4]);
	printf("%d %d\n", f(0, 0, D), D[4]);
	printf("%d %d\n", t(1, 4), D[4]);
	printf("%d %d\n", f(1, 4, D), D[4]);
	printf("%d %d\n", f(-1, -8, D), D[4]);
	printf("%d %d\n", t(-1, -8), D[4]);
}
