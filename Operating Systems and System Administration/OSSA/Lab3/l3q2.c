#include <stdio.h>

void main()
{
	int i;
	int pid;

	for(i = 0; i < 3; i++)
	{
		pid = fork();
		//printf to see what returns what
		//getppid() gets parents PID
		//getpid() gets current process ID

		printf("Parent: [%d] CurrentFork:  [%d] Current Iteration:i = %d\n",getpid(),pid,i);
	}
	printf("Parent: [%d] CurrentProcess: [%d] New Process\n",getppid(),getpid());
}	

// 1. Loop starts in parent i == 0
// 2. Parent fork() creating child 1
// 3. You now have two processes. Both print i=0
// 4. Once the loop is over two Processes will return "New Process = Tally 2"
// 5. Loop restarts in i == 1
// 6. Tally of 2 Processes will fork creating 2 more processes, all prints i = 1
// 7. Once the loop is over additional 2 and last 2 will return "New Process = Tally 4"
// 8. Loop restart in i == 2
// 9. Tally of 4 processes will fork() creating 4 more processes, all prints i = 2
// 10.Once the Loop is over additional 4 and last total 4 will return "New Process = Tally 8"
// 11.Loop will reiterate but terminate since i < 3
// 12. This shows that All processes == (2^n) and New Processes == (2^n - 1) 
