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

// select herstle wich color to render and to export
letters = 1;
plate = 1;
stl = 1;

// settings for the letters
letterthickness=0.4;
lettersize=6 ;
font="orbitron.dxf"; 		// BlackRose.dxf, orbitron.dxf, Letters.dxf

namematrix = [					 		// Matrix with place and names - add as many rows as you like 
	[-14,"Achim"],
	];

// ************* Executable part *************
use <write/Write.scad>	// remember to download write.scad and fonts

assembly();


// ************* Module part *************

module assembly() {
    if(letters == 1){
        color("black"){
        writing();
        translate([0,0,0.935]) rotate([-90,0,-90]) import("D.stl", convexity=3);;
        translate([0,0,0.935]) rotate([-90,0,-90]) import("L.stl", convexity=3);;
        translate([0,0,0.935]) rotate([-90,0,-90]) import("R.stl", convexity=3);;
        translate([0,0,0.935]) rotate([-90,0,-90]) import("G.stl", convexity=3);;
        }
    }
	
    if(plate == 1) base();
    if(stl == 1){
        translate([0,0,basethickness/2]) rotate([-90,0,-90]) import("rotml.stl", convexity=3);
    }
}

module writing(){
	for ( i = [0 : 99] ){				// max 100 names
		if (namematrix[i][0]==undef);	// then do nothing
		else {
			translate([-19.3,8,1.6])
			write(namematrix[i][1],t=letterthickness,h=lettersize,center=false,font=font);
		}
	}
}



module base(){
            difference() {
                translate([-20,7.58,1.60])	cube(size = [58,7.2,letterthickness]);
                writing();
            }         
}


