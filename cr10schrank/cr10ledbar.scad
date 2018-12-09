// led-streifen ist 7.5mm breit

// löcher größer machen!
$fn=50;

module holder(){
    translate([0,10,0])
    difference(){
        //import_stl("CR-10_Webcam_Mount_V3.stl", convexity = 5);
        union(){
            translate([-14/2,-20,-8])
            cube([14, 40, 12.6]);

            translate([-14/2, 2.5,-11])
            cube([14,5,3]);            
        }
        translate([-50,-220,-50])
        cube([200,200,200]);
        
        translate([0,5,-14])
        cylinder(r=1.8, h=20);
        
        translate([0,5,-1])
        cylinder(r=6, h=10);        
    }

    translate([-14/2,-50,-8])
    cube([14, 40, 12.6]);

    translate([-14/2,-67.6,22.2])
    rotate([-45,0,0])
    cube([14, 30, 5]);

    translate([-14/2,-67.6,22.2])
    cube([14, 5, 83]);
    
    translate([-14/2,-62.6,85])
    cube([14, 5, 20]);
}

// später: led-streifen-halter
module bar(){
    difference(){
        translate([-11.5, -62, 24.5])
        cube([360,4,10]);
        
        translate([-12.5, -59, 25.5])
        cube([370,5,8]);    
    }
}


difference(){
    holder();
    translate([-10,4,68])
    scale([1.1, 1.1, 1.1])
    #bar();
}


//bar();