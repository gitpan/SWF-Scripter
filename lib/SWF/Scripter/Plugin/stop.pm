
=head1 NAME

SWF::Scripter::Plugin::stop - Stop the animation.

=cut

=head1 CALLING

Once your movie is complete you may add 'stop' to the end of the script
to prevent it looping and re-starting automatically.

For example:

=for example begin

  # load
  load 0,0, me.jpg

  # repeatedly move one pixel
  repeat(200, move 1,0 )

  # but then stop, don't restart from the begining
  stop

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



package SWF::Scripter::Plugin::stop;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_stop
{
    my $self = shift;

    my $action = new SWF::Action("stop();");
    $self->{ 'movie' }->add($action);
    $self->{ 'movie' }->nextFrame();

}


1;
