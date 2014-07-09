#!/usr/bin/env perl;

use Test::More; 
use Data::Dumper; 

require_ok( WeightedQuickUnion );

my $QU = WeightedQuickUnion->new( 10 );

is ( $QU->connected( 1 ,1 ), 1, " 1 and 1 are connected" );
is ( $QU->connected( 8 ,9 ), 0, " 8 and 9 not are connected" );

$QU->union( 2, 1 );
$QU->union( 0, 4 );
$QU->union( 0, 5 );
$QU->union( 6, 3 );
$QU->union( 7, 4 );
$QU->union( 9, 4 );
$QU->union( 2, 6 );
$QU->union( 2, 5 );
$QU->union( 1, 8 );

diag Dumper $QU->{ id };

done_testing();
