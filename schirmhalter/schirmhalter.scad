//15mm breit, 12cm auseinander
// 65mm weit von vorderkante weg, 30mm durchmesser

thickness=8;

module gelander(){
        translate([-59.5,0,0])
        cube([15.5,26,300], center=true);
        translate([59.5,0,0])
        cube([15.5,26,300], center=true);
    
}

module schirm(){
    translate([0,25/2+65,0])
    cylinder(r=18,h=300, $fn=32, center=true);
}

/*
difference(){
    union(){
        hull(){
            cube([130, 45, thickness], center=true);
            translate([0,25/2+65,0])
            cylinder(r=25,h=thickness,$fn=32,center=true);
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
*/

module netz_spanner(){
    length = 60;
    height = 6;
    
    difference(){
        hull(){
            translate([65,0,0])
            cube([30, 35, height], center=true);
            
            // gelaender ends at 70
            translate([70+length,0,0])
            cylinder(r=3, h=height, center=true);
        }
        
        translate([50,0,0])
        cube([10, 26-3, height+1], center=true);
        
        translate([70+length+1,0,0])
        cube([5, 2, height+1], center=true);
        
        hull(){
            translate([75,0,0])
            cube([5, 26-3, height+1], center=true);
            
            translate([70+length-20,0,0])
            cylinder(r=3, h=height+1, center=true);
        }
    }
}

difference(){
    netz_spanner();
    gelander();
}