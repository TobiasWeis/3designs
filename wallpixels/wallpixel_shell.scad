radius_printer = 110; // leave a little slack
wall_thickness = 2;
cube_height = 50;

// calculate maximal sidelength of square that fits on round printer
max_side = sqrt(pow(2*radius_printer,2)/2);

difference(){
    color([1,1,1])
    cube([max_side, max_side, cube_height], center=true);
    translate([0,0,+wall_thickness])
    cube([max_side-2*wall_thickness, max_side-2*wall_thickness, cube_height], center=true);
}
