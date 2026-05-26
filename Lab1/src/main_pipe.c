#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>
#include "factorial.h"

int main()
{
    int fd[2];
    
    // Создаём pipe
    if (pipe(fd) == -1) {
        perror("pipe failed");
        return 1;
    }

    // Создаем дочерний процесс
    pid_t pid = fork();
    
    if (pid < 0) {
        perror("fork failed");
        return 1;
    }

    if (pid == 0) {
        // ДОЧЕРНИЙ ПРОЦЕСС 
        close(fd[0]); 
        
        long long r = factorial(7);
        write(fd[1], &r, sizeof(r));
        
        close(fd[1]);
        _exit(0);
    }
    else {
        // РОДИТЕЛЬСКИЙ ПРОЦЕСС 
        close(fd[1]); 
        
        long long result;
        read(fd[0], &result, sizeof(result));
        
        printf("Parent (PID=%d): Child calculated factorial(7) = %lld\n", 
               getpid(), result);
        
        close(fd[0]);
        wait(NULL); 
    }

    return 0;
}
