// led-strip single: 50x7

// 20-40-distance is 20mm

$fn=50;

//base
difference(){
    cube([40, 6, 3]);
    
    translate([20-(28.3/2), 3, -0.5])
    cylinder(r=1.55, h=4);
    
    translate([20+(28.3/2), 3,-0.5])
    cylinder(r=1.55, h=4);    
}

// pole
difference(){
    translate([20-2.5, 0,3])
    cube([5,4,100]);
    
    translate([20-2.5+1, 1.1, 3])
    cube([3, 5, 100]);
    
    translate([20,1.1,100-2])
    cube([5,5,5]);
    
    translate([20-1.5,-2,3])
    cube([3,5,3]);
}

// led holder
difference(){
    translate([-54/2+20,0,3+100])
    cube([50+4, 4, 7*5+4]);
    
    translate([-54/2+20+2, 2, 3+100+2])
    cube([50, 10, 7*5]);    
    
    translate([-54/2+20+4,2,2.9+100])
    cube([5,10,5]);
    
    translate([-54/2+60+5,2,2.9+100])
    cube([5,10,5]);
}