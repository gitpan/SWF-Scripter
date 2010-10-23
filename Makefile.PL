# $Id$

use strict;
use lib './t/lib';
use ExtUtils::MakeMaker;

my %prereq_pm = (
    'Test::More'               => undef,
    'Module::Pluggable'        => undef,
    'Class::Accessor::Chained' => undef,
    'SWF'                      => undef,
);

WriteMakefile(
    NAME            => 'SWF::Scripter',
    EXE_FILES      => ['bin/swf-scripter'],
    VERSION_FROM    => 'lib/SWF/Scripter.pm',
    PREREQ_PM       => \%prereq_pm,
    ABSTRACT        => 'Simple script interface to SWF',
    AUTHOR          => 'Steve Kemp <steve@steve.org.uk>',
);


package MY;
use strict;

sub postamble {
    return <<'MAKE_TEXT';
prepare_dist ::	metafile manifest dist
	$(NOECHO) $(NOOP)
MAKE_TEXT
}

sub libscan {
    my ($self, $path) = @_;
    return '' if $path =~ m/\.svn/;
    return $path;
}

