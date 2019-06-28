// einzel-dosen-hue-dimmer-halter
// unterputzdose hat schraublöcher oben und unten, 60mm auseinander

 $fn=64;
 /*
 difference(){
     union(){
        difference(){
            union(){
                cylinder(r=31, h=10);
            }
            
            translate([0,0,-1])
            cylinder(r=29, h=12);
        }
            translate([0,0,1.5])
            cube([58, 5, 3], center=true);
    }

    translate([58/2, 0, -5])
    cylinder(r=1.5, h=10);
    
    translate([-58/2, 0, -5])
    cylinder(r=1.5, h=10);    
}
*/

difference(){
    union(){
        cube([60+3, 5, 5], center=true);
        cube([5, 60, 5], center=true);
    }
    
    // dosen-schrauben
    translate([30,0,-5])
    cylinder(r=1.5, h=10);
    
    translate([30,0,-0])
    cylinder(r=3, h=10);    
    
    translate([-30,0,-5])
    cylinder(r=1.5, h=10);  
  
    translate([-30,0,-0])
    cylinder(r=3, h=10);    
    
    // löcher für hue-schalter
    translate([0,58/2,-5])
    cylinder(r=1.5, h=10);    
    
    // löcher für hue-schalter
    translate([0,-58/2,-5])
    cylinder(r=1.5, h=10);        
}