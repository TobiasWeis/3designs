// halterung für metall-leiste

difference(){
union(){
    difference(){    
    // aussenrum
    difference(){
        union(){
            translate([-1,-1,0])
            cube([19.7+2, 8.6+2, 5]);
        }
        // das ist die Leiste
        translate([0,0,-0.5])
        difference(){
            cube([19.7, 8.6, 6]);
            translate([1.6, 1.6,-0.5])
            cube([19.7, 8.6, 7]);
        }
        
        // stück wegnehmen
        translate([2.5,2.5,-0.5])
        cube([19.7,8.6,6]);
    }   
    
        translate([10,2.5,0])
        translate([1,-1,-0.5])
        cube([5, 2, 6]);     
    }
    translate([9,2.25,0])
    cube([9, 2, 5]);   
   
    translate([1.6,6.2,0])
   rotate([0,0,-25]) 
   cube([10,2,5]);
    
    // lasche
    translate([19.7+1,1.5,0])
    cube([30,1,5]);
    
    translate([30+19.7,1.5,0])
    cube([1, 15,5]);
}
    translate([30+19-2,13,2.5])
    rotate([0,90,0])
    cylinder(r=1.6, h=10, $fn=200);
}