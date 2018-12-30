width=20;
length=20;
height=10;

module base(){
    difference(){
        union(){
            cube([width,length,height]);
            translate([10,0,0])
            cylinder(r=10,h=height,$fn=30);
        }
        hull(){
            translate([width/2,0,-5])
            cylinder(r=4.5, h=20, $fn=50);
            
            translate([width/2,length-8,-5])
            cylinder(r=4.5, h=20, $fn=50);    
        }
        
        /*
        translate([width/2,length-8,-0.01])
        #cylinder(r=15/2, h=7, $fn=6);        
        */
        
        for(offset = [0 : 4 : length-4]){
            translate([0,offset,-5])
            cylinder(r=1.5, h=20, $fn=8);
            
            translate([width,offset,-5])
            cylinder(r=1.5, h=20, $fn=8);        
        }
    }

    difference(){
        translate([0, length, 0])
        cube([width, 5, height]);
        
        /*
        translate([-0.5,length,0])
        rotate([-20,0,0])
        cube([width+1, 10, 20]);
        */
        translate([-0.5, length, 5.01])    
        cube([width+1, 10,5]);
    }
    translate([0, length, 0])
    cube([width, 5, 4]);
}

//////////////////////////////// deckel
module deckel(){
    translate([0,0,height+10]){
        difference(){
            union(){
                translate([-1.3,0,0])
                cube([width+2*1.3,length+5,3]);
                translate([0,length+0.5,-5+1.5])
                cube([width,5-0.5,5-1.5]);
                
                translate([10,0,0])
                cylinder(r=11.3,h=3,$fn=30);            

                for(offset = [0 : 4 : length-4]){
                    translate([0,offset,-3])
                    cylinder(r=1.3, h=3, $fn=8);
                    
                    translate([width,offset,-3])
                    cylinder(r=1.3, h=3, $fn=8);        
                }            
                
            }
           hull(){
                translate([width/2,0,-5])
                cylinder(r=4.5, h=20, $fn=50);
                
                translate([width/2,length-8,-5])
                cylinder(r=4.5, h=20, $fn=50);    
            }        
        }
    }
}

base();
deckel();