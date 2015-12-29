include <configuration.scad>

radius = tower_radius-smooth_rod_diameter/2; // pretty close to 150/cos(30)
radius2 = radius/cos(30);
radius3 = radius2/cos(30)/2;
offset = tower_radius-radius;

module plywood() {
  echo("ground site: ", 2*tower_radius-smooth_rod_diameter/2);  
  difference() {
    intersection() { //-smooth_rod_diameter/2
      cube([2*tower_radius, tower_radius*2, plywood_thickness], center=true);
      translate([0, smooth_rod_diameter/2, 0]) rotate([0, 0, 30])
	cylinder(r=2*(tower_radius-smooth_rod_diameter/2), h=20, center=true, $fn=3);
    }
    for (a = [0, 120, 240]) {
      translate([0, smooth_rod_diameter/2, 0]) rotate([0, 0, a]) {
	translate([-smooth_rod_distance/2, tower_radius-smooth_rod_diameter/2-sandwich_smooth_rod_mounting_screw_distance/2, 0])
	  cylinder(r=2.2, h=20, center=true, $fn=12);
	translate([smooth_rod_distance/2, tower_radius-smooth_rod_diameter/2-sandwich_smooth_rod_mounting_screw_distance/2, 0])
	  cylinder(r=2.2, h=20, center=true, $fn=12);
      }
    }
  }
}

projection()translate([0, -smooth_rod_diameter/2, motor_end_height+bed_thickness/2 + 5]) plywood();

%translate([0, 0, motor_end_height+bed_thickness/2])
	cylinder(r=(tower_radius-smooth_rod_diameter/2)/cos(30), h=bed_thickness, center=true, $fn=6);

HEATED_BED = 8 * 25.4;
% translate([0, 10, motor_end_height+bed_thickness/2 +10]) cube([HEATED_BED, HEATED_BED, 2], center=true);
