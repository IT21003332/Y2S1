#include <stdio.h>
#include <unistd.h>

int main()
{
	int pid;

	for(int i = 0; i < 3; i ++)
	{
		if(pid = fork() < 0)
			printf("Error!\n");
		
		else if(pid == 0)
			printf("Child Process: %d\n",getpid());

		else
			printf("Parent Process: %d\n",getpid());
	
	}
	for(int i =0;i < 3; i ++)
	{
		wait();
	}
}



