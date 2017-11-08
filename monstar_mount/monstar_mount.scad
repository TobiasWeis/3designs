// 62x66x12
// schrauben:
// kopf: 5.3mm durchmesser, 3mm tiefe
// gewinde: 2.8mm

module schraube(){
        cylinder(r=5.5/2., h=3, $fn=100);
        cylinder(r=1.5, h=20, $fn=100);
}


module schraube_f(){
    rotate([90,90,0]){
        cylinder(r=5/2, h=15, $fn=100);
        cylinder(r=9/2, h=5, $fn=100);
    }
}

difference(){
    cube([66,62,12]);
    
    translate([10,10,-0.5])
    cube([66,62,13]);    
    
    // schraubenlöcher
    //offset: 3.3
    translate([4.5, 4.5, -0.01])
    schraube();
    
    translate([66-4.5, 4.5, -0.01])
    schraube();
    
    translate([4.5, 62-4.5,-0.01])
    schraube();
    
    translate([66/2, 10.01,5+1])
    schraube_f();
}