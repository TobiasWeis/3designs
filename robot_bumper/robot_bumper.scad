module loch(){
        // führungslöcher
        rotate([0,90,0])
        cylinder(r=5, h=15, $fn=6);
    
        translate([0,0,5])
        rotate([0,90,0])
        cylinder(r=3,h=15, $fn=6);
    
        translate([0,0,8])
        rotate([0,90,0])
        cylinder(r=3,h=15, $fn=6);    
}
   
module base(){
    difference(){
        union(){
            cube([30, 30,5]);
            translate([30,0,0])
            cube([5,30,50]);
        }
        
        translate([25,7,10])
        loch();
        
        translate([25,23,10])
        loch();
        
        translate([25,7,35])
        loch();
        
        translate([25,23,35])
        loch();
        
        // schraublöcher
        translate([7,7,-1])
        cylinder(r=1.6, h=15, $fn=200);
        
        translate([30-7,30-7,-1])
        cylinder(r=1.6, h=15, $fn=200);        
    }
}

module stange(){
    rotate([0,90,0])
    cylinder(r=2.8, h=20, $fn=6);
    
    translate([-3,0,0])
    rotate([0,90,0])
    cylinder(r=4.7,h=3, $fn=6);
}

module bumper(){
    union(){
        translate([50,0,0])
        cube([3,30,50]);
        
        translate([30,7,18])
        stange();
        
        translate([30,23,18])
        stange();
        
        translate([30,7,43])
        stange();

        translate([30,23,43])
        stange();        
    }
}

base();
bumper();