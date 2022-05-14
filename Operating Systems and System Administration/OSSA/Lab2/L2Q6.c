#include <stdio.h>
main()
{
	printf("Here comes the Date.\n");
	execl("/bin/date","date",0); // 0means end of argument || bin/date is the absolute path to retrieve the function
	printf("That was the date\n");
}

