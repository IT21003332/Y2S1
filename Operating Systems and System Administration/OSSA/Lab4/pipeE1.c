#include <stdio.h>
#include <string.h>
#include <stdlib.h>

main()
	{
		int pipefd[2];
		int i;
		char s[1000];
		char *s2; //pointer
		
		if(pipe(pipefd) < 0)	//Argument to initiate the pipe
		{
			perror("pipe"); //This shows us what's exactly the error
			exit(1);
		}

		s2 = "This is the Message";

		write(pipefd[1],s2,strlen(s2));	//before writing the message, first argument passes the index.
		//second argument passes the message, third argument passes the length of the message	

		i = read(pipefd[0],s,1000); // This index is to read the message of index 1. data of s2 will be saved into char s variable	
		s[i] = '\0'; // This is an end of the line character. to end the line from further reading data

		printf("Read %d bytes from the pipe: '%s'\n",i,s);
	}


