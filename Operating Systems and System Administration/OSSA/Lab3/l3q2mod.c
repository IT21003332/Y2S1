#include <stdio.h>
#include <unistd.h>
#define N 3
int main()
{
	int i;
	int pid;

	for(i = 0;i < N; i++)
	{
		if(pid = fork() == 0)
		{
			CPU();
		}
		else
		{
			wait();
		}
	}
	printf("Process  Created %d, %d\n",getpid(),pid);
	
}

void CPU()
{
	printf("Info Stack: %d, %d\n",getppid(),getpid());
}
	

