difference(){
    cube([160,80,10]);
    //translate([(160-116)/2,(80-71)/2,7.1])
    translate([(160-100)/2-4,(80-71)/2,7.1])
    cube([116,71,3]);
    
    translate([80+4,13,-1])
    cylinder(r=1.5, h=12, $fn=32); // TODO: check radius
    
    translate([80+4,80-13,-1])
    cylinder(r=1.5, h=12, $fn=32); // TODO: check radius
 
    translate([10, (80-65)/2, -1])
    cube([70, 65, 10]);
    
    translate([89, (80-51)/2, -1])
    cube([51, 51, 10]);    
    
    translate([88, (80-65)/2, 1])
    cube([59, 65, 8]);        
}
/*
difference(){
    translate([45-3,0,0])
    cube([6, 80, 3]);
    
    translate([45, 80/2, -1])
    cylinder(r=1.6, h=20, $fn=32);
} */   