#!/usr/bin/perl 

########################################################################
# Tim M Strom   February 2007
########################################################################

use strict;
use CGI;
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use CGI::Carp qw(fatalsToBrowser);
use Solexa;

########################################################################
# global variables
########################################################################

my $cgiquery        = new CGI;
my $ref             = $cgiquery->Vars;
my $solexa          = new Solexa;

########################################################################
# main
########################################################################

$solexa->printHeader;
my $dbh=$solexa->loadSessionId();

# delete beginning and trailing space
$solexa->deleteSpace($ref);

if ($ref->{mode} eq "edit") {
	delete($ref->{"mode"});
	$solexa->editRun($ref,$dbh,'run');
}
else {
	delete($ref->{"mode"});
	$solexa->insertIntoRun($ref,$dbh,'run');
}

# select and display new entry
$solexa->showMenu();


$solexa->showAllRun($dbh,$ref->{rid});


$solexa->printFooter();

