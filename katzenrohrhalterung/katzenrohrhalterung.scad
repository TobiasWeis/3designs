// halterung für 150er rohr
// requires openscad >= ver. 2016
// sudo snap install openscad-nightly

use <scad-utils/transformations.scad>
use <scad-utils/shapes.scad>
use <skin.scad>

$fn=128;

wand=5;
durchmesser_aussen=150;

module halterung(){        
    difference(){
        hull(){
            cylinder(r=durchmesser_aussen/2+wand, h=20, center=true);
            translate([0,-durchmesser_aussen/2,0])
            cube([100, 25, 20], center = true);  
        }
        cylinder(r=durchmesser_aussen/2, h=21, center=true);
        translate([0,130,0])
        cube([200,200,25], center=true);
        
        translate([0, -durchmesser_aussen/2,0])
        rotate([90,0,0])
        cylinder(r=3, h=50, center=true);
        
        translate([0, -durchmesser_aussen/2-1,0])
        rotate([90,0,0])
        cylinder(r=6, h=4, center=true);
    }
}

radius = 148/2;
inner_radius = 146/2;
angle_1 = 0;
angle_2 = 25;
armlength=30;

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