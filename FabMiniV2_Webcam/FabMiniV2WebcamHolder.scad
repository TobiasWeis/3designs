$fn=50;


    /*
    difference(){
        translate([100, -100, 0])
        import_stl("C920_mount_v2.stl", convexity = 4);
        
        translate([-50, 9,-50])
        cube([100,100,100]);
        
        translate([-10,-8,-13])
        cube([20,22,20]);    
    }
    */
difference(){

        union(){
    hull(){
        translate([10,4.6,9])
        rotate([0,90,0])
        cylinder(r=4.4, h=10);
        
        translate([10,0.2,2])
        cube([10,4.4*2, 1]);
    }

    hull(){
        translate([-20,4.6,9])
        rotate([0,90,0])
        cylinder(r=4.4, h=10);
        
        translate([-20,0.2,2])
        cube([10,4.4*2, 1]);
    }   
    
            translate([-20,-11,-12])
            cube([40, 20, 15]);
}
            
            translate([-20.5, -8, -12.01])
            cube([41, 4, 10]);
            
            translate([-11.5,-8,-13])
            cube([23,22,30]);
}
