

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
