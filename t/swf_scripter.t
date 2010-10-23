#!/usr/bin/perl

use strict;
use diagnostics;
use Test::More tests => 3;

use FindBin qw($Bin);
use lib "$Bin/../lib";
use_ok('SWF::Scripter');
require_ok('SWF::Scripter');

my $obj = SWF::Scripter->new();
isa_ok( $obj, "SWF::Scripter", "SWF::Scripter has the right type" );


