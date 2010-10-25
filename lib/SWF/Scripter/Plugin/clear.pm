
=head1 NAME

SWF::Scripter::Plugin::clear - Fill the background with a specific color.

=cut

=head1 CALLING

In your script call this with the RGB values you wish to fill the background
with, for example:

=for example begin

  # black
  clear 0,0,0

  # white
  clear 255,255,255

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


package SWF::Scripter::Plugin::clear;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_clear
{
    my $self = shift;

    my ( $r, $g, $b ) = (@_);

    $self->movie()->setBackground( $r, $g, $b );
}


1;
