$fn = 6;

thick = 6;
dia = 100;
screen_thick=0.6;
height = 50;

dheight=28;
dlength=28;

dheight_o = 35;
dlength_o = 60;

module base(){
    difference(){
        union(){
            difference(){
                cylinder(r=dia, h=height, center=true);
                
                translate([0,0,screen_thick])
                cylinder(r=dia-thick, h=height, center=true);
                
                translate([0,0,height/2-7.5+0.01])
                cylinder(r=dia-thick+.5, h=15, center=true);
                
                translate([0,0,height/2-11])
                cylinder(r=dia-thick+.8, h=11, center=true);
                
            }

            // margin for control-board
            translate([0,0,screen_thick])
            difference(){
                cylinder(r=dlength_o-10, h=height, center=true);
                translate([0,0,3])
                cylinder(r=dlength_o-10-thick/2, h=height, center=true);
            }
        }

        // hole for screen
        translate([0,0,-height/2])
        cube([dheight, dlength,10],center=true);
        
        // hole for screen-board
        translate([3,0,-height/2+3])
        cube([49.5,34.5,3], center=true);
        
        // holes to attach lid
        translate([-96.5,0,10], $fn=64)
        #cylinder(r=1, h=20);
        
        translate([96.5,0,10], $fn=64)
        #cylinder(r=1, h=20);
        
        translate([48.5,83.5,10], $fn=64)
        #cylinder(r=1, h=20);
        
        translate([-48.5,83.5,10], $fn=64)
        #cylinder(r=1, h=20);
        
        translate([48.5,-83.5,10], $fn=64)
        #cylinder(r=1, h=20);
        
        translate([-48.5,-83.5,10], $fn=64)
        #cylinder(r=1, h=20);
    }


    // 26 * 48.5 - node amica holder
    translate([0,-38.5,-height/2 + 49/2 + screen_thick])
    difference(){
        cube([27+6, 5, 49], center=true);
        cube([27, 5.01, 49.01], center=true);
    }

    translate([0,-38+5, -height/2 + 30/2+screen_thick])
    cube([15, 5, 30], center=true);

    //translate([dheight/2 + 3+2.5,dlength/2+13+2.5,-height/2+5])
    //cube([5,5,5], center=true);

    // 13mm eine seite, 7mm andere seite
    // 3mm oben und unten
    //cube([dlength_o, dheight_o, 5], center=true);
}


// deckel
translate([0,0,50]){
difference(){
    cylinder(r=dia, h=5, center=true);
    
    // Verzierung
    translate([0,0,2.01])
    difference(){
        cylinder(r=dia-10, h=1, center=true);
        cylinder(r=dia-20, h=1, center=true);
    }
    
    translate([0,0,2.01])
    difference(){
        cylinder(r=dia-30, h=1, center=true);
        cylinder(r=dia-40, h=1, center=true);
    }
    
    translate([-20,-15,2.01])
    linear_extrude(1)
    scale([5,5,5])
    text("T");
    
    translate([-31.6,-20,2.01])
    linear_extrude(1)
    scale([5,5,5])
    text("W");
    
    /*
    translate([0,30,2.01])
    cube([50,10,1], center=true);
    
    translate([0,1,2.01])
    cube([10,50,1], center=true);
    */
    
    
    // holes to attach lid
    translate([-96.5,0,-10], $fn=64)
    cylinder(r=1, h=20);
    
    translate([96.5,0,-10], $fn=64)
    cylinder(r=1, h=20);
    
    translate([48.5,83.5,-10], $fn=64)
    cylinder(r=1, h=20);
    
    translate([-48.5,83.5,-10], $fn=64)
    cylinder(r=1, h=20);
    
    translate([48.5,-83.5,-10], $fn=64)
    cylinder(r=1, h=20);
    
    translate([-48.5,-83.5,-10], $fn=64)
    cylinder(r=1, h=20);
    
    translate([0,-37,0])
    cube([30,10,10], center=true);
}


}