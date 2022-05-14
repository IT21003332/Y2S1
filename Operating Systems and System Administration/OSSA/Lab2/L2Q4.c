#include <stdio.h> 
main()
{
	int ret;
	printf("Hello World\n"); ret = fork();

	if(ret == 0)
	printf("I am Child and Return Value=%d\n", ret);

	else
	printf("I am Parent and Return Value=%d\n", ret);
}

