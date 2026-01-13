#include <stdio.h>
#include <stdlib.h>

int
	main(void)
{
	printf("Hello, World!\n");
	printf("Hello, %s!\n", getenv("foo"));
	return (0);
}
