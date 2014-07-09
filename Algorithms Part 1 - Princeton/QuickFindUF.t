#!/usr/bin/env perl;

use Test::More; 

require_ok( QuickFindUF );

my $QF = QuickFindUF->new( 10 );

is ( $QF->connected( 1 ,1 ), 1, " 1 and 1 are connected" );
is ( $QF->connected( 8 ,9 ), 0, " 8 and 9 not are connected" );

$QF->union( 4, 3 );
$QF->union( 3, 8 );
$QF->union( 6, 5 );
$QF->union( 9, 4 );
$QF->union( 2, 1 );

is ( $QF->connected( 8 ,9 ), 1, " 8 and 9 are connected" );
is ( $QF->connected( 5 ,4 ), 0, " 5 and 4 are not connected" );
is ( $QF->connected( 0 ,9 ), 0, " 0 and 9 are not connected" );

$QF->union( 5, 0 );
$QF->union( 7, 2 );
$QF->union( 6, 1 );
$QF->union( 7, 3 );

# now all items should be connected

is ( $QF->connected( 5 ,4 ), 1, " 5 and 4 are connected" );
is ( $QF->connected( 0 ,9 ), 1, " 0 and 9 are connected" );
is ( $QF->connected( 5 ,7 ), 1, " 5 and 7 are connected" );

done_testing();
