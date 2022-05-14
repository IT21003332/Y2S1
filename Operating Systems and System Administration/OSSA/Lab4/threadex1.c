#include <stdio.h>
#include <pthread.h>
#define numthreads 25

int thread_routine(int x)
{
	printf("Im thread %2d my TID is %u\n",x,pthread_self());
	pthread_exit(0);
}

int main()
{
	pthread_attr_t thread_attr;
	pthread_t tids[numthreads];//thread_attr is an attribute created by pthread_attr_r
	int x; 
	pthread_attr_init(&thread_attr);
	for(x = 0;x <numthreads;x++)
	{
		pthread_create(&tids[x],&thread_attr,(void*)thread_routine, (void* )x);
	}
	printf("Waiting for threads to finish\n");
	for(x=0; x<numthreads;x++)
	{
		pthread_join(tids[x],NULL);
	}
	printf("All threads are now finished\n");
}
