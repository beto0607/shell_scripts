#!/bin/perl
# @author: beto0607



use strict;
use warnings;

if($#ARGV + 1 < 1) {
	print "You must provide at least the app name\n";
	exit 1;
}
my ($appName, @rest) = @ARGV;

print "App name: $appName\n";
my $options = join(' ', @rest);

print "Following options were provided $options\n" if($options);

print "npx create-react-app $appName $options\n";
system("npx create-react-app $appName $options");

chdir("$appName");

print "Adding react-redux\n";
system("yarn add react-redux");

if($options =~ /typescript/){
	print "Adding \@types/react-redux \n";
	system('yarn add -D @types/react-redux');
}

print "Creating folders...\n";
mkdir("src/components");
mkdir("src/layout");
mkdir("src/scss_common");
mkdir("src/actions");
mkdir("src/types");
mkdir("src/store");
mkdir("src/reducers");
mkdir("src/utils");

print "Finished.\nEnjoy!\n";
