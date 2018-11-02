#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <fcntl.h>

#include <linux/random.h>


int main(int argc, char **argv)
{
    int count, fd;

    if (argc != 2) {
        printf("Usage: rndaddtoentcnt <count>\n");
        exit(1);
    }

    count = strtoul(argv[1], NULL, 0);

    if (count < 1 || count > 4096) {
        printf("Count range is 1 to 4096\n");
        exit(1);
    }

    fd = open("/dev/urandom", O_WRONLY);

    if (fd < 0) {
        perror("open(/dev/urandom)");
        exit(1);
    }


    if (ioctl(fd, RNDADDTOENTCNT, &count) < 0) {
        perror("ioctl(RNDADDTOENTCNT)");
        close(fd);
        exit(1);
    }

    close(fd);

    return 0;
}
