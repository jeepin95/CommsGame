dishR = 15;
baseX = 16;
baseY = 16;
baseZ = 2.5;

$fn = 60;
module dish() {
    translate([0,0,dishR]) difference() {
        $fn = 160;
        sphere(r=dishR);
        translate([-(dishR)-1,-(dishR)-1,-dishR/2]) cube([dishR*2+2,dishR*2+2,dishR*2]);
        sphere(r=dishR-1.2);
    }
    translate([0,0,1]) cylinder(r1=2, r2=.2, h=3);
}
translate([0,0,-5]) cube([baseX, baseY, baseZ], true);
difference() { 
    cube([baseX/2, baseY/2, 8], true);
    rotate([0,30,0]) translate([0,0,dishR]) sphere(r=dishR-1.2); 
}

rotate([0,30,0]) dish();
