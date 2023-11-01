$fn=128;
thickness=6;
height=20;
diameter_pole = 86;

difference(){
    union(){
        translate([-20, diameter_pole/2+1, 0])
        cube([40, 5, height]);

        difference(){
            cylinder(r=diameter_pole/2+thickness, h=height);
            translate([0,0,-.5])
            cylinder(r=diameter_pole/2, h=height+1);
            
            translate([-diameter_pole/2-5, -diameter_pole/2-20,-.5])
            cube([diameter_pole+10, diameter_pole/2+10, height+1]);
        }
    }
    

    
    // screw holes plate
    for(x = [-12:12:12]){
        translate([x,diameter_pole/2+5.001,height/2]){
            rotate([90,0,0]){
                translate([0,0,-10])
                cylinder(r=1.8, h=20);
                
                translate([0,0,2])
                cylinder(r1=1.8,r2=4, h=3);
                
                translate([0,0,4.999])
                cylinder(r=4, h=5);
            }
        }
    }
    
    // screw holes side
    translate([diameter_pole/2-1,0,height/2]){
            rotate([0,90,0]){
                cylinder(r=1.8, h=20);
                
                translate([0,0,2])
                cylinder(r1=1.8,r2=4, h=3);
                
                translate([0,0,4.999])
                cylinder(r=4, h=5);
            }
        }    
        
    // screw holes side
    translate([-diameter_pole/2+1,0,height/2]){
            rotate([0,270,0]){
                cylinder(r=1.8, h=20);
                
                translate([0,0,2])
                cylinder(r1=1.8,r2=4, h=3);
                
                translate([0,0,4.999])
                cylinder(r=4, h=5);
            }
        }        
    
    
}