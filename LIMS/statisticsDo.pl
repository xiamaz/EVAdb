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

my $cgiquery     = new CGI;
my $ref          = $cgiquery->Vars;
my $solexa        = new Solexa;

########################################################################
# main
########################################################################

$solexa->printHeader();
my $dbh=$solexa->loadSessionId();

$solexa->showMenu('statistics');
#print "<span class=\"big\">Statistics</span><br><br>" ;

$solexa->searchErrorRate($dbh,$ref);

$dbh->disconnect;

$solexa->printFooter();
