//15mm breit, 12cm auseinander
// 65mm weit von vorderkante weg, 30mm durchmesser

module gelander(){
        translate([-60,0,0])
        cube([15,26,300], center=true);
        translate([60,0,0])
        cube([15,26,300], center=true);
    
}

module schirm(){
    translate([0,25/2+65,0])
    cylinder(r=16,h=300, $fn=32, center=true);
}

difference(){
    union(){
        hull(){
            cube([130, 45, 10], center=true);
            translate([0,25/2+65,0])
            cylinder(r=25,h=10,$fn=32,center=true);
        }
    }
    gelander();
    schirm();
    
    // aussparungen mitte
    hull(){
        cube([80,25,30],center=true);
        translate([0,45,0])
        cylinder(r=10,h=50,center=true);
    }
}
