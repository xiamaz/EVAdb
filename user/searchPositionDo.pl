#!/usr/bin/perl 

########################################################################
# Tim M Strom   February 2007
########################################################################

use strict;
#use lib '/srv/www/cgi-bin/mysql/test';
use Snv;

my $cgiquery     = new CGI;
my $ref          = $cgiquery->Vars;

my $snv        = new Snv;

########################################################################
# main
########################################################################

$snv->printHeader();
my ($dbh) = $snv->loadSessionId();

$ref = $snv->htmlencodehash($ref);

$snv->showMenu('searchPosition');
print "<span class=\"big\">Search results</span><br><br>" ;

$snv->searchResultsPosition($dbh,$ref);

$dbh->disconnect;

$snv->printFooter();
