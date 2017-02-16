#!usr/bin/env perl
use strict;
use warnings;

my $eta = 1.9;
my $alpha = 0.90;

for(my $hidden = 1; $hidden < 51; $hidden += 1){
    print "HIDDEN=",$hidden,"\n";
    system "./a.out 10000 $eta $alpha $hidden 2> /dev/null | tail -n1 |sed -e 's/error.*//'";
    }
