#include <stdio.h>

main()
{
	int pipefd[2]; //pipefd[0] reads the input of pipefd[1]
	int i;
	char s[1000];
	char *s2;

	if(pipe(pipefd) < 0) //error reconciliation of the process of pipe
	{
		perror("pipe");
		exit(1);
	}

	s2 = "This is the message"; // pass this message to the pointer variable 

	write(pipefd[1],s2,strlen(s2)); // process the input by passing the file descriptor, variable message and length 

	i = read(pipefd[0],s,1000); // passes the reading file descriptor, char to assign the value to and the capacity of that char 
	s[i] = '\0';	//assign the end of character

	printf("Read bytes: %d from the pipe: '%s'\n",i,s);	
}

