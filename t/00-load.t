#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Acme::ConstraintByName' ) || print "Bail out!\n";
}

diag( "Testing Acme::ConstraintByName $Acme::ConstraintByName::VERSION, Perl $], $^X" );
