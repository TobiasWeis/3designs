// bumper version 200...

// 15+9 = 24 overall width
// left:middle
// switch: 8-8.2cm

difference(){
    union(){
        cube([120, 1.2, 7]);
        
        // bumper holder
        translate([80-3,1.2,0])
        cube([6,4,1]);
        translate([80-3,1.2,7-1.])
        cube([6,4,1]);    
    
        // connector to part 2
        translate([0,1.2,0])
        cube([5,7,7]);
    }
    
    translate([80,3,-10])
    cylinder(r=1.6, h=30, $fn=200);
    
    translate([2.01,4.5,3.5])
    rotate([0,90,0])
    rotate([0,0,90]){
        cylinder(r=6.1/2, h=3, $fn=6);
        translate([0,0,-10])
        cylinder(r=1.6, h=20,$fn=200);
    }
    
}
