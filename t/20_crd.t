#! perl

use strict;
use Test::More;

my $base = "20_crd";

if ( -d "t" ) {
    chdir "t";
    $0 =~ s;(^|/)t/;$1;;
}

use lib "../script";
require "differ.pl";

$::__EMBEDDED__ = 1;
require "chordii.pl";

my $test;

my @argv = ( "--noconfig", "--nouserconfig", "--nosysconfig", "$base.cho" );

# Some basic tests.

my $out = "${base}_" . ++$test . ".crd";

@ARGV = ( @argv, "--output=out/$out" );

main( app_setup( "testing", "0.00" ) );

ok( !differ( "out/$out", "ref/$out" ) );

# Single space.

$out = "${base}_" . ++$test . ".crd";

@ARGV = ( @argv, "--single-space", "--output=out/$out" );

main( app_setup( "testing", "0.00" ) );

ok( !differ( "out/$out", "ref/$out" ) );

# Lyrics only.

$out = "${base}_" . ++$test . ".crd";

@ARGV = ( @argv, "--lyrics-only", "--output=out/$out" );

main( app_setup( "testing", "0.00" ) );

ok( !differ( "out/$out", "ref/$out" ) );

done_testing($test);