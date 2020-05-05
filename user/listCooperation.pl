#!/usr/bin/perl -w

########################################################################
# Tim M Strom   February 2007
########################################################################

use strict;
#use lib "/srv/www/cgi-bin/mysql/test";
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use Snv;

my $cgi          = new CGI;
my $ref          = $cgi->Vars;
my $snv          = new Snv;

########################################################################
# main
########################################################################

$snv->printHeader();
my ($dbh) = $snv->loadSessionId();

$snv->showMenu("listCooperation");
print "<span class=\"big\">Search results</span><br><br>" ;

$snv->listCooperation($dbh,$ref);

$dbh->disconnect;

$snv->printFooter();
