
include <module_RV.scad>
include <LegoBase.scad>

dishR = 10;

module dish() {
    translate([0,0,dishR]) difference() {
        $fn = 160;
        sphere(r=dishR);
        translate([-(dishR)-1,-(dishR)-1,-dishR/2]) cube([dishR*2+2,dishR*2+2,dishR*2]);
        sphere(r=dishR-1);
    }
    $fn = 60;
    translate([0,0,1]) cylinder(r1=2, r2=.2, h=3);
}

RV(false);
translate([(12/2)-(4/2),20,11]) dish();
translate([5,20,0]) LegoBase();