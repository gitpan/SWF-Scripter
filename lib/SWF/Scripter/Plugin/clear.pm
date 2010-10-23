

package SWF::Scripter::Plugin::clear;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_clear
{
    my $self = shift;

    my ( $r, $g, $b ) = (@_);

    $self->movie()->setBackground( $r, $g, $b );
}


1;
