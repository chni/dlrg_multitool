difference()
  { MyCube();
    translate([.5,.5,.5]) cylinder(h=2,d=.2,$fn=20,center=true);
  }
module MyCube()
 //hull()
  { color("red")      polyhedron (points=[[0,0,0],[0,1,0],[0,1,1],[0,0,1]],faces=[[0,1,2,3]]);            
    color("yellow")   polyhedron (points=[[1,0,0],[1,1,0],[1,1,1],[1,0,1]],faces=[[0,1,2,3]]);            
    color("green")    polyhedron (points=[[0,0,1],[0,1,1],[1,1,1],[1,0,1]],faces=[[0,1,2,3]]);            
    color("magenta")  polyhedron (points=[[0,1,0],[1,1,0],[1,1,1],[0,1,1]],faces=[[0,1,2,3]]);            
    color("pink")     polyhedron (points=[[0,0,0],[1,0,0],[1,0,1],[0,0,1]],faces=[[0,1,2,3]]);            
    color("purple")   polyhedron (points=[[0,0,0],[0,1,0],[1,1,0],[1,0,0]],faces=[[0,1,2,3]]);  
  } 