#!/usr/bin/perl 

########################################################################
# Tim M Strom   Sept 2010
########################################################################

use strict;
#use lib "/srv/www/cgi-bin/mysql/test";
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use Snv;

my $cgi        = new CGI;
my $idsample   = $cgi->param('idsample');
my $snv        = new Snv;

########################################################################
# main
########################################################################

$snv->printHeader();
my ($dbh) = $snv->loadSessionId();

$snv->showMenu('searchHPO');
print "<span class=\"big\">HPO</span><br><br>" ;

$idsample      = $snv->htmlencode($idsample);
$snv->showHPO($dbh,$idsample);

$dbh->disconnect;

$snv->printFooter();
