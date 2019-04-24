baseX = 16;
baseY = 16;
baseZ = 3;

phoneX = baseX;
phoneY = baseY/2;
phoneZ = 2;
phoneTilt = 45;

$fn = 60;

topAngle = 180-90-phoneTilt;
phoneHeight = phoneX * sin(phoneTilt)/sin(90);
phoneOffset = phoneX * sin(topAngle)/sin(90);

echo("Top Angle: ", topAngle);
echo("Phone Height: ", phoneHeight);
echo("Phone Offset: ", phoneOffset);


translate([0,0,(phoneX/2)-baseZ/2]) rotate([0,phoneTilt,0]) cube([phoneX, phoneY, phoneZ], center=true);

translate([-phoneOffset/2, -phoneY/2, phoneHeight-baseZ/2]) cylinder(r=1.5, h=phoneX);

cube([baseX, baseY, baseZ], center=true);
