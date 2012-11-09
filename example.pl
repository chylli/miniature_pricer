#!/usr/bin/perl -w
use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/lib";

use FutureContract;

print "please input days:";

my $days = <>;
$days = $days + 0;

print "future contract price is : ", getFutureContract($days), "\n";
