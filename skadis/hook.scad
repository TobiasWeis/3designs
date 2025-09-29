// skadis zubehör

$fn=64;

loch_width=5;
loch_height=25;

loch_abstand_horizontal=40; // mitte zu mitte
loch_abstand_vertikal=40;

dicke_skadis=5.5;
r_skadis=2.5;

tolerance=0.2;

h_secondary=5;

s=3;

module loch(){
    hull(){
        cylinder(r=2.5, h=10);
        translate([0, 15-2*2.5, 0])
        cylinder(r=2.5, h=10);
    }
}

//loch();

// skadis-dicke: ~5.5mm

module holder(){
    translate([0, h_secondary, 0])
    rotate([90, 0, 0])
    cylinder(r=r_skadis-tolerance, h=h_secondary);
    
    translate([0, dicke_skadis+r_skadis, 40-(15-2*r_skadis)+0.5])
    rotate([90, 0, 0])
    cylinder(r=r_skadis-tolerance, h=dicke_skadis+r_skadis);
    
    translate([0, dicke_skadis+r_skadis, 40-(15-2*r_skadis)+0.5])
    sphere(r=r_skadis-tolerance);
    
    translate([0, dicke_skadis+r_skadis+1.7, 40-(15-2*r_skadis)-10+0.5])
    rotate([10,0,0])
    cylinder(r=r_skadis-tolerance, h=10);

    translate([-r_skadis+tolerance, -s, -r_skadis])
    cube([2*(r_skadis-tolerance), s, 40-(15-2*r_skadis)+2*r_skadis+0.5]);
}

holder();

// attachment
// magnetschiene, 23.5 hoch, 13 tief, 45cm lang
difference(){
    translate([-r_skadis+tolerance, -s-13-s, -r_skadis])
    cube([2*(r_skadis-tolerance), 13+s, 23.5+2*s]);

    translate([-10, -13-s, 0])
    cube([450, 13+tolerance, 23.5+tolerance]);
}