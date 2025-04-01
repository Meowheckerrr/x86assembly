#include <fcntl.h>
#include <sys/stat.h>
#include <stdio.h>
#include <unistd.h>

int main() {
    int fd = open("example.txt", O_RDWR | O_CREAT | O_TRUNC, 0644);
    
    if (fd == -1) {
        perror("Error opening file");
        return 1;
    }

    printf("File opened with fd: %d\n", fd);
    close(fd);
    return 0;
}