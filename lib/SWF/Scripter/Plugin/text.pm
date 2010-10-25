
=head1 NAME

SWF::Scripter::Plugin::text - Draw some text.

=cut

=head1 CALLING

In your script call this with the X,Y co-ordinates and a text string to place
at those coordinates.

For example:

=for example begin

  # Load at 0,0
  load 0,0, steve

  # load at 50,50
  load 50,50, Kemp

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


package SWF::Scripter::Plugin::text;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_text
{
    my $self = shift;
    my ( $x, $y, $r, $g, $b, @text ) = (@_);

    #
    #  Join the text
    #
    my $text = join( " ", @text );
    $text =~ s/^["']|["']$//g;

    #
    #  Load the font.
    #
    my $font = undef;

    if ( $self->{ 'font' } )
    {
        if ( -e $self->{ 'font' } )
        {
            $font = new SWF::Font( $self->{ 'font' } );
        }
        else
        {
            print "Font file not found: $self->{'font'}\n";
            exit;
        }
    }
    else
    {
        $font =
          new SWF::Font("/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf");
    }

    #
    #  Create the text helper.
    #
    my $txt = new SWF::Text();
    $txt->setFont($font);
    $txt->moveTo( $x, $y );
    $txt->setColor( $r, $g, $b );
    $txt->addString($text);

    #
    #  Add to the movie
    #
    $self->{ 'prev' } = $self->{ 'movie' }->add($txt);
    $self->{ 'movie' }->nextFrame();
}


1;
