// battery holder for robot

// 
//    |- 24.5 -|
//       ----       -
//     /      \     |
//    |        |    |
//    |        |   46
//    |        |    |
//     \      /     |
//       ----       -
$fn = 200;
height=8;

module holder(){
    difference(){
        union(){
            // top with screwholes
            translate([-14.3,0,height/2])
            cube([5, 43, height], center=true);
            // holder - outline
            translate([-(29-25.5)/2,0,0])
            hull(){
                cylinder(r=30/2, h=height);
                translate([24.5,0,0])
                cylinder(r=30/2, h=height);
            }
            
            translate([-2,-21,0])
            difference(){
                cube([10,6,3]);
                translate([2,2,-0.5])
                cube([6,4,height+1]);
            }
            
            translate([-2,15,0])
            difference(){
                cube([10,6,3]);
                translate([2,0,-0.5])
                cube([6,4,height+1]);
            }
        }
        
        // that is the cutout for the battery
        translate([0,0,-1])
        hull(){
            cylinder(r=24.5/2, h=height+2);
            translate([22.5,0,0])
            cylinder(r=24.5/2, h=height+2);
        }
        
        // cutout for screws
        translate([-20,16+1.5,height/2])
        rotate([0,90,0])
        cylinder(r=1.6, h=10, $fn=200);
        
        translate([-14.5,16+1.5,height/2])
        rotate([0,90,0])
        cylinder(r=3.2, h=3, $fn=6);     
        
        translate([-20,-16-1.5,height/2])
        rotate([0,90,0])
        cylinder(r=1.6, h=10, $fn=200);    

        translate([-14.5,-16-1.5,height/2])
        rotate([0,90,0])
        cylinder(r=3.2, h=3, $fn=6); 
        
        // simulate screw head
        /*
        translate([-15,-17,4])
        rotate([0,90,0])
        #cylinder(r=5.5/2, h=10, $fn=200);        
        */
    }
}

module bugel(){
    /*
    translate([0,16,-18.5])
    %cube([10,10,18.5]);
    */
    
    translate([0,16,-18.5])
    cube([5.6, 3,25]);
    
    
    translate([0,-16-3,-18.5])
    cube([5.6, 3,25]);
    
    translate([0,-16-4,3.5])
    cube([5.6,4,3]);
    
    translate([0,16,3.5])
    cube([5.6,4,3]);
    
    myheight=3;
    translate([0,-19,-18.5-myheight])
    cube([5.6,38,myheight]);
}

//holder();
bugel();