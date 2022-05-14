#include <stdio.h>
#include <unistd.h>

int main ()
{
	int value = 60;
	pid_t pid;

	pid = fork();
	if(pid == 0)
	{
		value = value + 20;
	}
	else if(pid > 0)
	{
		value = value - 20; 
		printf("Parent Value: %d \n",value);
		wait(NULL);
	}
}


