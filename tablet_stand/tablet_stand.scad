// tablet 
// width: 18.5cm
// depth: 0.95cm
// length: 26.5cm
tab_w = 18.5 + 0.5;
tab_d = 1.2 + 0.5;
tab_l = 26.5;

usb_l = 2.85;
usb_w = 1.04;
usb_d = 0.69;

usb_offset_w = 12.5 + 4/2 + 0.25; // bis ca. 13.5

difference(){
    
    union(){
        rotate([-20.5,0,0])
        cube([tab_w+4,  tab_d+1, 10]);

        translate([2, 9.615,-0.948])
        rotate([25.5, 0,0])
        cube([tab_w, 0.8, 10]);
        
        rotate([-20.5,0,0])
        translate([0,-0.3,-0.2])
        cube([tab_w+4,  tab_d + 2, 4]);     
        
        // back-base
        //translate([0,3.5,0])
        //cube([tab_w+4, 5, 5]);
    }
    
    rotate([-20,0,0])
    translate([2,-0.01,3.5])
    #cube([tab_w, tab_d, tab_l]);
    
    translate([-.5,-2,-3])
    cube([tab_w+5, 15, 3]);
      
    // usb
    rotate([-20,0,0])
    translate([usb_offset_w,0.5,0.])
    cube([usb_w, usb_d, usb_l+2]);
    
    //translate([usb_offset_w, 0.5, -0.01])
    //cube([usb_w, 5, usb_d]);
    
    translate([tab_w-3.7,10+5.7,0.])
    rotate([90,0,0])
    cylinder(r=0.5, h=15,$fn=200);

    
    // cut off the sides to fit it in 10cm
    translate([-4.91-3, -2, -5.01])
    cube([10,100,100]);
    
    translate([4.9+tab_w+4-10+0.01+3, -2, -5.01])
    cube([10,100,100]);    
}
