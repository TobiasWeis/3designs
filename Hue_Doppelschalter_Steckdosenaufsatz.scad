difference(){
    translate([-45,0,0])
    cube([205,80,10]);
    //translate([(160-116)/2,(80-71)/2,7.1])
    
    translate([-37,(80-71)/2,7.1])
    cube([116,71,3]);
    
    difference(){
        translate([-37,(80-60)/2,-2])
        cube([116,60,15]);    
        
        translate([116/2-37,3.5,-1])
        cylinder(r=13.5, h=12, $fn=32);
        
        translate([116/2-37,80-3.5,-1])
        cylinder(r=13.5, h=12, $fn=32);        
    }
    
    translate([116/2-37,13.5,-1])
    cylinder(r=1.5, h=12, $fn=32);
    
    translate([116/2-37,80-13.5,-1])
    cylinder(r=1.5, h=12, $fn=32);
    
    translate([88+(64-51)/2, (80-51)/2, -1])
    cube([51, 51, 10]);    
    
    translate([88, (80-65)/2, 1])
    cube([64, 64, 12]);        
}
 // TODO: check radius

/*
difference(){
    translate([45-3,0,0])
    cube([6, 80, 3]);
    
    translate([45, 80/2, -1])
    cylinder(r=1.6, h=20, $fn=32);
} */   