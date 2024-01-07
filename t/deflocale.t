#!/usr/bin/perl

use Test::More tests => 1;
use POSIX qw(setlocale LC_ALL);

# This tests the defualt locale returned by setlocale without explicitly setting
# it from the environment.
if ($ENV{LC_ALL}) {
    is setlocale(LC_ALL), $ENV{LC_ALL},
        "setlocale LC_ALL should be $ENV{LC_ALL}";
} else {
    like setlocale(LC_ALL), qr/^[^.]+[.][^.]+$/,
        "setlocale LC_ALL should look like a locale";
}
