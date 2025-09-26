// licht halterung

// idee: gut basis, je 3 arme 25cm lang mit 10° neigung

include <base.scad>;

angles = [0, 35];
width = 15;
height=25;
dist = 39;
height_end=15;

radius = 370;
radius2 = radius-dist-width;

fn = 5;

module sector(radius, angles, fn = 24) {
    r = radius / cos(180 / fn);
    step = -360.0 / fn;

    points = concat([[0, 0]],
        [for(a = [angles[0] : step : angles[1] - 360]) 
            [r * cos(a), r * sin(a)]
        ],
        [[r * cos(angles[1]), r * sin(angles[1])]]
    );

    difference() {
        circle(radius, $fn = fn);
        polygon(points);
    }
}

module arc(radius, angles, width = 1, fn = 360) {
    difference() {
        sector(radius + width, angles, fn);
        sector(radius, angles, fn);
    }
} 

if(false){  // print plate dimensions
    %translate([-250, 0, 0])
    cube([250, 250, 1]);
}

module einschmelzhuelse(){
    rotate([90,0,0]){
        cylinder(r=7.3/2, h=13); // hülse
        cylinder(r=6.1/2, h=40); // schraube
    }
}

module arm(base_end=true){
    // arm
    difference(){
        union(){
            translate([-radius, 0, 0])
            linear_extrude(height) arc(radius, angles, width);

            translate([-radius2-width-dist, 0, 0])
            linear_extrude(height) arc(radius2, angles, width);
            
            if(base_end){
                difference(){
                    union(){
                        hull(){
                            // base
                            translate([-dist-width-6,-3, 75-width])
                            rotate([-90,0,0])
                            cube([76, 60, h]);
                            
                            // start-piece bottom
                            translate([-dist-width, 0, 0])
                            cube([2*width+dist, height_end, height]);
                        }

                        // ribs for base
                        translate([-dist-width-6,-3, 75-width])
                        rotate([-90,0,0])
                        for(x=[12.5:24.85:w]){  // 12.5 zum äußeren Rand gemessen
                            hull(){
                                translate([x+r_ribs, (d_total-d_ribs)/2 + r_ribs, -h_ribs])
                                cylinder(r=r_ribs, h=h_ribs);
                                
                                translate([x+r_ribs, (d_total-d_ribs)/2 + d_ribs - r_ribs, -h_ribs])
                                cylinder(r=r_ribs, h=h_ribs);
                            }
                        }
                    }
                    
                    // hole for 1/4" einschmelzhülse bottom
                    translate([-dist/2,height_end+0.001, height/2])
                    einschmelzhuelse();
                }
            }else{
                difference(){
                    // start-piece bottom
                    translate([-dist-width, 0, 0])
                    cube([2*width+dist, height_end, height]);
                    
                    // hole for 1/4" einschmelzhülse bottom
                    translate([-dist/2,height_end+0.001, height/2])
                    rotate([90,0,0]){
                        //cylinder(r=7.3/2, h=13); // hülse
                        cylinder(r=6.1/2, h=40); // schraube
                    }
                }
            }

            // middle-piece
            translate([-radius, 0, 0])
            rotate([0,0, angles[1]/2])
            translate([radius-width-dist, 0, 0])
            cube([2*width+dist, height/4, height]);

            // end-piece top
            translate([-radius, 0, 0])
            rotate([0,0, angles[1]])
            translate([radius-width-dist, 0, 0]){
                difference(){
                    cube([2*width+dist, height_end, height]);
                    
                    // hole for 1/4" einschmelzhülse bottom
                    #translate([width+dist/2, 0, height/2])
                    rotate([180,0,0])
                    einschmelzhuelse();
                }
            }
        }
        
    }

    
}

rotate([90,0,0])
color("white")
arm(base_end=false);
