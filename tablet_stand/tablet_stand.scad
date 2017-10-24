// tablet 
// width: 18.5cm
// depth: 0.95cm
// length: 26.5cm
tab_w = 18.5 + 0.5;
tab_d = 0.95 + 0.5;
tab_l = 26.5;

usb_l = 2.85;
usb_w = 1.04;
usb_d = 0.69;

usb_offset_w = 12.5 + 4/2 + 0.25; // bis ca. 13.5

difference(){
    
    union(){
        rotate([-20.5,0,0])
        cube([tab_w+4,  tab_d + 2, 10]);
        
        // stützen
        translate([0,10,-3])
        rotate([25.5, 0,0])
        cube([5, tab_d + 2, 8]);
        
        translate([tab_w-1, 10,-3])
        rotate([25.5, 0,0])
        cube([5, tab_d + 2, 8]);

        translate([tab_w/2-0.5, 10,-3])
        rotate([25.5, 0,0])
        cube([5, tab_d + 2, 8]);
        
        rotate([-20.5,0,0])
        translate([0,-0.3,0])
        cube([tab_w+4,  tab_d + 2, 4]);     
        
        // back-base
        translate([0,3.5,0])
        cube([tab_w+4, 5, 9.35]);
    }
    
    rotate([-20,0,0])
    translate([2,-0.01,3.5])
    #cube([tab_w, tab_d, tab_l]);
    
    translate([-.5,0,-3])
    cube([tab_w+5, 15, 3]);
    
    // usb
    rotate([-20,0,0])
    translate([usb_offset_w,0.5,0.7])
    cube([usb_w, usb_d, usb_l]);
    
    translate([usb_offset_w, 0.7, -0.01])
    cube([usb_w, 10, usb_d]);
    
    // cut off the sides to fit it in 10cm
    translate([-0.01-3, -2, -0.01])
    cube([10,100,100]);
    
    translate([tab_w+4-10+0.01+3, -2, -0.01])
    cube([10,100,100]);    
}