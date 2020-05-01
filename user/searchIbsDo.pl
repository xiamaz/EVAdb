#!/usr/bin/perl 

########################################################################
# Tim M Strom   Sept 2010
########################################################################

use strict;
#use lib '/srv/www/cgi-bin/mysql/test';
use Snv;

my $cgiquery    = new CGI;
my $ref         = $cgiquery->Vars;

my $snv        	= new Snv;

########################################################################
# main
########################################################################

$snv->printHeader();
my ($dbh) = $snv->loadSessionId();

$ref = $snv->htmlencodehash($ref);

$snv->showMenu('searchIbs');
print "<span class=\"big\">Search results</span><br><br>" ;

$snv->searchResultsIbs($dbh,$ref);

$dbh->disconnect;

$snv->printFooter();
