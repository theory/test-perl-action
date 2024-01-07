#!/usr/bin/perl

use Test::More tests => 1;
use POSIX qw(setlocale LC_ALL);

# This tests the result of using setlocale to set the locale from the
# environment. LC_ALL must be set.
is setlocale(LC_ALL, ""), $ENV{LC_ALL},
    "setlocale LC_ALL '' should return $ENV{LC_ALL}";
