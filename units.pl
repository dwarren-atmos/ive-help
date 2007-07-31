#!/usr/local/bin/perl
#   This script need to be run once per site to generate units.html
#
open (OUT, ">units.html");
print OUT <<EOF1;	
<head>		
<TITLE>List of units available on this system</TITLE>
</head>
<body>
<H1>Units available on this system</H1>
EOF1
$HERE=0;
open (IN, "</usr/local/etc/udunits.dat");
while(<IN>){
    chop;
    if(substr($_,0,1) eq "#"){
	if(substr($_,0,10) eq "# UNITS OF" || substr($_,0,12) eq "# BASE UNITS" ){
	    if($HERE){
		print OUT "</UL>\n";
		$HERE=0;
	    }
	    s/# //;
	    print OUT "<strong>", $_, "</strong>\n<UL>";
	    $HERE=1;
	}	
    }		
    else{
	if($_ eq ""){
	    ;
	}	
	else{
	    print OUT "<li>", substr($_,0,index($_,"\t")), "\n";
	}
    }		
}		
print OUT "<ul>\n"
