// led-streifen ist 7.5mm breit

// löcher größer machen!
$fn=50;

module holder(){
    translate([0,10,0])
    difference(){
        import_stl("CR-10_Webcam_Mount_V3.stl", convexity = 5);
        
        translate([-50,-220,-50])
        cube([200,200,200]);
        

        translate([0,0,-10])
        cylinder(r=2.5, h=10);
        
        translate([0,0,-1])
        cylinder(r=6, h=10);        
    }

    translate([-11.5,-50,-8])
    cube([23, 40, 12.6]);

    translate([-11.5,-67.6,22.2])
    rotate([-45,0,0])
    cube([23, 30, 5]);


    translate([-11.5,-67.6,22.2])
    cube([23, 5, 83]);
}

// später: led-streifen-halter
module bar(){
    difference(){
        translate([-11.5, -62, 24.5])
        cube([300,2,10]);
        
        translate([-12.5, -61, 25.5])
        cube([310,5,8]);    
    }
}

difference(){
    holder();
    translate([-10,-4,65])
    rotate([-5,0,0])
    bar();
}