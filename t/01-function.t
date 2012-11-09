#!perl -T
use 5.10.0;
use strict;
use warnings FATAL => 'all';
use Test::More;


plan tests => 1;

use FutureContract qw(getFutureContract);

is(getFutureContract(),1,"test getFutureContract");
done_testing();
