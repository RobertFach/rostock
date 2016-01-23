include <configuration.scad>
$fn=50;

module metallparts(smoothrod_dia) {
	cylinder(r=smoothrod_dia/2,h=100,center=true);
	translate([0,10,0])rotate([0,90,0])cylinder(r=1.6,h=50,center=true);
	translate([0,20,0])rotate([0,90,0])cylinder(r=1.6,h=50,center=true);
	translate([0,-10,0])rotate([0,90,0])cylinder(r=1.6,h=50,center=true);
}

module rod_helper(smoothrod_dia) {
	difference() {
		translate([0,5,0])cube([20,40,10],center=true);
		cube([1,60,15], center=true);
	   translate([5,22.5,0])cube([11,15,15],center=true);
		metallparts(smoothrod_dia);
	}
}

%metallparts(smooth_rod_diameter);
rod_helper(smooth_rod_diameter);