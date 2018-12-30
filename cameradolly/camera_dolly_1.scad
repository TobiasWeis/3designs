// camera dolly

difference(){
    cube([145, 15, 14], center=true);
    
    // axles
    translate([65,0,0])
    rotate([90,0,0])
    cylinder(r=4.1, h=100, $fn=50, center=true);
    
    translate([-65,0,0])
    rotate([90,0,0])
    cylinder(r=4.2, h=100, $fn=50, center=true);    
    
    // camera screw
    hull(){
        translate([-50,0,0])
        cylinder(r=3.3, h=30, $fn=30, center=true);
        translate([50,0,0])
        cylinder(r=3.3, h=30, $fn=30, center=true);        
    }
    
    // camera screw head
    hull(){
        translate([-50,0,5])
        cylinder(r=5, h=7, $fn=30, center=true);
        translate([50,0,5])
        cylinder(r=5, h=7, $fn=30, center=true);        
    }    
}