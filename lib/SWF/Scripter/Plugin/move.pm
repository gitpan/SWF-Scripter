
=head1 NAME

SWF::Scripter::Plugin::move - Move a previously loaded text/image

=cut

=head1 CALLING

In your script you may call move only after you've loaded an image,
or some text, via one of the L<SWF::Scripter::Plugin::load> or
L<SWF::Scripter::Plugin::text> plugins.

Once an image, or text string, has been displayed you may move and
redraw via code such as this:

=for example begin

  # load
  load 0,0, me.jpg

  # move
  move 1,1
  move 1,1

  # repeatedly move one pixel
  repeat(200, move 1,0 )

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


package SWF::Scripter::Plugin::move;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_move
{
    my $self = shift;
    my ( $x, $y ) = (@_);

    if ( $self->{ 'prev' } )
    {
        $self->{ 'prev' }->move( $x, $y );
        $self->{ 'movie' }->nextFrame();
    }
    else
    {
        print "You cannot move before you've loaded an image\n";
    }
}


1;
