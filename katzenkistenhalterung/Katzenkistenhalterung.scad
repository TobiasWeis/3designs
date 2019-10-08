// 4cm breites geländer

breite_gelaender=43;
dicke_halterung=5;
hoehe_halterung=60;
breite_halterung=25;

difference(){
    // haken
    cube([breite_gelaender+2*dicke_halterung, hoehe_halterung+dicke_halterung, breite_halterung]);
    translate([dicke_halterung,dicke_halterung,-0.5])
    cube([breite_gelaender, hoehe_halterung+1, breite_halterung+1]);
    translate([-0.1, 30,-0.5])
    cube([20,hoehe_halterung,breite_halterung+1]);
    
    // schraubloecher
    translate([breite_gelaender+dicke_halterung-0.01, 30+(hoehe_halterung-30)/4 + dicke_halterung, breite_halterung/2])
    rotate([0,90,0])
    cylinder(r=2.1, h=dicke_halterung+1, $fn=16);
    
    translate([breite_gelaender+dicke_halterung-0.01,30+(hoehe_halterung-30)/4 + dicke_halterung,breite_halterung/2])
    rotate([0,90,0])
    cylinder(r=4, h=dicke_halterung/2, $fn=16);;    
    
    // schraubloecher
    translate([breite_gelaender+dicke_halterung-0.01, 30+3*((hoehe_halterung-30)/4) + dicke_halterung, breite_halterung/2])
    rotate([0,90,0])
    cylinder(r=2.1, h=dicke_halterung+1, $fn=16);
    
    translate([breite_gelaender+dicke_halterung-0.01, 30+3*((hoehe_halterung-30)/4) + dicke_halterung, breite_halterung/2])
    rotate([0,90,0])
    cylinder(r=4, h=dicke_halterung/2, $fn=16);
}