package WeightedQuickUnionwithPathCompression;

=pod

Two pass implementation: add second loop to _root() to set the id[] 
of each examined node to the root.

One pass implementation: simpler, make every other node in path point to its grandparent ( thereby halving path length )
just one extra line of code in _root().


=cut

use strict;
use warnings;

sub new 
{
    my ( $class, $n ) = @_;

    die "enter correct size." if ! $n || $n !~ /\d+/;

    my $id = [];

    # set id of each object to itself ( N array accesses )

    map { $id->[ $_ ] = $_ } ( 0 .. $n ); 

    # extra array to count the number of objects in the tree rooted at i

    my $sz = [ ]; 

    map { $sz->[ $_ ] = 1 } ( 0 .. $n ); 

    my $self->{ id } = $id;

    $self->{ sz } = $sz;

    bless $self, $class;

    return $self;
}

sub _root
{
    my ( $self, $i ) = @_;

    my $id = $self->{ id };

    # chase parent pointers until reach root ( depth of i array accesses )
    
    while ( $i != $id->[ $i ] ) 
    {
        $id->[ $i ] = $id->[ $id->[ $i ] ];             ## one line change!
        $i = $id->[ $i ];
    }

    $self->{ id } = $id;

    return $i;
}

sub connected
{
    my ( $self, $p, $q ) = @_;

    # check if p and q have same root ( depth of p & q array accesses )

    return ( $self->_root( $p ) == $self->_root( $q ) ) ? 1 : 0;
}

sub union
{
    my ( $self, $p, $q ) = @_;

    # change root of p to point to root of q ( depth of p & q array accesses )

    my $i = $self->_root( $p );
    my $j = $self->_root( $q );

    # now link root of smaller tree to root of larger tree
    
    # and update sz[] array.

    if ( $self->{ sz }->[ $i ] < $self->{ sz }->[ $j ] )
    {
        $self->{ id }->[ $i ] = $j; 
	$self->{ sz }->[ $j ] += $self->{ sz }->[ $i ];
    }
    else
    {
        $self->{ id }->[ $j ] = $i; 
	$self->{ sz }->[ $i ] += $self->{ sz }->[ $j ];

    }
}

1;
