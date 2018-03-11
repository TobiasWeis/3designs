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
            
            difference(){
                hull(){
                    translate([10,4.6,11])
                    rotate([0,90,0])
                    cylinder(r=4.5, h=10);
                    
                    translate([10,0.2,1])
                    cube([10,4.4*2, 1]);
                }
                translate([17.01,4.6,11])
                rotate([0,90,0])
                cylinder(r=3, h=3);                
            }

            difference(){
                hull(){
                    translate([-20,4.6,11])
                    rotate([0,90,0])
                    cylinder(r=4.5, h=10);
                    
                    translate([-20,0.2,1])
                    cube([10,4.4*2, 1]);
                }   
                translate([-20.01,4.6,11])
                rotate([0,90,0])
                cylinder(r=3, h=3);                                
            }
    
            translate([-20,-21,-12])
            cube([40, 30, 13]);
}
            
            translate([-20.5, -18, -12.01])
            cube([41, 3.5, 10]);
            
            translate([-20.5,-9.8,-9])
            cube([41, 10, 20]);

            translate([-22.5/2,-9.8,-13])
            cube([22.5,22,30]);
}
