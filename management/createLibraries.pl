#!/usr/bin/perl 

########################################################################
# Tim M Strom   Sept 2010
########################################################################

use strict;
use CGI;
use CGI::Session;
use CGI::Carp qw(fatalsToBrowser);
use Snvedit;
use DBI;

my $snv         = new Snvedit;
my $cgiquery    = new CGI;
my $search      = $snv->initCreateLibrary();

$snv->printHeader("","cgisessid");
$snv->loadSessionId();
	
$snv->showMenu("createlibraries");
print "<span class=\"big\">Search</span><br><br>" ;

print "<form action=\"../solexa/searchSampleDo.pl\" method=\"post\">" ;

$snv->drawMask($search);

print "</form>" ;

$snv->printFooter();
