$fn=64;
cylinder(r=25, h=4);
translate([0,0,4])
difference(){
    union(){
        cylinder(r=45/2, h=15);
        translate([45/2-1.5,0,0])
        cylinder(r=3, h=15);
        translate([-45/2+1.5,0,0])
        cylinder(r=3, h=15);
    }
    translate([0,0,-0.5])
    cylinder(r=45/2-2, h=16);
}