#include <stdio.h>
#include <unistd.h>

int main ()
{
	int value = 100;
	pid_t pid;
	pid = fork();

	if(pid == 0)
	{
		value = value +15;
	}
	else if(pid > 0)
	{
		value = value -15;
		printf("Parent Value: %d \n",value);
		wait(NULL);
	}
}
