// din-a4: 210x297

// organizer for cupboard


h=215;
d=300;
s=1.6;

w=50+20+20+4*s;

difference(){
    cube([w, d, h]);
    
    translate([s,-s,s])
    cube([50, d, h-2*s]); // packung druckerpapier 5cm
    
    translate([s+50+s, -s, s])
    cube([20, d, h-2*s]);
    
    translate([s+50+s+20+s, -s, s])
    cube([20, d, h-2*s]);
    
    translate([-5,0,107])
    rotate([0,90,0])
    cylinder(r=100, h=150, $fn=6);
}