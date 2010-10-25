
=head1 NAME

SWF::Scripter::Plugin::load - Load an image

=cut

=head1 CALLING

In your script call this with the X,Y co-ordinates and an image to place
at those coordinates.

For example:

=for example begin

  # Load at 0,0
  load 0,0, me.jpg

  # load at 50,50
  load 50,50,you.jpg

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


package SWF::Scripter::Plugin::load;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_load
{
    my $self = shift;
    my ( $x, $y, $file ) = (@_);

    print "Loading: $file\n";
    if ( -e $file )
    {
        my $bitmap = new SWF::Bitmap($file);

        $self->{ 'prev' } = $self->{ 'movie' }->add($bitmap);
        $self->{ 'prev' }->move( $x, $y );
        $self->{ 'movie' }->nextFrame();
    }
    else
    {
        print "File not found: $file\n";
    }
}


1;
