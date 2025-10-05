$fn=64;

include <arm_v2.scad>;

/*
difference(){
    cube([122, 150, 3]);
    translate([-1,5,1])
    linear_extrude(2)
    #import("/home/weis/code/3designs/buero_lichtarm/led_streifen_cutout.svg");
}
*/

if(false){
    translate([-63, 0, 0])
    #import("/home/weis/code/3designs/buero_lichtarm/led_streifen_cutout.svg");
}

// schraube
module schraube(){
    union(){
        translate([0,0, -16]) // kopf
        cylinder(r=4, h=6);
        
        translate([0, 0, -16+6]) // schraube
        cylinder(r=2.2, h=22);
    
        translate([0,0,5])  // einschmelzmutter
        cylinder(r=3.1, h=4.5);
    }
}

module schraube_klemme(){
    union(){
        translate([0,0, -16]) // kopf
        cylinder(r=4, h=6);
        
        translate([0, 0, -16+6]) // schraube
        cylinder(r=2.2, h=10);
    
        #translate([0,0,-16+6+4.5])  // einschmelzmutter
        cylinder(r=3.1, h=4.5);
    }
}

module cutout(){
    // controller
    translate([-35/2, 86, -5])
    cube([35, 55, 15]);

    hull(){
        translate([0, 86+55+20, 0])
        rotate([90, 0, 0])
        #cylinder(r=5, h=20);
        
        translate([0, 86+55+20, 5])
        rotate([90, 0, 0])
        cylinder(r=5, h=20);
    }

    // "piping"
    translate([-16/2, 39, 0])
    cube([16, 60, 5]);

    translate([-80/2, 36, 0])
    cube([80, 16, 5]);

    // untere zwei clipper
    for(y=[36-17.5, 36+16]){
        for(x=[-80/2-2, 80/2-16+2]){
            translate([x, y, 0])
            cube([16, 18, 5]);
        }
    }

    // eck-streifen unten
    for(x=[29, -29-10.5]){
        for(y=[4.5]){
            translate([x,y,0]){
                cube([10.5, 15, 8]);
                
                if(x == 29){
                    cube([15, 10.5, 8]);
                }else{
                    translate([-4.5, 0, 0])
                    cube([15, 10.5, 8]);
                }
            }
        }
    }

    // eck-streifen oben
    for(x=[29, -29-10.5]){
        for(y=[68]){
            translate([x,y,0]){
                cube([10.5, 15, 5]);
                
                translate([0, 5, 0]){
                    if(x == 29){
                        cube([15, 10.5, 5]);
                    }else{
                        translate([-4.5, 0, 0])
                        cube([15, 10.5, 5]);
                    }
                }
            }
        }
    }


    holding_length=60;

    // #äußere clipper + schienen oben
    for(y=[69.5]){
        for(x=[42.5, -42.5-holding_length]){
            translate([x, y, 0])
            cube([holding_length, 17.4, 8.4]);
            //17.3, 8.5
        }
    }

    // äußere lichter unten
    
    translate([0,0,-1.5])
    for(y=[-7]){
        for(x=[42.5, -42.5-holding_length]){
            translate([x, y, 0]){
                cube([holding_length, 33.5, 6.5]);
                
                hull(){
                    translate([0, (33.5-28.8)/2, 6.5])
                    cube([holding_length, 28.8, 0.1]);
                    
                    translate([0, (33.5-24)/2, 12.5])
                    cube([holding_length, 24, 0.1]);
                }
            }
            
            hull(){
                translate([x+holding_length, y+33.5/2, 21.3])
                rotate([0, -90, 0])
                cylinder(r=27.2/2, holding_length);
                
                translate([x, y+(33.5-24)/2, 12.5])
                cube([holding_length, 24, 0.1]);
            }
        }
    }
    
    for(x=[30, -30]){
        for(y=[-5, 90]){
            translate([x, y, 0])
            schraube();
        }
    }
    
    for(x=[60, -60]){
        for(y=[10, 79]){
            translate([x, y, 0])
            schraube_klemme();
        }
    }
    
    
} // module cutout

module unten(){
    difference(){
        translate([-135/2, -20, -15])
        union(){
            cube([135, 120, 20]);
            
            for(x=[0, 135]){
                for(y=[30, 98]){
                    translate([x,y,0])
                    rotate([0,0,22.5])
                    cylinder(r=32.5, h=20, $fn=8);
                }
            }
            
            translate([135/2, 105, 0])
            rotate([0,0,22.5])
            cylinder(r=146/2, h=20, $fn=8);
        }
        cutout();
    }
}

module oben(){
    difference(){
        translate([-135/2, -20, -15+20])
        union(){
            cube([135, 120, 35]);
            
            for(x=[0, 135]){
                for(y=[30, 98]){
                    translate([x,y,0])
                    rotate([0,0,22.5])
                    cylinder(r=32.5, h=35, $fn=8);
                }
            }
            
            translate([135/2, 105, 0])
            rotate([0,0,22.5])
            cylinder(r=146/2, h=35, $fn=8);
            
            // arme für halterung
            translate([135/2-1.5*s, 205, 11.9])
            rotate([90, 180, 90]){
            difference(){
                union(){
                    arm_piece_half(thickness=s-tolerance);

                    translate([0, 0, 2*s])
                    arm_piece_half(thickness=s-tolerance);
                }
                
                translate([0,0, 5*s/2])
                rotate([0, 90, 90])
                teardrop(4, 5*s+10, 90);
                
                translate([200,0, 5*s/2])
                rotate([0, 90, 90])
                teardrop(4, 5*s+10, 90);
            }
        }
        }
        cutout();
        
        // oberer zylinder
        translate([-135/2, -20, -30])
        translate([135/2, 105, 0])
        rotate([0,0,22.5])
        cylinder(r=146/2, h=35, $fn=8);
    }
}

unten();

translate([200, 0, 0])
rotate([0, 180, 0])
oben();