// skadis zubehör

$fn=64;

loch_width=5;
loch_height=25;

loch_abstand_horizontal=40; // mitte zu mitte
loch_abstand_vertikal=40;

dicke_skadis=5.5;
r_skadis=2.5;

tolerance=0.15;

h_secondary=8;

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
    difference(){
        union(){
            translate([0, h_secondary, 0])
            rotate([90, 0, 0])
            cylinder(r=r_skadis-tolerance, h=h_secondary);
            
            translate([0, dicke_skadis+r_skadis, 0])
            sphere(r=r_skadis-tolerance+0.7);
        }
        
        translate([-5, 3, -.5])
        cube([10, 10, 1]);
        
        translate([r_skadis-tolerance, 5, -3])
        cube([5, 10, 10]);
        
        translate([-5-(r_skadis-tolerance), 5, -3])
        cube([5, 10, 10]);
    }
    
    translate([0, dicke_skadis+r_skadis, 40-(15-2*r_skadis)+0.5])
    rotate([90, 0, 0])
    cylinder(r=r_skadis-tolerance, h=dicke_skadis+r_skadis);
    
    translate([0, dicke_skadis+r_skadis, 40-(15-2*r_skadis)+0.5])
    sphere(r=r_skadis-tolerance);
    
    translate([0, dicke_skadis+r_skadis+1.7, 40-(15-2*r_skadis)-10+0.5])
    rotate([10,0,0])
    cylinder(r=r_skadis-tolerance, h=10);
    
    translate([0, dicke_skadis+r_skadis+1.7, 40-(15-2*r_skadis)-10+0.5])
    sphere(r=r_skadis-tolerance);

    if(false){
        translate([-r_skadis+tolerance, -s, -r_skadis])
        cube([2*(r_skadis-tolerance), s, 40-(15-2*r_skadis)+2*r_skadis+0.5]);
    }
    
    hull(){
        translate([0,0,40-(15-2*r_skadis)+0.5])
        rotate([90, 0, 0])
        cylinder(r=r_skadis-tolerance, h=s);
        
        translate([0,0,0])
        rotate([90, 0, 0])
        cylinder(r=r_skadis-tolerance, h=s);
    }
}

holder();

// attachment
// magnetschiene, 23.5 hoch, 13 tief, 45cm lang
difference(){
    union(){        
        hull(){
            translate([0, -s, 0])
            rotate([90, 0, 0])
            cylinder(r=r_skadis-tolerance, h=13+s-r_skadis/2);
            
            translate([0, -s, 40-(15-2*r_skadis)+0.5])
            rotate([90, 0, 0])
            cylinder(r=r_skadis-tolerance, h=13+s-r_skadis/2);
        }
        
        hull(){
            translate([0, -s-13-s+r_skadis/2, 0])
            rotate([90, 0, 0])
            sphere(r=r_skadis-tolerance);
            
            translate([0, -s-13-s+r_skadis/2, 40-(15-2*r_skadis)+0.5])
            rotate([90, 0, 0])
            sphere(r=r_skadis-tolerance);
        }
    }

    translate([-10, -13-s, ((40-(15-2*r_skadis)+0.5)-23.5+tolerance)/2])
    cube([450, 13+tolerance, 23.5+tolerance]);
}