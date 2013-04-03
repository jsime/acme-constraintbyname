package Acme::ConstraintByName;

use 5.006;
use strict;
use warnings;

use PadWalker qw( peek_my );

=head1 NAME

Acme::ConstraintByName - Descriptive variable names have never been more constraining!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

This module provides an automatically-enforced variable constraint system that doesn't
make you pass in a bunch of settings to some fancy-pants Moose module. Just put your
constraints in your variable name, instead. And since it's all part of the name, you'll
never forget what your variable is allowed to hold each time you use it. Self-documenting
code!

    use Acme::ConstraintByName;

    my $scalar_which_contains_integers_between_10_and_5000_divisible_by_37_point_2 = Acme::ConstraintByName->new();

    # This will work
    $scalar_which_contains_integers_between_10_and_5000_divisible_by_37_point_2 = 558;

    # This will die()
    $scalar_which_contains_integers_between_10_and_5000_divisible_by_37_point_2 = 56;

For now, this module only supports scalars. Debate is ongoing whether to extend the
insanity to hash and array references.

Once you have created your Acme::ConstraintByName object, you may use the variable more
or less like a normal scalar. Assignment is overloaded to enforce the constraints, but
it will evaluate as a regular scalar in all other access contexts.

=head1 SUBROUTINES/METHODS

=head2 new

Returns a new Acme::ConstraintByName object, with internally-enforced constraints
as defined by the name of the variable you are holding the object in. Accepts no
arguments and dies if it cannot figure out the name of the holding variable or
parse your constraint description.

Currently only supports scalars, and variables initialized with C<my>.

=cut

sub new {
    my $class = shift;

    my $self = bless {}, $class;

    return $self;
}

=head1 CONSTRAINTS

Constraints follow a relatively basic syntax. The module supports a variety of keywords
that will take constraint-dependent arguments, all as part of the variable name. Underscores
are used exclusively to separate the words.

Words in the variable name that are not expected are simply discarded. Just in case you want
to be even more verbose than this module already forces you to be. I like to provide choices.
Only bad choices, but choices none the less.

=head2 contains @types

Example: $scalar_contains_integers_and_floats

Accepts one or more arguments, from the following: integers, floats, strings, hashrefs, arrayrefs.

=head2 between num1 num2

Example: $scalar_between_50_and_2000

Accepts two arguments (the "and" is optional and not counted toward that limit, but the
additional verbosity is well within the spirit of this module). They can be low or high first,
and can be anything that will 

=head1 AUTHOR

Jon Sime, C<< <jonsime at gmail.com> >>

=head1 TODO

=over 4

=item * Add support for array and hash references.

=item * Add more constraint types.

=item * It's just so confusing to be forced to mix letters and numbers in the same variable name. Wouldn't it be easier if $scalar_with_floats_between_one_point_five_zero_three_and_seventy_point_nine worked?

=item * Extend the syntax to allow more complex constraints. Right now they're all AND-ed together, but wouldn't it just be grand if $scalar_with_integers_between_1_and_10000_or_greater_than_fifty_million worked?

=item * Delete this module from CPAN, close my GitHub account, burn every computer on which I ever worked on this code, enter a monastery and perform penance for my remaining years.

=back

=head1 BUGS

A bug in this module should really be the least of your concerns. Your biggest problem
would be using the thing in the first place.

But if you must, please use the GitHub issue tracker to submit requests and bug reports:

L<https://github.com/jsime/acme-constraintbyname/issues>

=head1 SUPPORT

You think I'm going to provide support for this monstrosity? Good luck with that.

If you really insist, you can always get the included documentation once the module
is installed.

    perldoc Acme::ConstraintByName


You can also look for information at:

=over 4

=item * Official development repo on GitHub

L<https://github.com/jsime/acme-constraintbyname>

=item * Search CPAN

L<http://search.cpan.org/dist/Acme-ConstraintByName/>

=back


=head1 ACKNOWLEDGEMENTS

I'm only hurting my own career with this module. Certainly nobody else is going to
want to be associated with it. That being said, the idea came about after hearing a
coworker's complaint that the code they were reviewing had unnecessarily shortened
variable names (words like "daily" being written "dly"). I wondered what it would
be like to have something that forced you to go far into the extreme of the other
direction.

While this module doesn't technically force you to do so (you could, after all,
create an Acme::ConstraintByName object with no constraints and just use it
almost like a normal scalar variable), it certainly encourages really horrible
practices. And carpal tunnel.

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Jon Sime.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1;
