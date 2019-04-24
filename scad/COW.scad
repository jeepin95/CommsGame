
trailerY = 21;
trailerX = 12;
trailerZ = 7;
towerR = 2;
towerZ = 6;
antennaR = 5;
antennaZ = 4;
antennaOffset = 2;
$fn = 160;

difference() {
union() {
translate([trailerX/2, trailerY*.2, -trailerZ/2+.5]) rotate([0,90,0]) cylinder(r=2, h=1.5);
translate([-trailerX/2-1.5, trailerY*.2, -trailerZ/2+.5]) rotate([0,90,0]) cylinder(r=2, h=1.5);
}
translate([0,0,-trailerZ/2-2]) cube([trailerX*2, trailerY*2, 4], true);

}

translate([0,-trailerY/2-5,-trailerZ/2+1]) {
    
rotate(90) {
    
    rotate(30) translate([4.2,0,0]) cube([10,2,2], true);
    rotate(-30) translate([4.2,0,0]) cube([10,2,2], true);
}
}
roundedcube([trailerX, trailerY, trailerZ], true, 0.6, "zmax");




module antenna() {

        cylinder(r=towerR, h=towerZ);
        difference() {
            union() {
                translate([0,0,towerZ+antennaOffset]) {
                    cylinder(r=antennaR, h=antennaZ);
                }    
                translate([0,0,towerZ]) {
                    cylinder(r1=towerR, r2=antennaR, h=2);
                }
            }

            for(i=[1:7]) {
                rotate_about_pt(51.429*i, 0, [0,0,0]) {
                    translate([antennaR,0,towerZ+antennaOffset/2]) rotate(51.429) cylinder(r=1, h=antennaZ+5, $fn=3);
                }
            }
        }
    
}
translate([0,trailerY/4,trailerZ/2]) {
    antenna();
}

// rotate as per a, v, but around point pt
module rotate_about_pt(a, v, pt) {
    translate(pt)
        rotate(a,v)
            translate(-pt)
                children();   
}

// Module from: https://danielupshaw.com/openscad-rounded-corners/
// Higher definition curves
$fs = 0.1;
module roundedcube(size = [1, 1, 1], center = false, radius = 0.5, apply_to = "all") {
	// If single value, convert to [x, y, z] vector
	size = (size[0] == undef) ? [size, size, size] : size;

	translate_min = radius;
	translate_xmax = size[0] - radius;
	translate_ymax = size[1] - radius;
	translate_zmax = size[2] - radius;

	diameter = radius * 2;

	module build_point(type = "sphere", rotate = [0, 0, 0]) {
		if (type == "sphere") {
			sphere(r = radius);
		} else if (type == "cylinder") {
			rotate(a = rotate)
			cylinder(h = diameter, r = radius, center = true);
		}
	}

	obj_translate = (center == false) ?
		[0, 0, 0] : [
			-(size[0] / 2),
			-(size[1] / 2),
			-(size[2] / 2)
		];

	translate(v = obj_translate) {
		hull() {
			for (translate_x = [translate_min, translate_xmax]) {
				x_at = (translate_x == translate_min) ? "min" : "max";
				for (translate_y = [translate_min, translate_ymax]) {
					y_at = (translate_y == translate_min) ? "min" : "max";
					for (translate_z = [translate_min, translate_zmax]) {
						z_at = (translate_z == translate_min) ? "min" : "max";

						translate(v = [translate_x, translate_y, translate_z])
						if (
							(apply_to == "all") ||
							(apply_to == "xmin" && x_at == "min") || (apply_to == "xmax" && x_at == "max") ||
							(apply_to == "ymin" && y_at == "min") || (apply_to == "ymax" && y_at == "max") ||
							(apply_to == "zmin" && z_at == "min") || (apply_to == "zmax" && z_at == "max")
						) {
							build_point("sphere");
						} else {
							rotate = 
								(apply_to == "xmin" || apply_to == "xmax" || apply_to == "x") ? [0, 90, 0] : (
								(apply_to == "ymin" || apply_to == "ymax" || apply_to == "y") ? [90, 90, 0] :
								[0, 0, 0]
							);
							build_point("cylinder", rotate);
						}
					}
				}
			}
		}
	}
}
