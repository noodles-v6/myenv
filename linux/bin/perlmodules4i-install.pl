#!/usr/bin/perl 
#
# install the favourite Perl modules in my life.
#

use strict;
use warnings;
use ExtUtils::Installed;

# add your modules int this array.
my @modules= qw/
YAML
Moo 
Dancer
Foo
WWW::Wikipedia
csv
Text::CSV
Text::CSV::Slurp
Perl::Tidy
Data::Printer
Here::Template
Log::Any
/;

my $inst = ExtUtils::Installed->new();
my @instaled_modules = $inst->modules();

# install modules
for my $m (@modules) {
    print `sudo cpan -f -i $m` if !grep($m, @instaled_modules);
}

# print the list for all modules installed fail.
my %instaled_modules = map { $_ => 1} $inst->modules();
my @failed = grep( !defined $instaled_modules{$_}, @modules );

if (scalar @failed) {
    print "Warning: some modules were installed fail!\n";
    print "  - $_\n" for @failed;
} else {
    print "all modules were installed ok\n";
}
