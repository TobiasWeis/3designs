// rolle: 8cm durchmesser, neigung: 30 grad
$fn=128;

difference(){
    
    cylinder(r=40+2.4, h=41);
    
    translate([5,0,21])
    rotate([0,-30,0])
    cylinder(r=40, h=100);
    
    translate([5,0,21])
    rotate([0,-30,0])
    translate([0,0,-50])
    cylinder(r=4.5, h=200);
    
    translate([5,0,21])
    rotate([0,-30,0])
    translate([0,0,-30])
    cylinder(r=10, h=23);
    
    translate([-50,-50,-9])
    rotate([0,-30,0])
    cube([100,100,100]);
    
    translate([-10,20,-50])
    cylinder(r=2, h=100);
    translate([-10,20,5])
    cylinder(r=5, h=11);
    
    translate([-10,-20,-50])
    cylinder(r=2, h=100);  
    translate([-10,-20,5])
    cylinder(r=5, h=11);
    
    translate([25,20,-50])
    cylinder(r=2, h=100); 
    translate([25,20,5])
    cylinder(r=5, h=40);
}