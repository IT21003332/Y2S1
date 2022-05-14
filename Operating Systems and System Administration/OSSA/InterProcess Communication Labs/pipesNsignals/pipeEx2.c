#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>

int main(){

	int fd[2],nbytes;
	pid_t childpid;			//pid_t means datatype for the processid 
	char string[] = "Hello world!\n";
	char readbuffer[80];
	pipe(fd);
		if((childpid = fork()) == -1)
		{
			perror("fork");
			exit(1);
		}
		if(childpid == 0)	// this ensures that the writing is done in the child class
		{
			close(fd[0]);
			write(fd[1], string, strlen(string));
			exit(0);
		}
		else			// if the process id(pid) is passed as the fork value, it is in parent process and it will return the read
		{
			close(fd[1]);
			nbytes = read(fd[0],readbuffer,sizeof(readbuffer));
			readbuffer[nbytes] = '\0';
			printf("Received String: %s",readbuffer);
		}
	return 0;
}
