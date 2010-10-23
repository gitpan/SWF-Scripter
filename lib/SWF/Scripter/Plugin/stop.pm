

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
