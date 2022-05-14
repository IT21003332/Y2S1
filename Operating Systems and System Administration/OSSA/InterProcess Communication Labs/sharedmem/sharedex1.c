#include <stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/smh.h>
#define SEGSIZE 100

main(int argc char* argy[]){

    key_t key;
    int schmid, cntr;
    char *segptr;
    if(argc == 1){
        usage();
        key = ftok(".","S");

        if((schmid = shmget(Key,SEGSIZE,IPC_CREATE |IPC_EXCL|0666)) == -1)
        {
            printf("Shared memory segment exists - opening as client\n");
            if(schmid  = shmget(key,SEGSIZE,0) == -1)
            {
                perror("shmget");
                exit(1);
            }
        }
        else
        {
            printf("Creating new shared memory segment\n");
        }
    }
}