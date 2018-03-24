$fn = 50;

difference(){
    union(){
        cube([45, 15, 100]);

        translate([45,0,100-15-5])
        cube([127, 5, 15]);

        translate([45+127-5, 0, 100-5])
        cube([5,5,5,]);

        translate([45,0,0])
        rotate([0,-32.2,0])
        cube([150, 5, 10]);
    }

    // schraublöcher
    translate([-1, 7.5,30])
    rotate([0,90,0])
    cylinder(r=3.4/2, h=50);

    translate([11, 7.5,30])
    rotate([0,90,0])
    cylinder(r=3.5, h=50);

    translate([-1, 7.5,65])
    rotate([0,90,0])
    cylinder(r=3.4/2, h=50);

    translate([11, 7.5,65])
    rotate([0,90,0])
    cylinder(r=3.5, h=50);
}