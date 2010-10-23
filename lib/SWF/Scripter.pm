
=head1 NAME

SWF::Scripter - A simple scriptable interface to SWF

=cut

=head1 ABOUT

This is a simple dynamic scripter for manipulating the Flash objects
via the M<SWF> module.

The actual implementation of actions is handled by a series of plugins,
each living beneath the 'SWF::Scripter::Plugin::' namespace.

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


package SWF::Scripter;

use vars qw($VERSION);
our $VERSION = "0.2";

# turn on perl's safety features
use strict;
use warnings;


use SWF qw(:ALL);
use Module::Pluggable require => 1;

# create a few methods
use base qw(Class::Accessor::Chained);
__PACKAGE__->mk_accessors(qw( movie ));

# and the accessor
sub new
{
    my $class = shift;
    my $self = bless {}, $class;

    # load plugins
    $self->plugins();

    $self->{ 'movie' } = undef;
    return $self;
}

=begin doc

Given a line of input split it on whitespace, or ",", and attempt to
execute it.

There is special handling to treat:

=for example begin

  repeat( N, input 1, 2, 3, N )

=for example end

As N times "input 1,2,3,N".

=end doc

=cut

sub parse_string
{
    my $self   = shift;
    my $string = shift;

    # for each line of the script
    foreach my $line ( split /\n/, $string )
    {

        # strip leading/trailing space.
        $line =~ s/^\s+|\s+$//g;

        # ignore whitespace and comments
        next if $line =~ /^\s*$/;
        next if $line =~ /^\s*#/;

        # is it: repeat( NN, "stuff"); ?
        if ( $line =~ /repeat\s*\(\s*([0-9]+)\s*,\s*(.*)\)\s*$/ )
        {
            my $count = $1;
            my $cmd   = $2;

            my $cur = 0;
            while ( $cur < $count )
            {
                $self->process_args( split /(\s+|,)/, $cmd );
                $cur += 1;
            }
        }
        else
        {

            # process the line
            $self->process_args( split /(\s+|,)/, $line );
        }
    }
}


=begin doc

Given a command an a number of arguments call the command plugin
which will handle it.

=end doc

=cut

sub process_args
{
    my ( $self, $command, @args ) = (@_);

    # commands are implemented by methods named after
    # the commands prepended with 'command_'
    my $method = "command_$command";

    # do we have a method with the right name?
    unless ( $self->can($method) ) {die "Don't understand command '$command'"}

    my @pass;
    foreach my $arg (@args)
    {
        $arg =~ s/^\s+|\s+$//g;
        next if ( !length($arg) || $arg =~ /^,$/ );

        push( @pass, $arg );
    }

    # run the method for that command
    $self->$method(@pass);
}

#
# create <width> <height>
#
sub command_create
{
    my $self = shift;

    my $width  = shift;
    my $height = shift;

    if ( !defined($width) || !defined($height) )
    {
        print "create should be called with a width & height:\n";
        print " create 320,240\n";
        return;
    }

    SWF::setVersion(6);

    my $m = new SWF::Movie();
    $m->setBackground( 0x00, 0x00, 0x00 );
    $m->setDimension( $width, $height );
    $m->setRate(30);
    $m->setFrames(10);

    $self->{ movie } = $m;
}

#
# save <filename>
#
sub command_save
{
    my $self     = shift;
    my $filename = shift;

    if ( !defined($filename) )
    {
        print "Save should be called with the filename to save as:\n";
        print "   save /tmp/output.swf\n";
        return;
    }

    $self->{ movie }->save($filename);
}

1;
