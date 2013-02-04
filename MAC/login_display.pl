#!env perl
#
$|=1;
#
my %FACTS;
open (PFH, "facter 2>&1 |");
foreach my $line (<PFH>)
	{
	next if !grep (/ => /,$line);
	chomp $line;
	my ($key,$value) = split(/ => /,$line);
	$FACTS{$key}=$value;
	}
close PFH;
#
print  "resources availabe with versions...\n";
printf "%10s - %-49s %s\n", "----------","------------------------------------------------","---------------";
if ( $FACTS{"has_sqlite3"}      = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", "*","sqlite3", $FACTS{"sqlite3"}, $FACTS{"sqlite3_version"},"*"; }
if ( $FACTS{"has_git"}          = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", "*","git", $FACTS{"git"}, $FACTS{"git_version"},"*"; }
if ( $FACTS{"has_ruby"}         = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", "*","ruby", $FACTS{"ruby"}, $FACTS{"ruby_version"},"*";
	if ( $FACTS{"has_rvm"}      = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", " ","rvm", $FACTS{"rvm"}, $FACTS{"rvm_version"}; }
	}
if ( $FACTS{"has_perl"}         = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", "*","perl", $FACTS{"perl"}, $FACTS{"perl_version"},"*";
	if ( $FACTS{"has_perlbrew"} = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", " ","perlbrew", $FACTS{"perlbrew"}, $FACTS{"perlbrew_version"}; }
	if ( $FACTS{"has_cpanm"}    = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", " ","cpanm", $FACTS{"cpanm"}, $FACTS{"cpanm_version"}; }
	}
if ( $FACTS{"has_python"}       = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", "*","python", $FACTS{"python"}, $FACTS{"python_version"},"*"; }
if ( $FACTS{"has_nodejs"}       = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", "*","nodeJS", $FACTS{"nodejs"}, $FACTS{"nodejs_version"},"*";
	if ( $FACTS{"has_npm"}      = "TRUE" ) { printf "%1s %8s = %-49s v%-12s %s\n", " ","npm", $FACTS{"npm"}, $FACTS{"npm_version"}; }
	}
printf "%10s - %-49s %s\n", "----------","------------------------------------------------","---------------";
