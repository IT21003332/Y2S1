#include <stdio.h>

int main()
{
	int i = 0;
	int j = 0;
	int pid;
	if(pid == 0)
	{
		for(i=0;i<5;i++)
			printf("Child: %d \n",i++);
	}
	else
	{
		for(j=0;j<5;j++)
			printf("Parent: %d \n",j++);
	
	}

	return 0;

	//This method iterates the creation of child classes with no use of forks. 
}

