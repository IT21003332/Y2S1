// Signals are the means to notify a process or thread the occurence of an event 

#include <stdio.h>
#include <signal.h> //if we are to use signal handling, we use use this library. or <linux/signal.h>
                    // Signals can only be used only when the process is in user mode. if the system signal runs in kernel mode 
                            // it will automatically return to user mdoe 
                             

void sigproc(void); //sigproc implemented 
void quitproc(void); //quitproc implemented 

int main()
{ 
    signal(SIGINT, sigproc);    //calls the signal function -- SIGINT is a predefined signal, and we replace it with sigproc 
                    //SIGINT a process interruptor 
    
    signal(SIGQUIT, quitproc);  //calls the signal function -- SIGQUIT is a predefined signal, and we replace it with quitproc
                    //SIGQUIT is a process terminator 
    
    printf("ctrl - c disabled use ctrl. \\ to quit \n");
    for(;;);    //Infinite loop
}

    void sigproc()
    {
        signal(SIGINT,sigproc);
        printf("you have pressed ctrl-c \n");
    }

    void quitproc()
    {
        printf("ctrl - \\ pressed to quit\n");
        exit(0);
    }

