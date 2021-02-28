BEGIN {
    for (i = 0; i < int(ARGV[1]); ++i) {
	printf("%.06f\n", rand());
    }
}
