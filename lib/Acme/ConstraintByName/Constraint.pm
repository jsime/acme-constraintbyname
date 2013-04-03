package Acme::ConstraintByName::Constraint;

use strict;
use warnings;

sub description {
    my ($self) = @_;

    return $self->{'description'} if exists $self->{'description'};
    return;
}

sub args {
    my ($self) = @_;

    return @{$self->{'args'}}
        if exists $self->{'args'}
        and ref($self->{'args'}) eq 'ARRAY';
    return;
}

sub hungry {
    my ($self) = @_;

    return 0 if !exists $self->{'num_args'};
    return 1 if @{$self->{'args'}} < $self->{'num_args'};
    return 0;
}

1;
