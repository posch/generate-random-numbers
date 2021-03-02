#!/usr/bin/env perl

my $n = $ARGV[0];
for (my $i = 0; $i < $n; ++$i) {
    printf("%.6f\n", rand());
}


