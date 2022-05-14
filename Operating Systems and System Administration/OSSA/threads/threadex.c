#include <stdio.h>
#include <pthread.h>
#define NUM_THREADS 4

void *hello (void *arg)
{
	//thread main
	printf("Hello Thread\n");
	return 0;
}

int main()
{
	int i;
	pthread_t tid[NUM_THREADS];
	for(i = 0; i <NUM_THREADS;i++)
	{
		//create fork threads
		pthread_create(&tid[i],NULL,hello,NULL);
	}
	for(i = 0; i <NUM_THREADS; i++)
	{
		//Wait/join threads
		pthread_join(tid[i],NULL); //here threads are not joining, this is a request to ask the main thread to wait till the child thread is made
	}
	return 0;
}
