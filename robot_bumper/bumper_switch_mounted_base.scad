// 18, 16

difference(){
    translate([-5,0,0])
    cube([25,22,4]);
    
    sx = 3;
    sy = 3;
    
    //translate([sx,sy,-0.5])
    //#cylinder(r=1.6/2, h=10, $fn=200);
    
    translate([sx+15.5-1.6,sy,-0.5])
    #cylinder(r=1.7, h=10, $fn=200);
    
    translate([sx,sy+17.5-1.6, -0.6])
    #cylinder(r=1.7, h=10, $fn=200);
    
    //translate([sx+16-1.6,sy+18-1.6, -0.6])
    //#cylinder(r=1.6/2, h=10, $fn=200);
    
    // switch
    translate([-5,0,4])
    %cube([20,15,6]);
    
    //screw-holes for switch
    translate([-2.5,5.7,-0.1])
    #cube([15, 3.4, 10]);
    
    //translate([sx-1.6/2,0,5])
    //cube([16,5,2]);
}
