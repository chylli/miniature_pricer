#!perl -T
use 5.10.0;
use strict;
use warnings FATAL => 'all';
use Test::More;


#plan tests => 228;

use FutureContract qw(getFutureContract getFutureContractAux getInterestRate getCurrentPotPrice);

is(getInterestRate(1),0.10,"get 1 days interest rate");
is(getInterestRate(210),2,"get 210 days' interest rate");
is(getInterestRate(0.1),undef,"days less than 1, interest rate is undef");
is(getInterestRate(211),undef,"days less than 1, interest rate is undef");
is(getInterestRate(45),0.045,"days not in the table should use interpolation");
is(getInterestRate(75),0.03,"days not in the table should use interpolation");
is(getCurrentPotPrice(),10,"TODO: current pot price always 10");
is(getFutureContractAux(10,220),undef,"getFutureContractAux should be undef if the days out of scope");
is(getFutureContract(30),10*exp(1) ** (5/100 * 30/365), "test getFutureContract using example 30 days");
for my $i (0..220) {
    is(getFutureContractAux(10,$i),getFutureContract($i),"getFutureContractAux should always equal getFutureContract");
}
done_testing();

