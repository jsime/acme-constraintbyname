package Acme::ConstraintByName::Constraint::Between;

use strict;
use warnings;

use base 'Acme::ConstraintByName::Constraint';

sub keywords { qw( between betwixt surrounded ); }

sub new {
    my ($class) = @_;

    my $self = bless {}, $class;
    $self->{'description'} = 'Value exists within a given numeric range.';
    $self->{'num_args'} = 2;
    $self->{'args'} = [];
}

sub consume {
    my ($self, $value) = @_;

    if (defined $value and $value =~ m{^-?\d+(\.\d*)?$}o) {
        $self->{'args'} = [sort { $a <=> $b } @{$self->{'args'}}, $value];
    }
}

sub validate {
    my ($self, $value) = @_;

    return 1 if $value >= $self->{'args'}[0] and $value <= $self->{'args'}[1];
    return 0;
}

1;
