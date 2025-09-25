// licht halterung

// idee: gut basis, je 3 arme 25cm lang mit 10° neigung


angles = [0, 35];
width = 15;
height=25;
dist = 15;

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


module arm(){
    // arm
    translate([-radius, 0, 0])
    linear_extrude(height) arc(radius, angles, width);

    translate([-radius2-width-dist, 0, 0])
    linear_extrude(height) arc(radius2, angles, width);

    // start-piece bottom
    translate([-dist-width, 0, 0])
    cube([2*width+dist, height, height]);

    // end-piece top
    translate([-radius, 0, 0])
    rotate([0,0,angles[1]])
    translate([radius-width-dist, 0, 0])
    cube([2*width+dist, height, height]);
}

color("white")
arm();

color("gray")
translate([-radius, 0, 0])
rotate([0, 0, angles[1]])
translate([radius, 0, 0])
rotate([0, 45, 0])
translate([0, height, 0])
arm();