// skadis zubehör

$fn=64;

loch_width=5;
loch_height=25;

loch_abstand_horizontal=40; // mitte zu mitte
loch_abstand_vertikal=40;

dicke_skadis=5.;
r_skadis=2.5;

tolerance=0.15;

h_secondary=5.5;

s=3;

module loch(){
    hull(){
        cylinder(r=2.5, h=10);
        translate([0, 15-2*2.5, 0])
        cylinder(r=2.5, h=10);
    }
}

//loch();

// skadis-dicke: ~5.5mm

module clippy_sphere(){
    bump_width=0.8;
    slit_width=0.3;
    
    difference(){
        union(){
            translate([0, dicke_skadis+(r_skadis-tolerance+bump_width)/4, 0])
            sphere(r=r_skadis-tolerance + bump_width);
            
            translate([0, h_secondary, 0])
            rotate([90, 0, 0])
            cylinder(r=r_skadis-tolerance, h=h_secondary);
        }
        
        translate([-5, 0, -slit_width/2])
        cube([10, 10, slit_width]);
        
        translate([-5, 5, -4*slit_width/2])
        cube([10, 5, 4*slit_width]);
        
        translate([-5, dicke_skadis+(r_skadis-tolerance+bump_width)/3, 0])
        rotate([0, 90, 0])
        cylinder(r=1.5, h=10);
        
        translate([r_skadis-tolerance, 0, -3])
        cube([5, 20, 10]);
        
        translate([-5-(r_skadis-tolerance), 0, -3])
        cube([5, 20, 10]);
    }
}

module clippy_oval(){
    bump_width=0.4;
    slit_width=0.7;
    
    difference(){
        union(){
            hull(){
                translate([0, dicke_skadis+(r_skadis-tolerance+bump_width)/4.5, 0])
                sphere(r=r_skadis-tolerance + bump_width);
            
                translate([0, dicke_skadis+(r_skadis-tolerance+bump_width)/4.5, r_skadis+tolerance])
                sphere(r=r_skadis-tolerance + bump_width);
            
                translate([0, dicke_skadis+(r_skadis-tolerance+bump_width)/4.5, 6])
                sphere(r=r_skadis-tolerance + bump_width);
                
                translate([0, dicke_skadis+(r_skadis-tolerance+bump_width)/4.5, 15-2*(r_skadis-tolerance)])
                sphere(r=r_skadis-tolerance + bump_width);

            }
            
            hull(){
                translate([0, h_secondary, 0])
                rotate([90, 0, 0])
                cylinder(r=r_skadis-tolerance, h=h_secondary);
                
                translate([0, h_secondary, 15-2*(r_skadis-tolerance)])
                rotate([90, 0, 0])
                cylinder(r=r_skadis-tolerance, h=h_secondary);
                
            }
        }
        
        translate([-slit_width/2, 0, -5])
        cube([slit_width, 10, 20]);
        
        translate([-3*slit_width/2, 5, -5])
        cube([3*slit_width, 5, 20]);
        
        translate([0, dicke_skadis+(r_skadis-tolerance+bump_width)/3, -5])
        rotate([0, 0, 0])
        cylinder(r=1.4, h=20);
        
        translate([-10, 0, -10-r_skadis+tolerance])
        cube([100, 20, 10]);
        
        translate([-10, 0, 15-r_skadis+tolerance])
        cube([100, 20, 10]);
    }
}

module holder(height=1, hook_r=r_skadis){
    bump_width=0.8;
    slit_width=0.3;
    
            
    clippy_sphere();
    
    if(height == 2){
        translate([0, 0, -40])
        clippy_sphere();
    }
    
    difference(){
        scale([1.03, 1, 1]){
            translate([0, dicke_skadis+r_skadis, 40-(15-2*r_skadis)+0.5])
            rotate([90, 0, 0])
            cylinder(r=r_skadis-tolerance, h=dicke_skadis+r_skadis);
            
            translate([0, dicke_skadis+r_skadis, 40-(15-2*r_skadis)+0.5])
            sphere(r=r_skadis-tolerance);
            
            translate([0, dicke_skadis+r_skadis+1.3, 40-(15-2*r_skadis)-8+0.5])
            rotate([10,0,0])
            cylinder(r=r_skadis-tolerance, h=8);
            
            translate([0, dicke_skadis+r_skadis+1.3, 40-(15-2*r_skadis)-8+0.5])
            sphere(r=r_skadis-tolerance);

            if(false){
                translate([-r_skadis+tolerance, -s, -r_skadis])
                cube([2*(r_skadis-tolerance), s, 40-(15-2*r_skadis)+2*r_skadis+0.5]);
            }
            
            // text on front
            translate([-1.5,-s, 15])
            scale([0.4, 1, 0.4])
            rotate([90,0,0])
            linear_extrude(.2)
            text(str(2*hook_r));
            
            hull(){
                hull(){
                    translate([0,0,40-(15-2*r_skadis)+0.5])
                    rotate([90, 0, 0])
                    cylinder(r=r_skadis-tolerance, h=0.01);
                    
                    translate([r_skadis-hook_r+tolerance,-s,40-(15-2*r_skadis)+0.5])
                    rotate([90, 0, 0])
                    cylinder(r=hook_r-tolerance, h=0.01);
                }
                 
                hull(){
                    translate([0,0, -(height-1)*40])
                    rotate([90, 0, 0])
                    cylinder(r1=r_skadis-tolerance, r2=hook_r-tolerance, h=0.01);
                    
                    translate([r_skadis-hook_r+tolerance,-s,-(height-1)*40])
                    rotate([90, 0, 0])
                    cylinder(r=hook_r-tolerance, h=0.01);
                }
            }
        }
        
        // DIFF
        translate([r_skadis-tolerance, -50, -50])
        cube([5, 100, 100]);
        
        translate([-5-(r_skadis-tolerance), -50, -50])
        cube([5, 100, 100]);
    }
}

// attachment
// magnetschiene, 23.5 hoch, 13 tief, 45cm lang
module attachment_magnetschienen(){
    difference(){
        union(){        
            hull(){
                translate([0, -s, 0])
                rotate([90, 0, 0])
                cylinder(r=r_skadis-tolerance, h=13+s-r_skadis/2);
                
                translate([0, -s, 40-(15-2*r_skadis)+0.5])
                rotate([90, 0, 0])
                cylinder(r=r_skadis-tolerance, h=13+s-r_skadis/2);
            }
            
            hull(){
                translate([0, -s-13-s+r_skadis/2, 0])
                rotate([90, 0, 0])
                sphere(r=r_skadis-tolerance);
                
                translate([0, -s-13-s+r_skadis/2, 40-(15-2*r_skadis)+0.5])
                rotate([90, 0, 0])
                sphere(r=r_skadis-tolerance);
            }
        }

        translate([-10, -13-s, ((40-(15-2*r_skadis)+0.5)-23.5+tolerance)/2])
        difference(){
            cube([450, 13+tolerance, 23.5+tolerance]);
            translate([10, 0, 2.6])
            cube([450, 13+tolerance-2.2, 23.5+tolerance-2*2.6]);
        }
    }
}

module attachment_hook(hook_r=r_skadis){
    difference(){
        scale([1.03, 1, 1])
        translate([r_skadis-hook_r+tolerance, 0, 0])
        union(){        
            translate([0, 0, 40-(15-2*r_skadis)+0.5]){
                translate([0, -s, 0])
                rotate([90, 0, 0])
                cylinder(r=(hook_r-tolerance), h=10+s-r_skadis/2);
                
                hull(){
                    translate([0, -s-10-s+r_skadis/2, 0])
                    rotate([90, 0, 0])
                    sphere(r=hook_r-tolerance);
                    
                    translate([0, -s-13-s+r_skadis/2, 1.5])
                    rotate([90, 0, 0])
                    sphere(r=hook_r-tolerance);
                }
            }
        }
        
        translate([r_skadis-tolerance, -50, -50])
        cube([5, 100, 100]);
        
        translate([-5-(r_skadis-tolerance), -50, -50])
        cube([5, 100, 100]);
    }
}

module attachment_heavy_duty_hook(){
    difference(){        
        scale([1.05, 1, 1]){
            translate([0, 0, 0]){
                hull(){
                    translate([0, -s, 0])
                    rotate([90, 0, 0])
                    cylinder(r=r_skadis-tolerance, h=0.1); //h=40+s-r_skadis/2);
                    
                    translate([0, -10, -3])
                    sphere(r=r_skadis-tolerance);
                }
                
                hull(){
                    translate([0, -10, -3])
                    sphere(r=r_skadis-tolerance);
                    
                    translate([0, -35, -3])
                    sphere(r=r_skadis-tolerance);
                }
                
                hull(){
                    translate([0, -35, -3])
                    sphere(r=r_skadis-tolerance);
                    
                    translate([0, -s-40-s+r_skadis/2, 0])
                    sphere(r=r_skadis-tolerance);
                }
                
                hull(){
                    translate([0, -s-40-s+r_skadis/2, 0])
                    rotate([90, 0, 0])
                    sphere(r=r_skadis-tolerance);
                    
                    translate([0, -s-44-s+r_skadis/2, 5])
                    rotate([90, 0, 0])
                    sphere(r=r_skadis-tolerance);
                }
                
                hull(){
                    translate([0, -s-40-s+r_skadis/2, 0])
                    rotate([90, 0, 0])
                    sphere(r=r_skadis-tolerance);
                    
                    translate([0,0, -40])
                    rotate([90, 0, 0])
                    cylinder(r=r_skadis-tolerance, h=s);
                }
            }
        }
        
        translate([r_skadis-tolerance, -50, -50])
        cube([5, 100, 100]);
        
        translate([-5-(r_skadis-tolerance), -50, -50])
        cube([5, 100, 100]);
    }
}

module attachment_caliper(){
    translate([-r_skadis+tolerance, -s-8, -r_skadis-tolerance])
    difference(){
        cube([40+2*r_skadis-2*tolerance, 8, 35.5]);
        
       translate([70, 8, 37])
        rotate([-90, 0, 180])
        linear_extrude(6)
        import("caliper.svg", dpi=580);
        
        translate([70, 2, 34])  // front
        rotate([-90, 0, 180])
        linear_extrude(5)
        import("caliper.svg", dpi=580);
        
    }
}


module attachment_zangenhalter(inner_depth=10, inner_width=40, height=15, bottom=0){
    
    difference(){
        hull(){
            for(x=[0:inner_width:inner_width+1]){
                translate([x,0,0]){
                    //#sphere(r_skadis-tolerance);
                    rotate([90,0,0])
                    cylinder(r=r_skadis-tolerance, h=0.01);
                    
                    translate([0,-inner_depth - r_skadis,0])
                    sphere(r_skadis-tolerance);
                
                    translate([0, -inner_depth - r_skadis, height-2*(r_skadis-tolerance)])
                    sphere(r_skadis-tolerance);
                
                    translate([0, 0, height-2*(r_skadis-tolerance)])
                    rotate([90,0,0])
                    cylinder(r=r_skadis-tolerance, h=0.01);
                }
            }
        }
        
        tz=-r_skadis+tolerance + bottom;
        
        translate([0,0,tz])
        hull(){
            translate([1, -inner_depth/2-r_skadis-1, 0])
            cube([inner_width-2, inner_depth/2-2, 0.01]);
            
            translate([0, -inner_depth/2-r_skadis, height])
            cube([inner_width, inner_depth/2, 0.01]);
            
            translate([r_skadis, -inner_depth, 0])
            cylinder(r2=r_skadis, r1=r_skadis-1,  h=height);
            
            translate([inner_width-r_skadis, -inner_depth, 0])
            cylinder(r2=r_skadis, r1=r_skadis-1, h=height);
        
        }
    }
}

module attachment_flach(){
    difference(){        
        union(){
            translate([tolerance, -s, tolerance])
            rotate([90, 0, 0])
            cylinder(r=r_skadis, h=3);
            
            hull(){
                translate([tolerance, -s-3, tolerance])
                rotate([90, 0, 0])
                cylinder(r=r_skadis, h=3);
                
                translate([tolerance, -s-3, 15])
                rotate([90, 0, 0])
                cylinder(r=r_skadis, h=3);
            }
        }
        
        translate([r_skadis-tolerance, -50, -50])
        cube([5, 100, 100]);
        
        
        translate([-5-(r_skadis-tolerance), -50, -50])
        cube([5, 100, 100]);
    }
}


if(true){ // leiste mit vielen haken
    clippy_oval();
    translate([40*3, 0, 0])
    clippy_oval();
    
    hull(){
        rotate([90, 0, 0])
        cylinder(r=r_skadis-tolerance, h=2);
        
        translate([40*3,0,0])
        rotate([90, 0, 0])
        cylinder(r=r_skadis-tolerance, h=2);
        
        translate([40*3,0, 15-2*(r_skadis-tolerance)])
        rotate([90, 0, 0])
        cylinder(r=r_skadis-tolerance, h=2);
        
        translate([0,0, 15-2*(r_skadis-tolerance)])
        rotate([90, 0, 0])
        cylinder(r=r_skadis-tolerance, h=2);
    }
    
    for(x=[-1.8/2:(40*3)/7:40*3]){
        translate([x, 1, -30.505-0.7])
        attachment_hook(hook_r=1.8);
    }
    
    //translate([-r_skadis+tolerance, -s, -r_skadis+tolerance])
    //cube([20*8+2+r_skadis-tolerance, 3, 15]);
}

if(false){ // geodreieck, papier, flache sachen
    holder(height=1);
    attachment_flach();
}


if(false){ // schmaler zangenhalter
    clippy_oval();
    inner_width=9;
    translate([-inner_width/2, 0, 0])
    attachment_zangenhalter(inner_depth=9, inner_width=inner_width, height=35, bottom=1);
}

if(false){ // breiter Zangenhalter
    clippy_oval();
    
    translate([40, 0, 0])
    clippy_oval();
    
    attachment_zangenhalter(inner_depth=15);
}

if(false){ // breites, tiefes regal
    clippy_oval();
    
    hook_distance = 2*40;
    
    translate([hook_distance, 0, 0])
    clippy_oval();
    
    inner_width=84;
    
    translate([r_skadis-tolerance - ((inner_width+2*(r_skadis-tolerance)) - hook_distance)/2 , 0, 0])
    attachment_zangenhalter(inner_depth=25, inner_width=inner_width, height=30, bottom=1);
}

if(false){  // halterung für schieblehre
    holder(height=1);
    translate([40, 0, 0])
    holder(height=1);
    
    
    translate([40,0,40])
    rotate([0, 180, 0])
    //mirror([0,0,1])
    attachment_caliper();
}

if(false){
    holder(height=1);
    attachment_magnetschienen();
}

if(false){ // standard 5mm hook
    holder(height=1);
    attachment_hook(hook_r=r_skadis);
}

if(false){ // 4mm hook
    holder(height=1, hook_r=2);
    attachment_hook(hook_r=2);
}

if(false){  // heavy-duty hook
    holder(height=2, hook_r=r_skadis);
    attachment_heavy_duty_hook();
}