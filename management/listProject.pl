#!/usr/bin/perl

########################################################################
# Tim M Strom   Oct 2010
########################################################################

use strict;
use CGI;
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use CGI::Carp qw(fatalsToBrowser);
use Snvedit;
use DBI;

my $cgiquery     = new CGI;
my $ref          = $cgiquery->Vars;

my $snv          = new Snvedit;

########################################################################
# main
########################################################################

$snv ->printHeader();
my $dbh = $snv ->loadSessionId();

$snv ->showMenu("listProject");
print "<span class=\"big\">Search results</span><br><br>" ;

$snv ->listProject($dbh,$ref);

$dbh->disconnect;

$snv ->printFooter();
