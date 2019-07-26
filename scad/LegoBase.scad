$fn = 60;
rOuter = 3.257;
rInner = 2.057;
bOuter = 15.8;
bInner = 13.4;
bOuterZ = 3.2;
bInnerZ = 2;

bInnerOffset = (bOuter-bInner)/2;
boxCenter = bOuter/2;


module LegoBase() {
translate([-bOuter/2, -bOuter/2, -bOuterZ])
    {
    difference() {
        cube([bOuter,bOuter,bOuterZ]);
        translate([bInnerOffset,bInnerOffset,0]) cube([bInner,bInner,bInnerZ]);
    };

    difference() {
        translate([boxCenter,boxCenter,0]) cylinder(h=bInnerZ, r=rOuter);
        translate([boxCenter,boxCenter,0]) cylinder(h=bInnerZ, r=rInner);
    };
}
}

