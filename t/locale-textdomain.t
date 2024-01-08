#!/usr/bin/perl

use Test::More tests => 1;
use locale;
use Locale::TextDomain 1.20 qw(App-Sqitch);
use Locale::Messages qw(bind_textdomain_filter);

# This tests the that Locale::TextDomain properly reads the locale from the
# environment. LC_ALL must be set.
BEGIN {
    # Force Locale::TextDomain to encode in UTF-8 and to decode all messages.
    $ENV{OUTPUT_CHARSET} = 'UTF-8';
    bind_textdomain_filter 'App-Sqitch' => \&Encode::decode_utf8, Encode::FB_DEFAULT;
}

my $lang = $ENV{LC_ALL} || '';

my $msg = __x(
    '"{command}" is not a valid command',
    command => 'elbow',
);

diag $lang;
my $expect = $lang =~ /^fr/i ? q{"elbow" n'est pas une commande valide}
           : $lang =~ /^de/i ? q{"elbow" ist ein ungültiger Befehl}
           : $lang =~ /^it/i ? q{"elbow" non è un comando valido}
           :                   q{"elbow" is not a valid command};

is $msg, $expect, "Message should be '$expect'";
