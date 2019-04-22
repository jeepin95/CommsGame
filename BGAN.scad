
bganX = 22;
bganY = 14;
bganZ = 1;
keyX = 1.5;
keyY = 1.5;
keyZ = 0.5;
keySpacing = 0.25;
keyStartingY = 4;

startX = -8.8;

module keyRow() {
    for(i=[1:9]) {
        translate([startX + (i*(keyX+keySpacing)),0,(bganZ/2)+(keyZ/2)]) {
            cube([keyX, keyY, keyZ], true);
        }
    }
}
cube([bganX,bganY,bganZ], true);
translate([0,(bganY/2),(bganY/2)-bganZ*2]) {
    rotate([65,0,0]) {
        cube([bganX,bganY*.75,bganZ], true);
    }
}
for(j=[1:5]) {
    translate([0,keyStartingY+(j*(-(keyY+keySpacing))),0]) {
        keyRow();
    }
}