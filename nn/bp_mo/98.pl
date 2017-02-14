#!usr/bin/env perl
use strict;
use warnings;

my $eta = 1.9; #for(my $eta = 1.9; $eta < 2.00; $eta += 0.05 ){
 my $alpha = 0.90; #for(my $alpha = 0.90; $alpha < 1.0; $alpha += 0.1){
    for(my $hidden = 1; $hidden < 51; $hidden += 1){
	print "HIDDEN=",$hidden,"\n";
      system "./a.out 10000 $eta $alpha $hidden 2> /dev/null | tail -n1 |sed -e 's/error.*//'";
#	my @list = `./a.out 1000 $eta $alpha $hidden | tail -n1`
	#print @list;
}
print "\n",$eta,"\n",$alpha,"\n";
