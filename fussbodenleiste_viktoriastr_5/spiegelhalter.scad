// Leiste Viktoriastr. 5

//cube([20, 40, 50]);

length = 200;
depth = 70;

w = 100;
h = 10;
d = 200;

f = 20;
a = .3;
dt = 0.5;

module wavey(width, height, length, a, f, dt) {
    for (x = [-length:dt:length] ){
        hull(){
            z = a * sin(f * (x / length) * 360.0);
            translate([x,0,z]){
                cube([dt, width, height]);
            }
            g = a * sin(f * ((x-dt) / length) * 360.0);
            translate([x-dt,0,g]){
                cube([dt, width, height]);
            }
        }
    }
}

module boden_halter(){
    difference(){
        translate([-(depth-20),0,0])
        cube([depth, 45, length]);

        translate([0,-0.03,-.5])
        linear_extrude(length+1)
        scale([0.93, 1., 1.])
        import("/home/weis/code/3designs/fussbodenleiste_viktoriastr_5/leiste_viktoria_5.jpg.svg", dpi = 1235);
        
        // spiegel-einschub
        translate([-(depth-25), 40.001, -.5])
        cube([4.5, 5, length+1]);
        
        // textur
        translate([-(depth-10.5), 0, w/2])
        rotate([0, 90, 0])
        wavey(w, h, d, a, f, dt);
    }
}

module wand_halter_oben(){
    difference(){
        translate([-(depth-20), 0, 0])
        cube([depth, 45, length]);
        
        // spiegel-einschub
        translate([-(depth-25), -0.001, -.5])
        cube([4.5, 40, length+1]);
        
        // spiegel-einschub
        translate([-(depth-19.99), -0.001, -.5])
        cube([5.501, 35, length+1]);
        
        // textur
        translate([-(depth-10.5), 0, w/2])
        rotate([0, 90, 0])
        wavey(w, h, d, a, f, dt);
        
    }
}

boden_halter();

translate([0, 50, 0])
wand_halter_oben();