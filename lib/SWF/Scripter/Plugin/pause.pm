
=head1 NAME

SWF::Scripter::Plugin::pause - Pause the animation

=cut

=head1 CALLING

In your script you may call move only after you've loaded an image,
via the L<SWF::Scripter::Plugin::load> plugin.

Once an image has been loaded you may pause animation for N frames
via:

=for example begin

  # load
  load 0,0, me.jpg

  # pause for a while
  pause 10

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




package SWF::Scripter::Plugin::pause;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_pause
{
    my $self = shift;
    my ($num) = (@_);


    $num = 10 if ( !defined($num) );

    my $count = 0;
    while ( $count < $num )
    {
        $count += 1;
        $self->{ 'prev' }->move( 0, 0 );
        $self->{ 'movie' }->nextFrame();
    }
}


1;
