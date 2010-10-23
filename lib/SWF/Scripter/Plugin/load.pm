

package SWF::Scripter::Plugin::load;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_load
{
    my $self = shift;
    my ( $x, $y, $file ) = (@_);

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
