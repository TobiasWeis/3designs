// 2.5cm stangendurchmesser
// kugellager: 22, 7 hoch

$fn = 500;

thickness=5;
stange = 25+1;
space=80;

module pair(length=30){
    rotate([90,0,0])
    difference(){
        hull(){
            cylinder(r=stange/2+thickness, h=length);
            translate([space,0,0])
            cylinder(r=stange/2+thickness, h=length);
        }
        translate([0,0,-0.5])
        cylinder(r=stange/2, h=length+1);
        translate([space,0,-0.5])
        cylinder(r=stange/2, h=length+1);        
        
        //translate([30,0,-0.5])
        //cylinder(r=stange/2, h=31);       
    }
}

// endstück mit kugellager
module endroller(){
    difference(){
        union(){
            pair();
                translate([0,-30,0])
                hull(){
                    pair(length=3);
                }
            }
        translate([space/2,-15,-20])
        cylinder(r=5.1/2, h=50);
        translate([space/2-22/2,-40,25/2-7-7])
        cube([22,50,9]);
            
        translate([-40, -15, 0])
        rotate([0,90,0])
        cylinder(r=1.6, h=150);
            
        // gewindeschraube für stativ
        translate([space/2,-15,-18.01])
        cylinder(r=8.8/2, h=9);
    }
}

// endstück mit motor
module endmotor(){
    translate([0,300,0]){
    difference(){        
        union(){
            pair(length=60);
            
            // "Fahnen" für controlbox-montage
            difference(){
                translate([-18,-3,-28])
                cube([116, 3, stange+2*thickness+20]);
                
                /*
                translate([60+20+16,6,(stange+2*thickness)/2-4])
                rotate([90,0,0])
                cylinder(r=1.6, h=20);
                
                translate([60+20+16,5,-(stange+2*thickness)/2+4])
                rotate([90,0,0])
                cylinder(r=1.6, h=20);                
                */
            }
        }
        
            // gewindeschraube für stativ
            translate([space/2,-30,-18.01])
            cylinder(r=8.8/2, h=9);                    
        
        translate([space/2-31/2, -60/2-31/2,-50])
        cylinder(r=1.6, h=100);
        
        translate([space/2-31/2, -60/2-31/2,-25])
        cylinder(r=3, h=20);        
        
        translate([space/2+31/2,-60/2-31/2,-50])
        cylinder(r=1.6, h=100);   
        
        translate([space/2+31/2, -60/2-31/2,-25])
        cylinder(r=3, h=20);         
       
        translate([space/2-31/2,-60/2+31/2,-50])
        cylinder(r=1.6, h=100);
        
        translate([space/2-31/2, -60/2+31/2,-25])
        cylinder(r=3, h=20);         
        
        translate([space/2+31/2,-60/2+31/2,-50])
        cylinder(r=1.6, h=100);
        
        translate([space/2+31/2, -60/2+31/2,-25])
        cylinder(r=3, h=20);         
        
        translate([space/2-44/2,-60.5,stange/2-25])
        cube([44,60+1,25]);
        
        translate([space/2,-60/2,stange/2+thickness-1.99])
        cylinder(r=23/2, h=2);
        
        translate([space/2,-60/2,stange/2-1])
        cylinder(r=6/2, h=20);
        
        translate([-30, -30, 0])
        rotate([0,90,0])
        cylinder(r=1.6, h=150);
    }  
    
    
        // pully
    /*
        translate([space/2,-60/2,-3])
        #cylinder(r=15/2, h=15);
    */
    }
}

// schlitten
module slider(){
    translate([0,150,0])
    difference(){
        pair(length=60);
        translate([space/2-15/2+15/2,-60.5,-17.5])
        cube([15, 61, 30]);
        translate([-30,-70,-55])
        cube([150,100,50]);
        
        translate([60/2-40/2,-25-30/2,-17.5])
        cube([40, 25, 30]);
        
        translate([0,-7.5,1.99]){
            translate([10,0,0])
            rotate([0,90,0])
            cylinder(r=3.1/2, h=25);

            translate([25,0,0])
            rotate([0,90,0])
            cylinder(r=6.2/2, h=2.6, $fn=6);

            translate([-30,0,0])
            rotate([0,90,0])
            cylinder(r=7.1/2, h=50);
           
            translate([25,-5.5/2,-7])
            cube([2.6, 6.2, 8]); 
        }
        
        rotate([0,0,90])
        //translate([0,-52.5,1.99]){
        translate([-82,-25.5,1.99]){
            translate([10,0,0])
            rotate([0,90,0])
            cylinder(r=3.1/2, h=25);
            
            translate([25,0,0])
            rotate([0,90,0])
            cylinder(r=6.2/2, h=2.6, $fn=6);        

            translate([-30,0,0])
            rotate([0,90,0])
            cylinder(r=7.1/2, h=50);
           
            translate([25,-5.5/2,-7])
            cube([2.6, 6.2, 8]); 
        }    
        
    translate([space/2-15/2,-100,-14])
    cube([2, 400, 20]);
    /*
    translate([22.5-5+0.01,-46,-14])
    cube([15,2,20]);
        
    translate([22.5-5+0.02,-65.99,-14])
    cube([2, 20, 20]);
        */
        
    translate([25,-58,-14])
    difference(){
        cylinder(r=10, h=20);
        translate([0,0,-0.5])
        cylinder(r=10-2, h=21);
    }
        
        translate([space/2, -30, 10])
        cylinder(r=6.4/2, h=10);
        
        translate([space/2, -30, 12.49])
        cylinder(r=17/2, h=2);    
    }
}

module controlbox(){
    // box
    
    difference(){
        cube([120,90,60]);
        translate([5,5,5])
        cube([110,80,60]);
        
        translate([3,3,40.1])
        cylinder(r=1.6, h=20);
        
        translate([3,90-3,40.1])
        cylinder(r=1.6, h=20); 
 
         translate([120-3,90-3,40.1])
        cylinder(r=1.6, h=20);       
        
         translate([120-3,3,40.1])
        cylinder(r=1.6, h=20);         
   
        // loch für netzteil
        translate([-1,72,17])
        rotate([0,90,0])
        cylinder(r=11.5/2, h=10);
        
        // loch für Motorkabel
        translate([-1,17,17])
        rotate([0,90,0])
        cylinder(r=11.5/2, h=10);    
    
        // loch für auslöserkabel
        translate([111,17,17])
        rotate([0,90,0])
        cylinder(r=4/2, h=10);
    }
    
    
    
    // deckel
    translate([0,0,70])
    difference(){
        cube([120,90,3]);
        //display: 4.6x3.4
        translate([20,90/2 - 46/2,-0.5])
        cube([34,46,6]);
        
        // joystick: 26x22
        translate([70,90/2 - 26/2,-0.5])
        cube([22,26,6]);
        
        translate([3,3,-10.1])
        cylinder(r=1.6, h=20);
        
        translate([3,90-3,-10.1])
        cylinder(r=1.6, h=20); 
 
         translate([120-3,90-3,-10.1])
        cylinder(r=1.6, h=20);       
        
         translate([120-3,3,-10.1])
        cylinder(r=1.6, h=20);   
   
        // versenkungen
        translate([3,3,2.1])
        cylinder(r=9/2, h=3);
        
        translate([3,90-3,2.1])
        cylinder(r=9/2, h=3); 
 
        translate([120-3,90-3,2.1])
        cylinder(r=9/2, h=3);       
        
         translate([120-3,3,2.1])
        cylinder(r=9/2, h=3);   
        
    }
    
}

difference(){
    union(){
        slider();
        endmotor();
        translate([-20,320,-32])
        controlbox();
        endroller();
    }
    
    // schraublöcher für controlbox zu motorendstück
    translate([0,350,22.5])
    rotate([90,0,0])
    cylinder(r=1.6, h=100);
    
    translate([80,350,22.5])
    rotate([90,0,0])
    cylinder(r=1.6, h=100);    
    
    translate([0,350,-22.5])
    rotate([90,0,0])
    cylinder(r=1.6, h=100);
    
    translate([80,350,-22.5])
    rotate([90,0,0])
    cylinder(r=1.6, h=100);      
}

// riemen
/*
translate([space/2-15/2,-50,0])
%cube([2, 400, 6]);
translate([space/2+15/2-2,-50,0])
%cube([2, 400, 6]);
*/