length=10;
height=6.8;
set_in=1.5;
edge_set_in=1.5;

module logo(){
    rotate([90,0,0])
    linear_extrude(0.1)
    scale([0.05, 0.05, 0.05])
    import("/home/weis/Schreibtisch/rt_circle.svg");
}

module ecc(ext, smaller=0){
    rotate([90,0,0])
    linear_extrude(ext)
    polygon( 
    points=[
        [set_in+smaller, 4.3-smaller],
        [0+smaller, 3-smaller],
        [.5+smaller,0+smaller],
        [length-edge_set_in-smaller,0+smaller],
        [length-smaller,edge_set_in+smaller],
        [length-smaller,height-edge_set_in-smaller],
        [length-edge_set_in-smaller,height-smaller],
        [set_in+smaller,height-smaller]
        ] 
    );
}

if(true){
    color([0,0,1])
    ecc(0.1);
}

color([0,1,0])
translate([3.5,0.001,2])
logo();

translate([0,-0.1,0])
color([0,1,0])
difference(){
    ecc(3);
    translate([0,.5,0])
    ecc(4, smaller=0.2);
    
    // cutout for bottles
    translate([0.25,-2.75, 3.1])
    rotate([0,-41,0])
    cube([1.5, 2.5, 0.1]);
    
    // cutout for screen
    translate([set_in-0.001, -2.75, 4.7])
    cube([.1, 2.5, 1.5]);
}

if(true){
    translate([0,-3.1,0])
    color([0,0,1])
    ecc(0.1);
}