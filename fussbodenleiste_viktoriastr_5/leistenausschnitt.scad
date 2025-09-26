// Leiste Viktoriastr. 5

//cube([20, 40, 50]);


difference(){
    translate([-5,0,0])
    cube([25, 45, 5]);

    translate([0,-0.03,-.5])
    linear_extrude(20)
    scale([0.93, 1., 1.])
    import("/home/weis/code/3designs/fussbodenleiste_viktoriastr_5/leiste_viktoria_5.jpg.svg", dpi = 1235);
}