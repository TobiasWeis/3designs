// headhpones: 14 x 18 x 8
$fn = 100;

/*
translate([-70,-70,0])
%cube([180,140,80]);
*/

width=180;
depth=140;
height=80;
wall = 4;

module top(){
    difference(){
        hull(){
            cylinder(r=depth/2+wall/2, h=height/2+wall);
            translate([width-depth,0,0])
            cylinder(r=depth/2+wall/2, h=height/2+wall);
        }
        
        translate([0,0,wall+0.01])
        hull(){
            cylinder(r=depth/2, h=height/2);
            translate([width-depth,0,0])
            cylinder(r=depth/2, h=height/2);
        }
    }
    
    translate([31,depth/2+wall+1,height/2+wall])
    rotate([0,90,0])
    union(){
    difference(){
        cylinder(r=5, h=20);
        translate([0,0,-0.5])
        cylinder(r=3, h=21);
    }
            translate([-0.9,-7,0])
        rotate([0,0,-33])
        cube([10, 10, 20]);
    }
    
    translate([-11,depth/2+wall+1,height/2+wall])
    rotate([0,90,0])
    union(){
        difference(){
            cylinder(r=5, h=20);
            translate([0,0,-0.5])
            cylinder(r=3, h=21);
        }
        
        translate([-0.9,-7,0])
        rotate([0,0,-33])
        cube([10, 10, 20]);
    }
}

module bottom(){
    difference(){
        hull(){
            cylinder(r=depth/2+wall/2, h=height/2+wall);
            translate([width-depth,0,0])
            cylinder(r=depth/2+wall/2, h=height/2+wall);
        }
        
        translate([0,0,wall+0.01])
        hull(){
            cylinder(r=depth/2, h=height/2);
            translate([width-depth,0,0])
            cylinder(r=depth/2, h=height/2);
        }
    }
        
    translate([10,-(depth/2+wall+1),height/2+wall])
    rotate([0,90,0])
    union(){
    difference(){
        cylinder(r=5, h=20);
        translate([0,0,-0.5])
        cylinder(r=3, h=21);
    }
    
        translate([4.7,-2.1,0])
        rotate([0,0,30])
        cube([10, 10, 20]);

    }
}

translate([0,0,2*(height/2+wall)])
rotate([180,0,0])
#top();
//bottom();