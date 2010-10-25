#!/usr/bin/perl
#
#  Test that we can create an output file.
#
# Steve
# --
#

use strict;
use warnings;
use diagnostics;

use File::Temp qw! tempdir !;
use File::Path;
use FindBin qw($Bin);
use lib "$Bin/../lib";

use Test::More tests => 4;
use_ok('SWF::Scripter');
require_ok('SWF::Scripter');

#
#  Create a temporary file.
#
my $dir = tempdir( CLEANUP => 1 );


#
#  Create the object
#
my $obj = SWF::Scripter->new( );
isa_ok( $obj, "SWF::Scripter", "SWF::Scripter identifies itself correctly" );

#
#  Run a simple script:
#
$obj->parse_string( "create 30, 30" );
$obj->parse_string( "save $dir/output.swf" );

ok( -e $dir . "/output.swf", "Created an output SWF file") ;
