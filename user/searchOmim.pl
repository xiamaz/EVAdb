#!/usr/bin/perl 

########################################################################
# Tim M Strom   February 2007
########################################################################

use strict;
#use lib "/srv/www/cgi-bin/mysql/test";
use Snv;

my $snv         = new Snv;
my $cgi         = new CGI;
my $sname       = $cgi->param('sname');

$snv->printHeader("","cgisessid");
my ($dbh) = $snv->loadSessionId();

$sname       = $snv->htmlencode($sname);
my $search      = $snv->initSearchOmim($sname,$dbh);
	
$snv->showMenu("searchOmim");
print "<span class=\"big\">Search</span><br><br>" ;

print "<form action=\"searchOmimDo.pl\" method=\"post\">" ;

$snv->drawMask($search);

print "</form>" ;

$snv->printFooter();
