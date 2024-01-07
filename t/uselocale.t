#!/usr/bin/perl

use Test::More tests => 2;
use POSIX qw(setlocale LC_ALL LC_TIME);
use locale;

# This tests the locale returned by setlocale after `use local` sets it from the
# environment. LC_ALL must be set.
is setlocale(LC_ALL), $ENV{LC_ALL},
    "setlocale LC_ALL should be $ENV{LC_ALL}";
is setlocale(LC_TIME), $ENV{LC_ALL},
    "setlocale LC_TIME should return $ENV{LC_ALL}";
