use <MCAD/teardrop.scad>;

// LED-bar light arm

$fn=64;

s=15;
r=25;
r_cutout = 200;

tolerance=0.3;

module base(){
}

module arm_piece_full(){
    difference(){
        hull(){
            cylinder(r=r, h=s);
            
            translate([200, 0, 0])
            cylinder(r=r, h=s, $fn=8);
        }
    }
} 

module arm_piece_half(thickness=s){
    difference(){
        hull(){
            rotate([0,0,1.5*360/8])
            cylinder(r=r, h=thickness, $fn=8);
            
            translate([100, 0, 0])
            rotate([0,0,1.5*360/8])
            cylinder(r=r, h=thickness, $fn=8);
        }        
    }
}

module arm_piece_quarter(thickness=s){
    difference(){
        hull(){
            rotate([0,0,1.5*360/8])
            cylinder(r=r, h=thickness, $fn=8);
            
            translate([50, 0, 0])
            rotate([0,0,1.5*360/8])
            cylinder(r=r, h=thickness, $fn=8);
        }        
    }
}

module arm(){
    difference(){
        union(){
            arm_piece_half(thickness=s-tolerance);

            translate([0, 0, 2*s])
            arm_piece_half(thickness=s-tolerance);
            
            translate([200, 0, s])
            rotate([0,0,180])
            arm_piece_half(thickness=s-tolerance);
            
            translate([200, 0, 3*s])
            rotate([0,0,180])
            arm_piece_half(thickness=s-tolerance);

            //connector
            translate([100, 0, 0])
            rotate([0,0,1.5*360/8])
            cylinder(r=r, h=5*s, $fn=8);
        }
        
        translate([0,0, 5*s/2])
        rotate([0, 90, 90])
        teardrop(4, 5*s+10, 90);
        
        translate([200,0, 5*s/2])
        rotate([0, 90, 90])
        teardrop(4, 5*s+10, 90);
        
        translate([0,0,-0.001])
        rotate([0,0,1.5*360/6])
        cylinder(r=7.9, h=7, $fn=6);
    }
    
    // cable-holder
    for(x=[-6, 100-6]){
        translate([x, r, 2.5*s-tolerance/2])
        difference(){
            rotate([0,90, 0])
            rotate([0, 0, 22.5])
            cylinder(r=(s-tolerance)/2, h=10, $fn=8);
            
            translate([-.5, 0, 0])
            rotate([0,90, 0])
            rotate([0, 0, 22.5])
            cylinder(r=(s-tolerance)/2-1.2, h=11, $fn=8);
        }
    }
}

module base(){
    
    difference(){
        union(){
            //arm_piece_half(thickness=s-tolerance);

            //translate([0, 0, 2*s])
            //arm_piece_half(thickness=s-tolerance);
            
            translate([200, 0, s])
            rotate([0,0,180])
            arm_piece_quarter(thickness=s-tolerance);
            
            translate([200, 0, 3*s])
            rotate([0,0,180])
            arm_piece_quarter(thickness=s-tolerance);

            //connector
            translate([150, 0, 0])
            rotate([0,0,1.5*360/8])
            cylinder(r=r, h=5*s, $fn=8);
            
            // halterung hinter pegboard
            translate([105, -33.5, 0])
            rotate([0, 0, 45])
            cube([50, 15, 5*s]);
        }
        
        // pegboard
        // halterung hinter pegboard
        /*
        translate([110.5, -36, -1])
        rotate([0, 0, 45])
        cube([50, 5.5, 5*s+2]);
        */
        
        // wand-schraube
        for(z=[4.4*s, .5*s]){
            translate([140,10, z]){
            rotate([0, 0, -45]){
                teardrop(3, 5*s+50, 90); # TODO: radius!
                translate([20,0,0])
                teardrop(5, 45, 90);  # TODO: radius!
            }
        }
        }
        
        // kabel-kanal
        translate([147, 30, 2.5*s])
        rotate([90, 0, -45])
        cylinder(r=10, h=100, $fn=6);
        
        translate([0,0, 5*s/2])
        rotate([0, 90, 90])
        teardrop(4, 5*s+10, 90);
        
        translate([200,0, 5*s/2])
        rotate([0, 90, 90])
        teardrop(4, 5*s+10, 90);
        
        translate([0,0,-0.001])
        rotate([0,0,1.5*360/6])
        cylinder(r=7.9, h=7, $fn=6);
    }
}

module beefygrip(){
    difference(){
        rotate([0,0,1.5*360/8])
        cylinder(r=r, h=s, $fn=8);
        
        translate([0,0,s-8])
        rotate([0,0,1.5*360/6])
        cylinder(r=7.9, h=8, $fn=6);
        
        translate([0, 0, -70+s-8])
        cylinder(r=4, h=70);
    }
}

if(true){
    base();
}

if(false){
    translate([200, 0, 4*s])
    beefygrip();
}

if(false){
    color("gray")
    arm();
}

if(false){
    translate([200, 0, 0])
    rotate([0, 0, 0])
    arm();

    translate([400, 0, 0])
    rotate([0, 0, 0])
    arm();
}