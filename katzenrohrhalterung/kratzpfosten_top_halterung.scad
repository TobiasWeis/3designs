// 39mm von regal-kante bis tiefster Punkt Pfosten
$fn = 128;
diameter_pole = 86;

/*
difference(){
    cube([])
}*/

difference(){
    translate([-90/2,-5,0])
    cube([90, 44, 10+12.3]);

    translate([0, diameter_pole/2, -.1])
    cylinder(r=diameter_pole/2, h=10);
    
    translate([-90/2+6,1.5,-2]){
        #cylinder(r=3.5/2, h=30);
        cylinder(r=4, h=22.3-5);
    }
    
    translate([+90/2-6,1.5,-2]){
        #cylinder(r=3.5/2, h=30);    
        cylinder(r=4, h=22.3-5);
    }
    
    // screw holes side
    translate([90/2-6,30,5]){
            rotate([0,90,0]){
                cylinder(r=1.8, h=20);
                
                translate([0,0,2])
                cylinder(r1=1.8,r2=4, h=3);
                
                translate([0,0,4.999])
                cylinder(r=4, h=5);
            }
        }    
        
    // screw holes side
    translate([-90/2+6,30,5]){
        rotate([0,-90,0]){
            cylinder(r=1.8, h=20);
            
            translate([0,0,2])
            cylinder(r1=1.8,r2=4, h=3);
            
            translate([0,0,4.999])
            cylinder(r=4, h=5);
        }
    }          
}