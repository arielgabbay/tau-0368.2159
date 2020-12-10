#include <stdio.h>
#include <stdlib.h>

struct node {
	int v;
	struct node * n;
};

void InitList(struct node **);
void ClearList(struct node **);
void AddItem(struct node **, struct node *);
int RemoveItem(struct node **, struct node *);

void printlist(struct node * l) {
	struct node * c = l;
	printf("{");
	while (c) {
		printf(" %d", c->v);
		c = c->n;
	}
	printf(" }\n");
}

int main() {
	struct node * l = (void *)0x12345678;
	struct node n1 = {1, (void *)1}, n2 = {2, (void *)2}, n3 = {3, (void *)3}, n4 = {4, (void *)4};
	InitList(&l);
	printf("%p\n", l);  // 0
	printlist(l);  // {}
	ClearList(&l);
	printf("%p\n", l);  // 0
	InitList(&l);
	AddItem(&l, &n1);
	AddItem(&l, &n2);
	printlist(l);  // 1 2
	AddItem(&l, &n3);
	AddItem(&l, &n4);
	printlist(l);  // 1 2 3 4
	RemoveItem(&l, &n3);
	printlist(l);  // 1 2 4
	RemoveItem(&l, &n1);
	printlist(l);  // 2 4
	RemoveItem(&l, &n4);
	printlist(l);  // 2
	ClearList(&l);
	AddItem(&l, &n1);
	AddItem(&l, &n2);
	AddItem(&l, &n3);
	AddItem(&l, &n4);
	printlist(l);  // 1 0 3 4
	ClearList(&l);
	InitList(&l);
	AddItem(&l, &n1);
	AddItem(&l, &n2);
	AddItem(&l, &n3);
	AddItem(&l, &n4);
	printlist(l);  // 0 0 0 0
}
