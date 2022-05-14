#include <stdio.h>
int main()
{
	int id;
	if((id =fork()) ==0)
	{
		printf("I am a Child process\n");
		sleep(10);
	}
	else
	{
		printf("I am a parent Process\n");
		wait(12);
	}
}
