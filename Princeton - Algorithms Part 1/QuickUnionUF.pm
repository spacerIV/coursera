package QuickUnionUF;

use strict;
use warnings;
use feature 'say';

use Data::Dumper;

sub new 
{
    my ( $class, $n ) = @_;

    die "enter correct size." if ! $n || $n !~ /\d+/;

    my $id = [];

    # set id of each object to itself ( N array accesses )

    map { $id->[ $_ ] = $_ } ( 0 .. $n ); 

    my $self->{ id } = $id;

    bless $self, $class;

    return $self;
}

sub _root
{
    my ( $self, $i ) = @_;

    # chase parent pointers until reach root ( depth of i array accesses )
    
    while ( $i != $self->{ id }->[ $i ] ) 
    {
        $i = $self->{ id }->[ $i ];
    }

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

    $self->{ id }->[ $i ] = $j;
}

1;
