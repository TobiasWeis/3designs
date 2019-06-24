difference(){
    cube([160,80,10]);
    translate([(160-116)/2,(80-71)/2,7.1])
    cube([116,71,3]);
    
    translate([80,12,-1])
    cylinder(r=1, h=12, $fn=32); // TODO: check radius
    
    translate([80,80-12,-1])
    cylinder(r=1, h=12, $fn=32); // TODO: check radius
 
    translate([10, (80-65)/2, -1])
    cube([65, 65, 10]);
    
    translate([85, (80-65)/2, -1])
    cube([65, 65, 10]);    
}

difference(){
    translate([45-3,0,0])
    cube([6, 80, 3]);
    
    translate([45, 80/2, -1])
    cylinder(r=1.5, h=20, $fn=32);
}    