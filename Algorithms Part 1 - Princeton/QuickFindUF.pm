package QuickFindUF;

use strict;
use warnings;

sub new 
{
    my ( $class, $n ) = @_;

    die "enter correct size." if ! $n || $n !~ /\d+/;

    my $id = [];

    # set id of each object to itself ( N array accesses )

    map { $id->[ $_ ] = $_ } ( 0 .. $n - 1 ); 

    my $self->{ id } = $id;

    bless $self, $class;

    return $self;
}

sub connected
{
    my ( $self, $p, $q ) = @_;

    # check if p and q are in the same component ( 2 array accesses )

    return ( $self->{ id }->[ $p ] == $self->{ id }->[ $q ] ) ? 1 : 0;
}

sub union
{
    my ( $self, $p, $q ) = @_;

    # change all entries with id[p] to id[q] ( at most 2N + 2 array accesses )

    my $pid = $self->{ id }->[ $p ];
    my $qid = $self->{ id }->[ $q ];

    for (  0 ..  scalar @{ $self->{ id } } -1 ) 
    {
        $self->{ id }->[ $_ ] = $qid if ( $self->{ id }->[ $_ ] == $pid );
    }
}

1;
