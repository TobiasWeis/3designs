// leiter-halterung

// 76, 176 grad
module latten(){
    rotate([90-76,0,0])
    cube([2*55+1, 12, 500]);
}

wall = 2;

module oben(){
    difference(){
        translate([-wall,-121,479])
        cube([2*55+1+2*wall, 15,10]);
        
        latten();
    }
}

module unten(){
    difference(){
        translate([-wall,-2,0])
        cube([2*55+1+2*wall, 14, 5]);

        latten();
    }
}

//unten();
oben();