// katzengrastop

$fn=128;

d1=120;
d2=95;
h=108;

s = 2*0.7;

difference(){
    union(){
        cylinder(r2=d1/2+s, r1=d2/2+s, h=h);
        // add some bottom-thickness
        translate([0, 0, -2*s])
        cylinder(r2=d2/2+s, r1=d2/2, h=2*s);
    }
    translate([0, 0, s])
    cylinder(r2=d1/2, r1=d2/2, h=h);
}