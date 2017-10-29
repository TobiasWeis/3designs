// motor-böcke für roboter

//motoren sind 25mm durchmesser
//und 40mm ist zentrum vom boden weg

module bock(){
    difference(){
        translate([0,-15,20])
        cube([25,20,40],center=true);
        
        //motor
        translate([0,10,45])
        rotate([90,0,0])
        cylinder(r=25/2, h=50);
    }
}

difference(){
    bock();
    
    translate([0,6,3])
    scale([0.9,2,0.8])
    bock();
}
