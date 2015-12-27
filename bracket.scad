include <configuration.scad>;

$fa = 12;
$fs = 0.5;

w = smooth_rod_distance; // Smooth rod distance (center to center)
belt_clearance_radius=4;

module screws() {
  for (x = [-w/2, w/2]) {
    translate([x, 0, 0]) {
      // Push-through M3 screw hole.
      translate([0, -smooth_rod_diameter/2-4, 0]) rotate([0, 90, 0])
	cylinder(r=2, h=20+2*smooth_rod_diameter, center=true);
      // M3 nut holder.
      //translate([-x/5, -6, 0])
	//rotate([30, 0, 0]) rotate([0, 90, 0])
	//cylinder(r=3.2, h=2.3, center=true, $fn=6);
    }
  }
}

module bracket(h) {
  difference() {
    union() {
      translate([0, -1, 0]) cube([w+smooth_rod_diameter*2-belt_clearance_radius, 25, h], center=true);
      // Sandwich mount.
      translate([-w/2, 10, 0]) cylinder(r=6, h=h, center=true);
      translate([w/2, 10, 0]) cylinder(r=6, h=h, center=true);
    }
    // Sandwich mount.
    translate([-w/2, 12, 0]) cylinder(r=1.9, h=h+1, center=true);
    translate([w/2, 12, 0]) cylinder(r=1.9, h=h+1, center=true);
    // Smooth rod mounting slots.
    for (x = [-w/2, w/2]) {
      translate([x, 0, 0]) {
			cylinder(r=smooth_rod_diameter/2, h=h+1, center=true);
			translate([0, -10, 0]) cube([2, 20, h+1], center=true);
      }
    }
    // Belt path.
    translate([0, -9+belt_clearance_radius, 0]) cube([w-2*smooth_rod_diameter-belt_clearance_radius, 20, h+1], center=true);
    translate([0, -9, 0]) cube([w-smooth_rod_diameter*2+belt_clearance_radius, 20, h+1], center=true);
    translate([-w/2+smooth_rod_diameter+belt_clearance_radius/2, 1, 0]) cylinder(r=belt_clearance_radius, h=h+1, center=true);
    translate([w/2-smooth_rod_diameter-belt_clearance_radius/2, 1, 0]) cylinder(r=belt_clearance_radius, h=h+1, center=true);
  }
}

translate([0, 0, 10]) bracket(20);
