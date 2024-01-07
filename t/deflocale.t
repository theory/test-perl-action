#!/usr/bin/perl

use Test::More tests => 1;
use POSIX qw(setlocale LC_ALL);

# This tests the defualt locale returned by setlocale without explicitly setting
# it from the environment.
is setlocale(LC_ALL), $ENV{LC_ALL},
    "setlocale LC_ALL should reeturn $ENV{LC_ALL}";
