// pc frontblende lüfter-halterung

$fn=128;

w_front=151;
w=149;
d_front=4;
d=4;
h=128;

fan_radius=116/2;
fan_distance_screws=105;

fan_screw_d=4.8;
fan_screw_head_d=8.3;
fan_screw_head_h=1.5;

if(true){
    difference(){
        union(){
            color("blue")
            cube([w_front, h, d_front]);

            color("white")
            translate([(w_front-w)/2, 0, d_front])
            cube([w,h,d]);
            
            // clip-laschen
            translate([(w_front-w)/2,0,0])
            cube([1, h, 13]);
            
            translate([0,0,13])
            rotate([0,45,0])
            cube([2, h, 2.2]);
            
            translate([w_front-2*(w_front-w)/2,0,0])
            cube([1, h, 13]);
            
            translate([w-(w_front-w)/2,0,13])
            rotate([0,45,0])
            cube([2, h, 2.2]);
        }
        
        translate([fan_radius + (w-2*fan_radius)/2, fan_radius + (h-2*fan_radius)/2, -1])
        cylinder(r=fan_radius, h=20);
        
        // lüfter-schrauben
        for(x = [(w-fan_distance_screws)/2: fan_distance_screws: w]){
            for(y = [(h-fan_distance_screws)/2: fan_distance_screws: h]){
                translate([x, y, -1])
                cylinder(r=fan_screw_d/2, h=20);
                
                translate([x, y, -0.01])
                cylinder(r=fan_screw_head_d/2, h=3);
                
                translate([x, y, 2.99])
                cylinder(r1=fan_screw_head_d/2, r2=fan_screw_d/2, h=fan_screw_head_h);
            }
        }
    /*    
        translate([(w-fan_distance_screws)/2 + fan_distance_screws, (h-fan_distance_screws)/2, -1])
        #cylinder(r=fan_screw_d/2, h=20);
        
        translate([(w-fan_distance_screws)/2 + fan_distance_screws, (h-fan_distance_screws)/2 + fan_distance_screws, -1])
        #cylinder(r=fan_screw_d/2, h=20);
        
        translate([(w-fan_distance_screws)/2, (h-fan_distance_screws)/2 + fan_distance_screws, -1])
        #cylinder(r=fan_screw_d/2, h=20);
            */
    }
}

// rahmen für gitter
translate([0,0,-10])
if(true){
    difference(){
        hull(){
            cube([w_front, h, 1]);
            translate([1,1,3])
            cube([w_front-2, h-2, 1]);
        }
     
        translate([fan_radius + (w-2*fan_radius)/2, fan_radius + (h-2*fan_radius)/2, -1])
        cylinder(r=fan_radius, h=20);
        
        // lüfter-magnete
        #for(x = [(w-fan_distance_screws)/2: fan_distance_screws: w]){
            for(y = [(h-fan_distance_screws)/2: fan_distance_screws: h]){
                translate([x, y, (4-2.3)/2])
                cylinder(r=fan_screw_head_d/2, h=2.3);
            }
        }
    }
}
