// lüfter-halterung

// loch-abstand: 10.5cm 
// lüfter-außen-maße: 12cm x 12cm x 2.5
// fensterbrett: 2cm dick

$fn=32;

thickness = 5;
fbrett_h = 20;

gabel_l = 20;
gabel_w = 15;

translate([0,-thickness-gabel_l, 0])
difference(){
    cube([gabel_w, gabel_l, fbrett_h+2*thickness]);
    translate([-thickness, -thickness, thickness])
    cube([40, gabel_l, fbrett_h]);
}

translate([gabel_w,-9.9, thickness+2])
rotate([-75, 0, 0]){
    difference(){
        translate([-gabel_w,0,0])
        cube([gabel_w*2, 15, 5]);
        
        translate([7.5, 7.5, -15])
        cylinder(r=2, h=100);
        
        translate([7.5, 7.5, -13])
        cylinder(r=4, h=15);
    }
}

// kabel-öse
translate([0, -gabel_l-thickness, -15])
difference(){
    cube([gabel_w, gabel_l, 20]);
    
    translate([-2.5, thickness, 5])
    cube([gabel_w+5, gabel_l-2*thickness, 10]);
    
    translate([-2.5, -thickness+1, 10])
    cube([gabel_w+5, gabel_l-2*thickness, 5]);
}