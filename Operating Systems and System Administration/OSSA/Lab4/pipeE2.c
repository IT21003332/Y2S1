#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <stdlib.h>
#include <string.h>

int main()
{
	int fd[2],nbytes;
	pid_t childpid;
	char string[] = "Hello World\n";
	char readbuffer[80];

	pipe(fd);

	if(childpid = fork() == -1)
	{
		perror("fork");
		printf("Error? !");
		exit(1);
	}

	if(childpid == 0)
	{
		//Child process closes the reading. (closes up the input side of the pipe)
		close(fd[0]); // Since this process does not read, we close the reading

		//Send 'string' through the output side of Pipe

		write(fd[1],string,strlen(string)); //"Might have to put apostrophe for string since its a word" 
		exit(0);
		printf("Writing Succesfull");	
	}
	else if(childpid < 0)
	{
		//Parent process closes the writing.
		close(fd[1]); //Since the parent process does not write, we close the writing pipe index 

		nbytes = read(fd[0],readbuffer,sizeof(readbuffer));
		printf("%d bytes received with String : '%s'\n",nbytes,readbuffer);
	}

	return 0;
}

