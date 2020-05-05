#!/usr/bin/perl 

########################################################################
# Tim M Strom   February 2011
########################################################################

use strict;
use CGI;
use Cwd qw( abs_path );
use File::Basename qw( dirname );
use lib dirname(abs_path($0));
use CGI::Carp qw(fatalsToBrowser);
use Solexa;

my $samples      = new Solexa;

########################################################################
# main
########################################################################

$samples->printHeader;
my $dbh=$samples->loadSessionId();

$samples->showMenu();
print "<span class=\"big\">Make Pool</span><br><br>" ;

print qq#
<form action="makePoolDo.pl" method="post" enctype="multipart/form-data">
Comma separated csv-file (Position,Barcode)<br /> 
First line: Rack<br /> 
New Pool in A01<br /> 
Nothing is stored in this step<br /> 
<input name="file" type="file" size="50" maxlength="500000" accept="text/*"><br /><br />
<input type=submit name=submit value=submit>
</form>
#;

$samples->printFooter();
