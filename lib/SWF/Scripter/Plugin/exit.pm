

package SWF::Scripter::Plugin::exit;
use base qw(Class::Accessor::Chained);


sub SWF::Scripter::command_exit
{
    exit 0;
}


1;
