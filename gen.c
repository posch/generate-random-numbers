#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/types.h>
#include <sys/fcntl.h>
#include <unistd.h>
#include <assert.h>

int main(int argc, char **argv)
{
	int n = atoi(argv[1]);
	long seed = 1;
	int fd = open("/dev/random", O_RDONLY);
	ssize_t res = read(fd, &seed, sizeof(seed));
	assert(res == sizeof(seed));
	close(fd);
	srand48(seed);
	for (int i = 0; i < n; ++i) {
		printf("%.6f\n", drand48());
	}
	return 0;
}
