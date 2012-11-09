package FutureContact;

use 5.10.0;
use strict;
use warnings FATAL => 'all';
use base qw(Exporter);

our @EXPORT = qw(getFutureContract);
our @EXPORT_OK = qw(getFutureContract);

=head1 NAME

FutureContact - Calculate the future contact price given some params

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS


This is a sample project for Regentmarket Markets Group company recruitement process.

For purpose of the test, assume a system that accepts following parameters and generate a price as decribed bellow. 

=head1 FORMULA

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

=head1 EXMAPLE

Future contract if current price is 10 in thirty days is 

F = 10 * e ^ (5/100 * 30/365)


=head1 GOAL

Build a pricing server that can accept the required parameters and generate price.
The format to get data or to providing output is up to you.

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 getFutureContract

=cut

sub getFutureContract {
    return 1;
}


=head2 

=cut

sub function2 {
}

=head1 AUTHOR

Chylli, C<< <chylli.email at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-futurecontact at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=FutureContact>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc FutureContact


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

1; # End of FutureContact
