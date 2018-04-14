// ************* Credits part *************

// Programmed by Fryns - March 2014

// Uses Write.scad by HarlanDMii, published on Thingiverse 18-Jan-2012 (thing:16193)	 

// ************* Declaration part *************

use <pfeife.scad>;

//settings for the base
resolution=50; 	// Use 20 for draft 100 for nice
basex=150;			// Width of base
basey=54;			// Height of base
basethickness=2;

// select here wich color to render and to export
black = 1;
yellow = 1;

// settings for the letters
letterthickness=1;
lettersize=6 ;
font="orbitron.dxf"; 		// BlackRose.dxf, orbitron.dxf, Letters.dxf

namematrix = [					 		// Matrix with place and names - add as many rows as you like 
	[-14,"Voehler"],
	];

// ************* Executable part *************
use <write/Write.scad>	// remember to download write.scad and fonts

assembly();


// ************* Module part *************

module assembly() {
    if(black == 1) color("yellow") writing();
	if(yellow == 1) color("red") base();
}

module writing(){
	for ( i = [0 : 99] ){				// max 100 names
		if (namematrix[i][0]==undef);	// then do nothing
		else {
			translate([2,10,1.6])
			write(namematrix[i][1],t=letterthickness,h=lettersize,center=true,font=font);		 
            translate([0,0,basethickness/2]) rotate([-90,0,-90]) import("D.stl", convexity=3);;
            translate([0,0,basethickness/2]) rotate([-90,0,-90]) import("L.stl", convexity=3);;
            translate([0,0,basethickness/2]) rotate([-90,0,-90]) import("R.stl", convexity=3);;
            translate([0,0,basethickness/2]) rotate([-90,0,-90]) import("G.stl", convexity=3);;
		}
	}
}


module base(){
    difference() {
		translate([0,0,basethickness/2]) rotate([-90,0,-90])
        pfeife(1);
//        cylinder(1,1,1,$fn=1);
	 //writing();
        translate([0,0,1.5]) cylinder(50,5,5,$fn=50);
    }
}


