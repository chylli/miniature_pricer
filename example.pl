#!/usr/bin/perl -w
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/lib";

use FutureContract;

print "please input days:";

my $days = <>;
$days = $days + 0;

my $f = getFutureContract($days);
die "you input bad data\n" unless $f;
print "future contract price is : ", $f , "\n";
