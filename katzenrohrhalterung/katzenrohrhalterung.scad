// halterung für 150er rohr
// requires openscad >= ver. 2016
// sudo snap install openscad-nightly

use <scad-utils/transformations.scad>
use <scad-utils/shapes.scad>
use <skin.scad>

$fn=128;

wand=6;
durchmesser_aussen=150;

module halterung(){        
    difference(){
        hull(){
            cylinder(r=durchmesser_aussen/2+wand, h=25, center=true);
            translate([0,-durchmesser_aussen/2,0])
            cube([100, 25, 25], center = true);  
        }
        cylinder(r=durchmesser_aussen/2, h=26, center=true);
        //translate([100,100,0])
        //cube([200,200,25], center=true);
        
        translate([0, -durchmesser_aussen/2,0])
        rotate([90,0,0])
        cylinder(r=3, h=50, center=true);
        
        translate([0, -durchmesser_aussen/2-1,0])
        rotate([90,0,0])
        cylinder(r=6, h=4, center=true);
    }
}

union(){
    difference(){
        halterung();
        
        translate([0,-5,-50])
        cube([100,10,100]);
    }
    translate([durchmesser_aussen/2+wand/3-0.2, -5, -25/2])
    cylinder(r=wand/3*2, h=25);
    
    translate([durchmesser_aussen/2+wand/3-0.2, 5, -25/2])
    cylinder(r=wand/3*2, h=25);    
}

module rohr(l){
    color([1,1,1])
    difference(){
        cylinder(r=150/2, h=l);
        translate([0,0,-0.5])
        cylinder(r=148/2, h=l+1);
    }
}

module verbinder(winkel){
    radius = 148/2;
    inner_radius = (148-2*1.2)/2;
    angle_1 = 0;
    angle_2 = winkel;
    armlength=10;

    union() {
        // lower arm
        rotate([0, 0, angle_1])
        translate([angle_2 + radius, 0.02, 0])
        rotate([90, 0, 0])
        difference() {
            cylinder(r=radius, h=armlength);
            translate([0, 0, -1])
            cylinder(r=inner_radius, h=armlength+2);
        }

        // upper arm
        rotate([0, 0, angle_2])
        translate([angle_2 + radius, -0.02, 0])
        rotate([-90, 0, 0])
        difference() {
            cylinder(r=radius, h=armlength);
            translate([0, 0, -1])
            cylinder(r=inner_radius, h=armlength+2);
        }

        // bend
        difference(){
            // torus
            rotate_extrude(angle=angle_2, convexity=10)
            translate([angle_2 + radius, 0, 0])
            circle(r=radius);
            // torus cutout
            rotate_extrude(angle=angle_2+1, convexity=10)
            translate([angle_2 + radius, 0, 0])
            circle(r=inner_radius);
        }
    }
}


module aufbau(){
    winkel = 35;

    rotate([90,0,0])
    rohr(500);

    translate([-110,0,0])
    color([1,0,0])
    verbinder(winkel);

    rotate([90,0,winkel])
    translate([18,0,-290])
    rohr(250);

    translate([-110+55,300,0])
    rotate([0,180,winkel])
    color([1,0,0])
    verbinder(winkel);

    translate([-165,300,0])
    rotate([0,90,90])
    rohr(500);
}

//aufbau();
//verbinder(35);
