use <platform.scad>


platform();

rotate([0,180,30])translate([0,0,-64])import("diamond-rmax4.stl", convexity=3);