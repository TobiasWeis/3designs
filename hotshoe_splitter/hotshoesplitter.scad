// hot shoe splitter

module hotshoe(){
    difference(){
        cube([21, 17, 3]);
        
        translate([1.15,-0.5,0])
        cube([18.7,18,1.7]);
        
        translate([(18.7-12)/2+1,-0.5,0])
        cube([12, 18, 3.5]);
    }
}

// shoe on cam: 18.4 wide, 17 deep, 1.7 high, metal-latches: 1mm thick
// space between metal latches: 12mm
cube([18.5, 17,1.7]);

translate([(18.5-12)/2,0,1.5])
cube([12, 17,1.5]);

translate([-40+18.5/2,0,3])
cube([80, 17,3]);

translate([-40+18.25-9,0,6])
hotshoe();

translate([28.25,0,6])
hotshoe();