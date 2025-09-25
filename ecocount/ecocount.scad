length=10;
height=6.8;
set_in=1.5;
edge_set_in=1.5;

module logo(){
    rotate([90,0,0])
    linear_extrude(0.1)
    scale([0.05, 0.05, 0.05])
    import("/home/weis/code/3designs/ecocount/rt_circle.svg");
}

module logo_offset(){
    rotate([90,0,0])
    linear_extrude(0.1)
    offset(delta=-0.08)
    scale([0.05, 0.05, 0.05])
    import("/home/weis/code/3designs/ecocount/rt_circle.svg");
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

if(false){
    color([0,0,1])
    difference(){
        ecc(0.1);
        translate([3.5,0.01,2])
        logo();
    }
    
    translate([0,-0.1])
    difference(){
        ecc(0.7, 0.25);
        translate([0,.05,0])
        ecc(0.8, 0.5);
    }
}

// hollow middle part
if (false){
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
}

if (false){
    translate([0,-0.1,0])
    color([0,1,0])
    difference(){
        ecc(3);
        
        // cutout for bottles
        translate([0.25,-2.75, 3.1])
        rotate([0,-41,0])
        cube([1.5, 2.5, 0.1]);
        
        // cutout for screen
        translate([set_in-0.001, -2.75, 4.7])
        cube([.1, 2.5, 1.5]);
        
        // logo-cutout
        translate([3.1, 0.01, 1.3])
        scale([1.5, 3, 1.5])
        logo();
        
        // logo-cutout 2
        translate([3.1, -3.01+0.3, 1.3])
        scale([1.5, 3, 1.5])
        logo();
    }
    
    // add keychain-loop
    translate([length,-0.1, 3.5])
    rotate([90,20,0])
    difference(){
        cylinder(r=1.5, h=1.5, $fn=8);
        translate([0,0,-0.01])
        cylinder(r=1.2, h=1.6, $fn=8);
    }
}


if(false){
    translate([0,-3.1,0])
    color([0,0,1])
    difference(){
        ecc(0.1);
        translate([3.5,-0.01,2])
        logo();
    }
    
    translate([0,-2.4])
    difference(){
        ecc(0.7, 0.25);
        translate([0,.05,0])
        ecc(0.8, 0.5);
    }
}

// rt-logo keychain
if(true){
    if(false){
        color([0, 0.5, 1])
        difference(){
            scale([1, 2, 1])
            logo();
            
            translate([0, -0.101, 0])
            logo_offset();
        }
        
        // hanger
        color([0, 0.5, 1])
        translate([0,0,1.4])
        rotate([90,0,0])
        difference(){
            cylinder(r=0.5, h=0.1, $fn=32);
            translate([0,0,-0.01])
            cylinder(r=0.4, h=0.2, $fn=64);
            translate([0.2, -0.5, -.3])
            cube([1, 1, 1]);
        }
    }else{
        color([0, 1, 0])
        translate([0, -0.101, 0])
        logo_offset();
    }
    
}