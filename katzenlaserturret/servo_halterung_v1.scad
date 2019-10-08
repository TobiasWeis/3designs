// housing for 9g servo and mcu node amica v2

// 12.3mm dick
// 23mm lang
// 16mm von boden zu schraubhalterung unterseite
// 26mm höhe insgesamt

servo_dicke = 12.6;
servo_hoehe = 26;
servo_laenge = 23.5;

module servo(){
    cube([servo_dicke, servo_laenge, servo_hoehe]);

    translate([0, -4.8, 16])
    cube([servo_dicke, 4.8, 2.5]);

    translate([0, servo_laenge, 16])
    cube([servo_dicke, 4.8, 2.5]);
}

//color([0,0,1]) servo();

// breadboard: 55mm breit..befestigung mit pins in rastermaß für prototyp
difference(){
    translate([-2,-4.8,0])
    cube([servo_dicke+4, 4.8, 16]);
    // schraube
    translate([servo_dicke/2, -4.8/2, 16-5])
    cylinder(r=1, h=10, $fn=16);
}

translate([-2,0,0])
cube([2, servo_laenge, 16]);

translate([servo_dicke,0,0])
cube([2, servo_laenge, 16]);

translate([-2,servo_laenge,0])
cube([3+1.5, 2, 16]);

translate([servo_dicke-2.5, servo_laenge,0])
cube([3+1.5, 2, 16]);

difference(){
    translate([-5, -5, 0])
    cube([servo_dicke+10, servo_laenge+10, 2]);

    // raster-maß: 2.54mm
    for ( i = [0 : 12] ){
        for ( j = [0 : 4 : 8] ){
            translate([-4+j*2.54, -3.5 + i*2.54, -5])
            cylinder(r=0.5, h=20, $fn=32);
        }
    }
}