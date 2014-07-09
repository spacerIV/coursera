#!/usr/bin/env perl;

use Test::More; 

require_ok( WeightedQuickUnionwithPathCompression );

my $QU = WeightedQuickUnionwithPathCompression->new( 10 );

is ( $QU->connected( 1 ,1 ), 1, " 1 and 1 are connected" );
is ( $QU->connected( 8 ,9 ), 0, " 8 and 9 not are connected" );

$QU->union( 4, 3 );
$QU->union( 3, 8 );
$QU->union( 6, 5 );
$QU->union( 9, 4 );
$QU->union( 2, 1 );

is ( $QU->connected( 8 ,9 ), 1, " 8 and 9 are connected" );
is ( $QU->connected( 5 ,4 ), 0, " 5 and 4 are not connected" );
is ( $QU->connected( 0 ,9 ), 0, " 0 and 9 are not connected" );

$QU->union( 5, 0 );
$QU->union( 7, 2 );
$QU->union( 6, 1 );
$QU->union( 7, 3 );

# now all items should be connected

is ( $QU->connected( 5 ,4 ), 1, " 5 and 4 are connected" );
is ( $QU->connected( 0 ,9 ), 1, " 0 and 9 are connected" );
is ( $QU->connected( 5 ,7 ), 1, " 5 and 7 are connected" );

done_testing();
