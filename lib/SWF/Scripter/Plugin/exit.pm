
=head1 NAME

SWF::Scripter::Plugin::exit - Stop processing.

=cut

=head1 CALLING

In your script call this when you're done.

=for example begin

   # all processing ceases.
   exit

=for example end

=cut


=head1 AUTHOR

=over 4

=item Steve Kemp

http://www.steve.org.uk/

=back

=cut

=head1 LICENSE

Copyright (c) 2010 by Steve Kemp.  All rights reserved.

This module is free software;
you can redistribute it and/or modify it under
the same terms as Perl itself.
The LICENSE file contains the full text of the license.

=cut


package SWF::Scripter::Plugin::exit;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_exit
{
    exit 0;
}


1;
