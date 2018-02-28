// stein: höhe: 12.8, durchmesser: 18,6

difference(){
union(){
    // ring
    difference(){
        cylinder(r=18.6/2, h=10, $fn=200);
    }
    
    // stein-halterung
    difference(){
        //stein 
        translate([6,0,5])
        rotate([0,90,0])
        //cylinder(r2=18.6/2,r1=0.1, h=11.5);
        cylinder(r=5, h=11.5, $fn=200);
 
        translate([12.5,-10,-10])
        cube([22,40,40]);
        
    }
    
    // just to see if they are flush
    translate([-30,-30,10])
    %cube([60,60,10]);
}
        translate([0,0,-1])
        cylinder(r=16.6/2, h=12, $fn=200); // 14.5 ist maris ringgröße am ringfinger, ringgröße 52 passt perfekt

        //stein 
        translate([8.6,0,5])
        rotate([0,90,0])
        #cylinder(r2=18.6/2,r1=0.1, h=11.5);
}