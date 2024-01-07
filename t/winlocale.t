#!/usr/bin/perl

use Test::More;
use POSIX qw(setlocale LC_ALL LC_TIME);

if ($^O eq 'MSWin32') {
    plan tests => 2;
} else {
    plan skip_all => 'Test relevant only on Windows';
}

# This tests the result of using Win32::Locale with setlocale to set the locale
# from the environment. LC_ALL must be set.
require Win32::Locale;

my $locale = Win32::Locale::get_locale();
is setlocale(LC_ALL, $locale), $locale,
    "setlocale LC_ALL '$locale' should return $locale";
is setlocale(LC_TIME), $locale,
    "setlocale LC_TIME should return $locale";
