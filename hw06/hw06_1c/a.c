void f(int *, int *, int *);

int A[] = {0, 1, 2, 3, 4, 5};
int B[] = {1, 3, 5, 7, 9, 11};
int C[] = {0, 5, 2, 6, 3, 8};

#include <stdio.h>

void p(int * a, int s) {
	for (int i = 0; i < s; i++) {
		printf("%d ", a[i]);
	}
	printf("\n");
}

int main() {
	f(A, B, C);
	p(A, sizeof(A)/sizeof(int));
	p(B, sizeof(B)/sizeof(int));
	p(C, sizeof(C)/sizeof(int));
}
