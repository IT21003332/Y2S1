#include <stdio.h>
main()
{
	int ret;
	printf("I am Parent\n"); ret = fork();
	printf("Return Value: %d\n", ret);

	//fork() will return parent value first and in second one it will return child value
	//it will return a plus value first because that return value is parent value 
	//and the duplication is a child value which is always0
}

