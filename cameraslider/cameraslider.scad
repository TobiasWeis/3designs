// 2.5cm stangendurchmesser
// kugellager: 22, 7 hoch

$fn = 200;

thickness=5;
stange = 25;
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
        pair();
        translate([space/2,-15,-20])
        cylinder(r=5.1/2, h=50);
        translate([space/2-22/2,-40,25/2-7-7])
        cube([22,50,9]);
    }
}

// endstück mit motor
module endmotor(){
    translate([0,300,0]){
    difference(){        
        pair(length=60);
        
        translate([space/2-31/2, -60/2-31/2,0])
        cylinder(r=1.6, h=100);
        
        translate([space/2+31/2,-60/2-31/2,0])
        cylinder(r=1.6, h=100);   
       
        translate([space/2-31/2,-60/2+31/2,0])
        cylinder(r=1.6, h=100);
        
        translate([space/2+31/2,-60/2+31/2,0])
        cylinder(r=1.6, h=100);
        
        translate([space/2-44/2,-60.5,25/2-25])
        cube([44,60+1,25]);
        
        translate([space/2,-60/2,25/2+thickness-1.99])
        cylinder(r=23/2, h=2);
        
        translate([space/2,-60/2,25/2-1])
        cylinder(r=6/2, h=20);
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
        
        translate([60/2-40/2,-30-30/2,-17.5])
        cube([40, 30, 30]);
        
        translate([0,-7.5,0]){
            translate([10,0,0])
            rotate([0,90,0])
            cylinder(r=3.1/2, h=25);

            translate([25,0,0])
            rotate([0,90,0])
            cylinder(r=6.2/2, h=2.5, $fn=6);

            translate([-30,0,1.99])
            rotate([0,90,0])
            cylinder(r=7.1/2, h=50);
           
            translate([25,-5.5/2,-7])
           cube([2.5, 5.5, 8]); 
        }
        
        translate([0,-52.5,1.99]){
            translate([10,0,0])
            rotate([0,90,0])
            cylinder(r=3.1/2, h=25);
            
            translate([25,0,0])
            rotate([0,90,0])
            cylinder(r=6.2/2, h=2.5, $fn=6);        

            translate([-30,0,0])
            rotate([0,90,0])
            cylinder(r=7.1/2, h=50);
           
            translate([25,-5.5/2,-7])
            cube([2.5, 5.5, 8]); 
        }    
        
    translate([space/2-15/2,-100,-14])
    cube([2, 400, 20]);    
        
        translate([space/2, -30, 10])
        cylinder(r=6.4/2, h=10);
        
        translate([space/2, -30, 12.49])
        cylinder(r=17/2, h=2);    
    }
}

//slider();
//endmotor();
endroller();

// riemen
/*
translate([space/2-15/2,-50,0])
%cube([2, 400, 6]);
translate([space/2+15/2-2,-50,0])
%cube([2, 400, 6]);
*/