// pc-licht-stativ-halter

// 25, 18.25
// check: 18.25 + 6.6 == 24.85

$fn=64;

w=76;
h=3;

h_ribs=2.7;

d_total = 60;
d_ribs = 44.5;

tolerance_ribs = 0.1;
r_ribs = 6.6/2 - tolerance_ribs;

module base(){
    cube([76, 60, h]);
    
    for(x=[12.5:24.85:w]){  // 12.5 zum äußeren Rand gemessen
        hull(){
            translate([x+r_ribs, (d_total-d_ribs)/2 + r_ribs, -h_ribs])
            cylinder(r=r_ribs, h=h_ribs);
            
            translate([x+r_ribs, (d_total-d_ribs)/2 + d_ribs - r_ribs, -h_ribs])
            cylinder(r=r_ribs, h=h_ribs);
        }
    }
}

base();