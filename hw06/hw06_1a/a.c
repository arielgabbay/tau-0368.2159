//int f(int * a, int * b) {
//	asm("or $t0, $zero, $zero\n"
//	"loop:\n"
//	"lw $t1, 0($a0)\n"
//	"lw $t2, 0($a1)\n"
//	"addi $a0, $a0, 4\n"
//	"addi $a1, $a1, 4\n"
//	"bne $t1, $t2, nequal\n"
//	"addi $t0, $t0, 1\n"
//	"bne $a2, $t0, loop\n"
//	"nequal: add $v0, $t0, $zero\n"
//	);
//}

int f(int *, int *);

int A[] = {3, 2, 3, 4};
int B[] = {3, 2, 9, 11};

#include <stdio.h>

int main() {
	printf("%d\n", f(A, B));
}
