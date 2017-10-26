// skytree base

module flat_heart() {
  square(20);

  translate([10, 20, 0])
  circle(10);

  translate([20, 10, 0])
  circle(10);
}

module myfont(){
        textsize = 6;
    anglestep = 24;
    dist = -18;
    
    rotate([0,0,0])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("T", size=textsize);
   
    rotate([0,0,anglestep*2])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("M", size=textsize);    
    
    rotate([0,0,anglestep*4])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("2", size=textsize); 
    
    rotate([0,0,anglestep*5])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("0", size=textsize); 
    
    rotate([0,0,anglestep*6])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("1", size=textsize);    
    
    rotate([0,0,anglestep*7])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("7", size=textsize); 

    rotate([0,0,anglestep*9])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("T", size=textsize);     

    rotate([0,0,anglestep*10])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("O", size=textsize);     
    
    rotate([0,0,anglestep*11])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("K", size=textsize);

    rotate([0,0,anglestep*12])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("Y", size=textsize);   

    rotate([0,0,anglestep*13])
    translate([-1.75,dist,0])
    linear_extrude(height = 1)
    text("O", size=textsize);         
    
    rotate([0,0,anglestep])
    translate([1,dist,0])
    rotate([0,0,45])
    scale([0.15,0.15,1])
    linear_extrude(height = 1)
    flat_heart();
}

union(){
    translate([0,0,-3.2])
    cylinder(r=20,h=3.2,$fn=200);
    //#cylinder(r=10,h=1,$fn=200);
    difference(){
        cylinder(r=(3.8+4.5)/2,h=4.5,$fn=200);
        translate([0,0,0.51])
        cylinder(r=4.6/2, h=4, $fn=200);
    }
    myfont();
}