// halterung für 150er rohr
$fn=64;

wand=5;
durchmesser_aussen=150;


        
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