// robot bumper v2, weniger drucken, mehr schrauben

module base(){
    difference(){
        union(){
            cube([30,30,5]);
            translate([-5,0,0])
            cube([5,30,50]);
        }
        
        // führungslöcher
        translate([-10,7,10])
        rotate([0,90,0])
        cylinder(r=1.65, h=20, $fn=200);
        
        translate([-10,23,10])
        rotate([0,90,0])
        cylinder(r=1.65, h=20, $fn=200);
        
        translate([-10,23,45])
        rotate([0,90,0])
        cylinder(r=1.65, h=20, $fn=200);
        
        translate([-10,7,45])
        rotate([0,90,0])
        cylinder(r=1.65, h=20, $fn=200);
        
        // schraublöcher
        translate([7, 7, -5])
        cylinder(r=1.6, h=20, $fn=200);
        
        translate([23, 7, -5])
        cylinder(r=1.6, h=20, $fn=200);     
        
        translate([23, 23, -5])
        cylinder(r=1.6, h=20, $fn=200);     
        
        translate([7, 23, -5])
        cylinder(r=1.6, h=20, $fn=200);
    
        // switch-schalter
        // 20 lang, 6.4 breit, 10.2 hoch
        translate([-6,15-6.5/2,20-2.5])
        cube([10.2,6.5,20.5]);
    }
}

module bumper(){
    difference(){
        translate([-17,0,0])
        cube([5,30,50]);  
        
        // führungslöcher
        translate([-20,7,10]){
            rotate([0,90,0])
            cylinder(r=1.65, h=20, $fn=200);
            
            rotate([0,90,0])
            translate([0,0,7.01]);
            //cylinder(r=6.1/2, h=3, $fn=6);
            
                        rotate([0,90,0])
            translate([0,0,2.99])
            cylinder(r=7/2, h=3, $fn=200);
        }
        
        translate([-20,23,10]){
            rotate([0,90,0])
            cylinder(r=1.65, h=20, $fn=200);
            
            rotate([0,90,0])
            translate([0,0,7.01]);
            //cylinder(r=6.1/2, h=3, $fn=6);            
                        rotate([0,90,0])
            translate([0,0,2.99])
            cylinder(r=7/2, h=3, $fn=200);
        }
        
        translate([-20,23,45]){
            rotate([0,90,0])
            cylinder(r=1.65, h=20, $fn=200);
            
            rotate([0,90,0])
            translate([0,0,7.01]);
            //cylinder(r=6.1/2, h=3, $fn=6);     
     
            rotate([0,90,0])
            translate([0,0,2.99])
            cylinder(r=7/2, h=3, $fn=200);          
        }
        
        translate([-20,7,45]){
            rotate([0,90,0])
            cylinder(r=1.65, h=20, $fn=200);
            
            rotate([0,90,0])
            translate([0,0,7.01])
            //cylinder(r=6.1/2, h=3, $fn=6);            
                        rotate([0,90,0])
            translate([0,0,2.99])
            cylinder(r=7/2, h=3, $fn=200);
        }
    }
}

module anchor(){
    difference(){
        translate([10,0,6])
        cube([5,30,43]);
        
        translate([9.99,5,15])
        cube([5.2,20,25]);
        
        translate([5,7,10]){
            rotate([0,90,0])
            cylinder(r=1.65, h=20, $fn=200);
            
            rotate([0,90,0])
            translate([0,0,7.01])
            cylinder(r=6.5/2, h=3, $fn=6);
        }
        
        translate([5,23,10]){
            rotate([0,90,0])
            cylinder(r=1.65, h=20, $fn=200);
            
            rotate([0,90,0])
            translate([0,0,7.01])
            cylinder(r=6.5/2, h=3, $fn=6);
        }        
        
        translate([5,23,45]){
            rotate([0,90,0])
            cylinder(r=1.65, h=20, $fn=200);
            
            rotate([0,90,0])
            translate([0,0,7.01])
            cylinder(r=6.5/2, h=3, $fn=6);
        }    
   
        translate([5,7,45]){
            rotate([0,90,0])
            cylinder(r=1.65, h=20, $fn=200);
            
            rotate([0,90,0])
            translate([0,0,7.01])
            cylinder(r=6.5/2, h=3, $fn=6);
        }    
        
    }
}

difference(){
    union(){
        //base();
        //bumper();
        anchor();
    }
    // cutout for proof of concept
    translate([-50, -50,15])
    cube([100,100,100]);
}