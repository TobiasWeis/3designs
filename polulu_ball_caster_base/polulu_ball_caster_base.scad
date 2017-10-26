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
    translate([0,0,1])
    cube([6.6, 3.6, 10], center=true);
    translate([0,3,-4.5+6/2])
    cube([6.6, 3.6, 5], center=true);
}

module screwhole(){
        translate([0,14.3,-20]){
        cube([5.5,5.5,5], center=true);
        translate([0,0,-10])
        cylinder(r=1.6, h=16,$fn=200,center=true);
    }
}

difference(){
    // base
    translate([0,0,2])
    union(){
        // need additional 29mm under base
        translate([0,0,-2-8-29/2-4.5])
        cylinder(r=34/2, h=29, $fn=200);
        // addition end
        
        cylinder(r=34/2, h=8, $fn=200);
        /*
        translate([0,0,1.5])
        difference(){
            cube([45,5,3], center=true);
            // screwholes
            translate([20,0,-2])
            cylinder(r=1.5,h=10,$fn=50);
            
            translate([-20,0,-2])
            cylinder(r=1.5,h=10,$fn=50);
        }
        */
    }
    
    // save some printer time
    translate([0,0,-29/2+1.99])
    cylinder(r1=12,r2=3,h=29, center=true,$fn=200);
    
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
    
    // screw holes
    rotate([0,0,30])
    screwhole();

    rotate([0,0,30+120])
    screwhole();
    
    rotate([0,0,30+240])
    screwhole();
    
    translate([0,0,ball_d/2 + 2])
    sphere(25.4/2, $fn=300);
    
    translate([0,0,-2])
    cylinder(r=3, h=10, $fn=200);
    
    /*
    translate([0,0,25])
    #cube([100,100,100],center=true);
    */
}
    
