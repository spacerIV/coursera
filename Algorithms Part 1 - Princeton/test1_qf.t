#!/usr/bin/env perl;

use Test::More; 
use Data::Dumper; 

require_ok( QuickFindUF );

my $QF = QuickFindUF->new( 10 );

is ( $QF->connected( 1 ,1 ), 1, " 1 and 1 are connected" );
is ( $QF->connected( 8 ,9 ), 0, " 8 and 9 not are connected" );

$QF->union( 4, 2 );
$QF->union( 4, 9 );
$QF->union( 0, 2 );
$QF->union( 5, 8 );
$QF->union( 4, 3 );
$QF->union( 1, 3 );

diag Dumper $QF->{ id };

done_testing();
