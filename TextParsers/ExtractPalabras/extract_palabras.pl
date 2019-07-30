#!/usr/bin/perl

if ($#ARGV + 1 < 2 ) {
	print "You must provide the input and output files.\n";
	exit;
}

open(INPUT_FILE, $ARGV[0]);

@words= ();
while ($line = <INPUT_FILE>) {
	# Captures the word in an anchor tag 
	if($line =~ /<li><a.*>(\w+)<\/a>/){
		if(length($1) > 3){
			push @words, $1;
		}
	}
}
close(INPUT_FILE);

$last_word = pop(@words);

open(OUTPUT_FILE, '>'.$ARGV[1]);

print OUTPUT_FILE "[\n";
foreach my $word(@words) {
    print OUTPUT_FILE "\t\"$word\",\n";
}
print OUTPUT_FILE "\t\"$last_word\"\n";
print OUTPUT_FILE "]\n";
close(OUTPUT_FILE);

