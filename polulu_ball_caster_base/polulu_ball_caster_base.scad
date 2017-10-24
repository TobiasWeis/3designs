// -- ball-caster holder
ball_d = 25.4;

roller_w = 8.9;
roller_d = 3;

module roller(){
        union(){
        translate([-3/2,0,0])
        rotate([90,0,90])
        cylinder(r=7.5/2, h=3,$fn=200);
   
        translate([-9.1/2,0,0])
        rotate([90,0,90])
        cylinder(r=3/2, h=9.1, $fn=200);
        
        // cutout 1
        translate([-8.9/2,-1.5,0])
        rotate([])
        cube([8.9, 3,10]);
        
        //cutout 2
        translate([-3/2,-9.1/2,-2.6])
        rotate([])
        cube([3.0, 9.1,10]);     
    }
}

module latch(){
    cube([6.6, 3.6, 11], center=true);
    translate([0,3,-4.5])
    cube([6.5, 3.5, 11], center=true);
}

difference(){
    // base
    translate([0,0,2])
    union(){
        cylinder(r=34/2, h=8, $fn=200);
        translate([0,0,1.5])
        difference(){
            cube([45,5,3], center=true);
            // screwholes
            translate([20,0,-2])
            cylinder(r=1.5,h=10,$fn=50);
            
            translate([-20,0,-2])
            cylinder(r=1.5,h=10,$fn=50);
        }
    }
    
    // rollers
    translate([0,13.3,8])
    roller();
    
    rotate([0,0,120])
    translate([0,13.3,8])
    roller();
    
    rotate([0,0,240])
    translate([0,13.3,8])
    roller();
    
    // cutouts for latches
    rotate([0,0,60])
    translate([0,14,5])
    latch();
    
    rotate([0,0,180])
    translate([0,14,5])
    latch();
    
    rotate([0,0,300])
    translate([0,14,5])
    latch();
    
    translate([0,0,ball_d/2 + 2])
    sphere(25.4/2, $fn=300);
    
    translate([0,0,-2])
    cylinder(r=3, h=10, $fn=200);
}
    
