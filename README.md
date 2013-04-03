# NAME

Acme::ConstraintByName - Descriptive variable names have never been more constraining!

# VERSION

Version 0.01

# SYNOPSIS

This module provides an automatically-enforced variable constraint system that doesn't
make you pass in a bunch of settings to some fancy-pants Moose module. Just put your
constraints in your variable name, instead. And since it's all part of the name, you'll
never forget what your variable is allowed to hold each time you use it. Self-documenting
code!

    use Acme::ConstraintByName;

    my $scalar_which_contains_integers_between_10_and_5000_divisible_by_37_point_2;
    $scalar_which_contains_integers_between_10_and_5000_divisible_by_37_point_2 = Acme::ConstraintByName->new();

    # This will work
    $scalar_which_contains_integers_between_10_and_5000_divisible_by_37_point_2 = 558;

    # This will die()
    $scalar_which_contains_integers_between_10_and_5000_divisible_by_37_point_2 = 56;

The most obvious limitation of this module at the current time is that you must
initialize the variable name as a distinct statement from assigning the object
reference to it. This is unfortunately due to the need for the variable to be in
the symbol table so that Acme::ConstraintByName may find it. I have some pretty
disgusting ideas on how to remove this limitation in a future release.

For now, this module only supports scalars. Debate is ongoing whether to extend the
insanity to hash and array references.

Once you have created your Acme::ConstraintByName object, you may use the variable more
or less like a normal scalar. Assignment is overloaded to enforce the constraints, but
it will evaluate as a regular scalar in all other access contexts.

# NAMING CONVENTIONS

As if you couldn't guess, this module will do some incredibly horrible things to
achieve its goals. Truly horrible, shameful things.

For the time being, there is one strict naming convention that must be followed for
the module to not fail even more miserably than it's actually supposed to. The names
of all Acme::ConstraintByName objects must begin with "{type}\_with\_" or
"{type}\_which\_contains\_", where {type} should be the Perl type `scalar`, `arrayref`
or `hashref` (though only scalar is currently supported). And yes, I am fully aware
that all three of those are actually scalars. You've read this far through the
POD without having me tried before the World Court in the Hague, which I believe is
proof enough that your judgment and decisions in life are almost as damnable as
my laziness in using proper Perl nomenclature, so pipe down.

If you want to know why this basic naming convention is required, I suggest you
call your shrink, or find a new line of work.

# SUBROUTINES/METHODS

## new

Returns a new Acme::ConstraintByName object, with internally-enforced constraints
as defined by the name of the variable you are holding the object in. Accepts no
arguments and dies if it cannot figure out the name of the holding variable or
parse your constraint description.

Currently only supports scalars, and variables initialized with `my`.

# CONSTRAINTS

Constraints follow a relatively basic syntax. The module supports a variety of keywords
that will take constraint-dependent arguments, all as part of the variable name. Underscores
are used exclusively to separate the words.

Words in the variable name that are not expected are simply discarded. Just in case you want
to be even more verbose than this module already forces you to be. I like to provide choices.
Only bad choices, but choices none the less.

## contains @types

Example: $scalar\_contains\_integers\_and\_floats

Accepts one or more arguments, from the following: integers, floats, strings, hashrefs, arrayrefs.

## between num1 num2

Example: $scalar\_between\_50\_and\_2000

Accepts two arguments (the "and" is optional and not counted toward that limit, but the
additional verbosity is well within the spirit of this module). They can be low or high first,
and can be anything that will 

# METHODS

When you tire of accessing or setting the value of the Acme::ConstraintByName object as if it
were a normal scalar variable, you may find some of the following methods of interest.

## constraints

Returns an array of constraints applied to the value contained with the object.
These are provided as Acme::ConstraintByName::Constraint::\* objects.

## name

Returns the full name of the variable which holds the object reference.

# AUTHOR

Jon Sime, `<jonsime at gmail.com>`

# TODO

- Remove need to 'my' an undefined variable before assigning the object reference to it.
- Add support for array and hash references.
- Add more constraint types.
- It's just so confusing to be forced to mix letters and numbers in the same variable name. Wouldn't it be easier if $scalar\_with\_floats\_between\_one\_point\_five\_zero\_three\_and\_seventy\_point\_nine worked?
- Extend the syntax to allow more complex constraints. Right now they're all AND-ed together, but wouldn't it just be grand if $scalar\_with\_integers\_between\_1\_and\_10000\_or\_greater\_than\_fifty\_million worked?
- Delete this module from CPAN, close my GitHub account, burn every computer on which I ever worked on this code, enter a monastery and perform penance for my remaining years.

# BUGS

A bug in this module should really be the least of your concerns. Your biggest problem
would be using the thing in the first place.

But if you must, please use the GitHub issue tracker to submit requests and bug reports:

[https://github.com/jsime/acme-constraintbyname/issues](https://github.com/jsime/acme-constraintbyname/issues)

# SUPPORT

You think I'm going to provide support for this monstrosity? Good luck with that.

If you really insist, you can always get the included documentation once the module
is installed.

    perldoc Acme::ConstraintByName



You can also look for information at:

- Official development repo on GitHub

    [https://github.com/jsime/acme-constraintbyname](https://github.com/jsime/acme-constraintbyname)

- Search CPAN

    [http://search.cpan.org/dist/Acme-ConstraintByName/](http://search.cpan.org/dist/Acme-ConstraintByName/)



# ACKNOWLEDGEMENTS

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

# LICENSE AND COPYRIGHT

Copyright 2013 Jon Sime.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.
