include <configuration.scad>
use <bracket.scad>

h = motor_end_height; // Total height.
m = 29; // Motor mounting screws distance (center to center)
rips_thickness = 5;

module motor_end() {
    translate([0, 0, h/2]) 
    difference() {
    union() {
      bracket(h);
      for (x = [-smooth_rod_distance/2, smooth_rod_distance/2]) {
        // Diagonal fins.
        translate([x, 29.5, 0]) intersection() {
          cube([5, 30, h], center=true);
          rotate([45, 0, 0]) translate([0, -50, 0])
            cube([20, 100, 100], center=true);
        }
        // Extra mounting screw holes.
        translate([x, 47, 4-h/2]) difference() {
          cylinder(r=5, h=8, center=true, $fn=24);
          translate([0, 1, 0]) cylinder(r=1.9, h=9, center=true, $fn=12);
        }
		//extra rips
		translate([0,10+rips_thickness/2,-h/2+rips_thickness/2])rip(rips_thickness,smooth_rod_distance-4);
		rotate([0,0,90])translate([29.5,-smooth_rod_distance/2+rips_thickness,-h/2+rips_thickness/2])rip(rips_thickness,30+10);
		rotate([0,0,-90])translate([-29.5,-smooth_rod_distance/2+rips_thickness,-h/2+rips_thickness/2])rip(rips_thickness,30+10);
      }
    }
    // Motor shaft (RepRap logo)
    rotate([90, 0, 0]) cylinder(r=12, h=40, center=true);
    translate([0, 0, sin(45)*12]) rotate([0, 45, 0])
      cube([12, 40, 12], center=true);
    // Motor mounting screw slots
    translate([m/2, 0, m/2]) rotate([0, -45, 0])
      cube([9, 40, 3], center=true);
    translate([-m/2, 0, m/2]) rotate([0, 45, 0])
      cube([9, 40, 3], center=true);
    translate([m/2, 0, -m/2]) rotate([0, 45, 0])
      cube([9, 40, 3], center=true);
    translate([-m/2, 0, -m/2]) rotate([0, -45, 0])
      cube([9, 40, 3], center=true);
    for (z = [-14, 0, 14]) {
      translate([0, 0, z]) screws();
    }
  }
}

module rip(h=10,l=100) {
	difference() {
		cube([l,h,h],center=true);
		rotate([45,0,0])translate([0,h,0])cube([l+2,2*h,2*h],center=true);
	}
}

motor_end();
