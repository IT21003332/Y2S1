#include <stdio.h>
#include <signal.h>
#include <stdlib.h>

void sigproc(void);
void quitproc(void);
int main ()
{
	signal(SIGINT,sigproc); // signal is a system call 
	signal(SIGQUIT, quitproc);
	printf("ctrl-c disabled use ctrl.\\ to quit\n");
	for(;;);  // infinite loop
}

void sigproc()
{
	signal(SIGINT,sigproc);
	//NOTE some versions of UNIX will reset signal to default after each call.
	//So for portabilitiy reset signal each time
	
	printf("You have pressed ctrl-c\n");
}

void quitproc()
{
	printf("ctrl - \\ pressed to quit\n'");
	exit(0); //normal exit status 
}



