// phone tripod mount
// galaxy s7 
// 68.5 - 8.2

// schraubbuchse
// 7.2 höhe, 8.5-9 durchmesser

difference(){
    cube([12, 68.5+20, 12], center=true);
    
    // galaxy
    translate([0,0,1])
    cube([100, 68.5, 8.2], center=true);
    
    translate([0,68.5/2-8.2/2,1])
    rotate([0,90,0])
    cylinder(r=8.2/2, h=20, center=true,$fn=50);
    
    translate([0,-68.5/2+8.2/2,1])
    rotate([0,90,0])
    cylinder(r=8.2/2, h=20, center=true,$fn=50);
    
    // schraubbuchse
    translate([0,-(68.5+20)/2. + 7.2/2.,0])
    rotate([90,0,0])
    #cylinder(r=8.7/2, h=7.3, center=true, $fn=50);
    
    // cutout
    translate([0,0,2])
    cube([100, 58.5, 10], center=true);
    
    // cutoff
    translate([0,47,0])
    cube([20,20,20], center=true);
}
