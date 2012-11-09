package FutureContract;

use 5.10.0;
use strict;
use warnings FATAL => 'all';
use base qw(Exporter);

use List::Util qw(min max);
use List::MoreUtils qw(firstidx);




=head1 NAME

FutureContract - Calculate the future contract price given some params

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS


This is a sample project for Regentmarket Markets Group company recruitement process.

For purpose of the test, assume a system that accepts following parameters and generate a price as decribed bellow. 

=head2 FORMULA

    F = S * e ^ (r*t)

    F : Future Contract
    S : Current spot price, you will receive it from a third party provider in a realtime manner.
    t: time in year for finding future price.
    r : Annualized Interest rate. It is defined based on the following table
    
    
    Day  | Rate
    -----------
    1    | 10%
    30   | 5%
    60   | 4%
    90   | 2%
    210  | 2

To find interest rates that are not in the table use interpolation.

=head2 EXMAPLE

Future contract if current price is 10 in thirty days is 

F = 10 * e ^ (5/100 * 30/365)


=head2 GOAL

Build a pricing server that can accept the required parameters and generate price.
The format to get data or to providing output is up to you.

=head1 EXPORT

our @EXPORT = qw(getFutureContract);

our @EXPORT_OK = qw(getFutureContract getFutureContractAux getInterestRate getCurrentPotPrice);

=cut

our @EXPORT = qw(getFutureContract);
our @EXPORT_OK = qw(getFutureContract getFutureContractAux getInterestRate getCurrentPotPrice);


=head1 SUBROUTINES/METHODS

=cut

#Annualized Interest rate
my %dayRate = (1 => 10 / 100,
               30 => 5 / 100,
               60 => 4 / 100,
               90 => 2 / 100,
               210 => 2
    );


=head2 getFutureContract

$f = getFutureContract($days);

given days , return future Contract price.
F = S * e ^ (r*t)


=cut

sub getFutureContract {
    my $days = shift;
    my $currentPotPrice = getCurrentPotPrice();

    return getFutureContractAux($currentPotPrice,$days);
}

=head2 getFutureContractAux

$f = getFutureContractAux($price, $days)

$price: Current spot price, you will receive it from a third party provider in a realtime manner.
$days: time in year for finding future price.

=cut

sub getFutureContractAux {
    my ($price, $days) = @_;

    my $interestRate = getInterestRate($days);

    return undef unless defined($interestRate);
    return $price * exp(1) ** ($interestRate * $days/365);
}


=head2 getInterestRate($days)

given days, give the interest rate looked up from the table %dayRate;
use interpolation if days not in the table.
return undef if it is out of scope.

=cut

sub getInterestRate {
    my $days = shift;
    if (exists($dayRate{$days})){
        return $dayRate{$days};
    }

    my @keyDays = keys %dayRate;
    if ($days < min(@keyDays) || $days > max(@keyDays)){
        return undef;
    }

    @keyDays = sort {$a <=> $b} (@keyDays, $days);
    
    my $idx = firstidx {$_ == $days} @keyDays;

    my $beforeDays = $keyDays[$idx - 1];
    my $afterDays = $keyDays[$idx + 1];

    # interpolation
    return $dayRate{$beforeDays} + ($days - $beforeDays) * (( $dayRate{$afterDays} - $dayRate{$beforeDays}) / ($afterDays - $beforeDays));


}

=head2 getCurrentPotPrice

$currentPotPrice = getCurrentPotPrice();

get current pot price from third party provider.

=cut

sub getCurrentPotPrice{
    #TODO:
    return 10;
}


=head1 AUTHOR

Chylli, C<< <chylli.email at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-futurecontract at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=FutureContract>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc FutureContract


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2012 Chylli.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


=cut

1; # End of FutureContract
