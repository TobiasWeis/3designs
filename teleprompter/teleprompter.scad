module border(){
    difference(){
        union(){
            difference(){
                cube([15, 180, 205]);
                translate([-1,10,25])
                cube([20, 160,160]);        
            }
            translate([0, 7.5,10])
            rotate([45,0,0])
            cube([20, 240, 10]);
        }
        translate([15,0,10]) tablet();
        translate([10,17,30]) rotate([45,0,0]) glass();        
    }
}

module tablet(){
    difference(){
        cube([240, 170, 11]);
    }
}

module camside(){
    difference(){
        cube([270, 10, 205]);
        translate([270/2, 18, 205/2])
        rotate([90,0,0])
        cylinder(r=35, h=20, $fn=200);
    }
}

module glass(){
    cube([252, 202, 3]);
}

module camholder(){
    cube([100, 200, 15]);
}

%translate([15,0,10]) tablet();
border();
translate([270,0,0]) mirror([1,0,0]) border();

translate([0,-20,0]) camside();
//translate([10,17,30]) rotate([45,0,0]) glass();
translate([270/2-50,-230,40]) camholder();