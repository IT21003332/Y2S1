#include <stdio.h>

int main()
{
	int pid,value = 50;
	
	if(pid = fork() == 0)
	{
		printf("Hello This is a child Process. Process ID: %d, Parent Process ID: %d, Process Identifier: %d\n",getpid(),getppid(),pid);
		value += 50;
	}
	else
	{
		printf("Hello This is a Parent Process. Process ID: %d, Parent Process ID: %d, Process Identifier: %d\n",getpid(),getppid(),pid);
		value += 80; 
	}

	printf("Process Identifier Reuter Method Value Dispatch: %d\n",value);
}	

