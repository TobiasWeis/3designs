$fn = 100;
hole_diameter = 4.4;

module single_hook(){
    /*
        The back-hook that grips into the pegboard
    */
    translate([0,0,8])
    cylinder(r=hole_diameter/2, h=3);

    difference(){
        translate([-5,0,8])
        rotate([90,0,0])
        rotate_extrude(convexity = 10)
        translate([5, 0, 0])
        circle(r = hole_diameter/2);
        
        translate([-20,-20,8])
        cube([50,50,50]);
        
       translate([-54,-20,-15])
       cube([50,50,50]);    
    }
}

module single_nub(){
    translate([0,0,7])
    cylinder(r=hole_diameter/2, h=4);
}

module hooks(num_horiz, num_vert, spacing=15, backplane=1){
    /*
        Only the upper row should be hooks, 
        the lower ones should be "nubs"
    */
    // place the hooks
    for(y = [0:num_horiz-1]){
       for(x = [0:num_vert-1]){
           translate([x*spacing, y*spacing, 0])
           if(x == 0){
               single_hook();
           }else{
               single_nub();
           }
       }
   }
   
   // create a backplane
   if (backplane == 1){
        translate([-hole_diameter/2,-hole_diameter/2,11])
        cube([(num_vert-1)*spacing + hole_diameter,
         (num_horiz-1)*spacing + hole_diameter,
           3]);
   }
}


module can_stand(){
    /*
        This one fits a WD-40 spraycan
    */
    difference(){
        translate([-2.2,7.5,-10+47])
        rotate([0,90,0])
        cylinder(r=50/2, h=4.4);

        translate([-4.2,7.5,-10+47])
        rotate([0,90,0])
        cylinder(r=46/2, h=4.4);
        
        translate([-2.2,7.5,-10+47])
        rotate([0,90,0])
        cylinder(r=35/2, h=8);    
    }
}

module tool_holder(num_horiz){
    /*
        Horizontal hooks with angled end
    */
    for(y = [0:num_horiz-1]){
        translate([-0.8,-2.2+15*y,14])
        cube([3, 4.4, 15]);


        translate([0.078,-2.2+15*y,26.88])
        rotate([0,-45,0])
        cube([3,4.4,5]);
    }
}

module pocket(space_to_wall, inner_width, inner_depth, height, wall_thickness=3, with_bottom=0, bottom_thickness=2){
    /*
        A pocket where scissors, pliers or a crimptool can be stored
    */
    translate([-2.2, -2.2,11])
    difference(){
        translate([-height+4.4,0,0])
        cube([height, inner_width+2*wall_thickness, inner_depth+space_to_wall+wall_thickness]);
        
        if (with_bottom == 0){
            translate([-1-height+4.4,wall_thickness,space_to_wall])
            cube([height+2, inner_width, inner_depth]);
        }else{
            translate([-bottom_thickness-height+4.4,wall_thickness,space_to_wall])
            cube([height, inner_width, inner_depth]);            
        }
    }
}

module cablehold(){
    /*
        Not yet really cool: anchor-like to tie cables
    */
    translate([-2.2,5,11+3])
    cube([4.4, 5, 10]);
    translate([-2.2,-2.2,11+3+10])
    cube([4.4, 15+4.4, 3]);
    
    translate([-2.2,-4,11+3+8])
    rotate([45,0,0])
    cube([4.4, 5, 3]);
    
    translate([-2.2,15,11+3+11.5])
    rotate([-45,0,0])
    cube([4.4, 5, 3]);    
}

module angled_hook(num_horiz, length){
    /*
        Simple, angled hook
    */
    for(y = [0:num_horiz-1]){
        difference(){
            translate([16.39,0+15*y,11.7])
            rotate([0,-45,0])
            cylinder(r=hole_diameter/2, h=length);
            
            translate([15+2.2,-5+15*y,5])
            cube([10,10,10]);
        }
        
    }
}

module pineholder(num_horiz=1){
    for(y = [0:num_horiz-1]){
        translate([-2.2, -2.2+y*15, 11])
        cube([hole_diameter, hole_diameter, 33]);
        
        translate([-2.2-10+hole_diameter, -2.2+y*15, 11+33])
        cube([10, hole_diameter, hole_diameter]);
    }
}

// pine 64 touchscreen holder
hooks(3,1, spacing=15);
pineholder(3);

/*
// single angled hook
hooks(1,2,spacing=15);
angled_hook(num_horiz=1, length=15);

// pocket for multimeter
translate([0,50,0]){
hooks(2,1,spacing=30, backplane=1);
translate([0, -4, 0])
pocket(space_to_wall=3, inner_width=40, inner_depth=5, height=4.4, wall_thickness=2, with_bottom=0);
}

// tool forks
translate([0,-80,0]){
    hooks(3,1,spacing=30,backplane=1);
    tool_holder(5);
}

// stand for a small can
translate([0,0,50]){
    hooks(2,1);
    can_stand();
}

// cablehold
translate([0,0,-50]){
    hooks(2,1);
    cablehold();
}
*/