

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
