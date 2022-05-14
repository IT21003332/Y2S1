#include <unistd.h>

int main()
{
	int pfd[2],fv;
	pipe(pfd);
	fv = fork();
	if(fv){
		close(pfd[0]);
		dup2(pfd[1],STDOUT_FILENO);
		execlp("Cat","Cat",NULL);
	}
	else
	{
		close(pfd[1]);
		dup2(pfd[0],STDIN_FILENO);
		execlp("tr","tr"," ","x",NULL);
	}
	return 0;
}
