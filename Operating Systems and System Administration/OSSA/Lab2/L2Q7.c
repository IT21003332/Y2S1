#include <stdio.h>
main()
{
	printf("Here comes the date. \n");
       	fork();
	execl("/bin/date", "date", 0);
	printf("That was the date. \n");
}

