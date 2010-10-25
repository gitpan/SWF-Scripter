
=head1 NAME

SWF::Scripter::Plugin::font - Load a TTF font.

=cut

=head1 CALLING

In your script call this with the path to a .TTF font file.

For example:

=for example begin

  # Load the font
  font /usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf

  # draw white text at 40,40
  text 40,40,255,255,255, "Steve Kemp"

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


package SWF::Scripter::Plugin::font;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_font
{
    my $self = shift;
    my ($path) = (@_);

    if ( -e $path )
    {
        $self->{ 'font' } = $path;
    }
    else
    {
        die "Font not found: $path";
    }
}


1;
