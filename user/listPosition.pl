#!/usr/bin/perl 

########################################################################
# Tim M Strom   February 2007
########################################################################

use strict;
#use lib "/srv/www/cgi-bin/mysql/test";
use Snv;

my $cgiquery     = new CGI;
my $snv          = new Snv;
my $ref          = $cgiquery->Vars;

########################################################################
# main
########################################################################

$snv->printHeader();
my ($dbh) = $snv->loadSessionId();

$ref = $snv->htmlencodehash($ref);

$snv->showMenu();
print "<span class=\"big\">Search results</span><br><br>" ;

$snv->searchResultsPosition2($dbh,$ref);

$dbh->disconnect;

$snv->printFooter();
