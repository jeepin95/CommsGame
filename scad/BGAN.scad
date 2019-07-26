include <LegoBase.scad>
bganX = 22;
bganY = 14;
bganZ = 1.5;
keyX = 1.5;
keyY = 1.5;
keyZ = 1;
keySpacing = 0.35;
keyStartingY = 4;

startX = -8.8;

module keyRow() {
    for(i=[1:9]) {
        translate([startX + (i*(keyX+keySpacing)),0,(bganZ/2)+(keyZ/2)]) {
            cube([keyX, keyY, keyZ], true);
        }
    }
}
scale([1.2, 1.2, 1.2]) {
    union() {
        cube([bganX,bganY,bganZ], true);
        translate([0,(bganY/1.5),(bganY/2)-bganZ*.5]) {
            rotate([65,0,0]) {
                cube([bganX,bganY,bganZ], true);
            }
        }
        for(j=[1:5]) {
            translate([0,keyStartingY+(j*(-(keyY+keySpacing))),0]) {
                keyRow();
            }
        }
        #translate([keyX/2-keySpacing,-3*(keyY+keySpacing)+keySpacing,(bganZ/2)+(keyZ/2)]) cube([(keyX*3)+(keySpacing*2), keyY+.1, keyZ], true);
    }
}


LegoBase();