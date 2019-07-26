include <LegoBase.scad>
topLabel = "L";
towerBaseX = 16;
towerBaseY = 16;
towerBaseZ = 3;
towerX = 13;
towerY = 13;
towerZ = 39;
towerPosts = 2;
postOffset = (towerX/2)-towerPosts/2;
segZ = ((towerZ)/3);
echo(segZ);
fontHeight = 10;


//cube([towerBaseX, towerBaseY, towerBaseZ], center=true);

translate([0,0,towerZ]) {
    cube([towerX, towerY, towerPosts], center=true);
}

towerLegs();
towerHorizontal();
towerCrosses();
rotate(90) towerCrosses();
translate([0,towerY/4,(towerPosts/2+towerZ+fontHeight/2)-.2]) topText(topLabel);

module topText(label) {
    rotate([90,0,0]) {
        linear_extrude(height = towerX/2) {
            text(label, size=fontHeight, font="Arial Black:Style=bold", halign="center", valign="center");
        }
    }
}

module towerCrosses() {
    translate([0,postOffset,segZ/2]) towerCross();
    translate([0,-postOffset,segZ/2]) towerCross();
    translate([0,postOffset,(segZ/2)*3]) towerCross();
    translate([0,postOffset,(segZ/2)*5]) towerCross();
    translate([0,-postOffset,(segZ/2)*3]) towerCross();
    translate([0,-postOffset,(segZ/2)*5]) towerCross();
}

module towerCross() {
    rotate([0,45,0]) {
        cube([towerX+1.5, towerPosts, towerPosts/2], center=true);
    }
    rotate([0,-45,0]) {
        cube([towerX+1.5, towerPosts, towerPosts/2], center=true);
    }
}



module towerLegs() {
    translate([postOffset, postOffset,towerZ/2]) {
        cube([towerPosts, towerPosts, towerZ], center=true);
    }
    translate([-postOffset, -postOffset,towerZ/2]) {
        cube([towerPosts, towerPosts, towerZ], center=true);
    }
    translate([-postOffset, postOffset,towerZ/2]) {
        cube([towerPosts, towerPosts, towerZ], center=true);
    }
    translate([postOffset, -postOffset,towerZ/2]) {
        cube([towerPosts, towerPosts, towerZ], center=true);
    }
}

module towerHorizontal() {
        
    translate([0,postOffset,segZ]) {
        cube([towerX, towerPosts, towerPosts], center=true);
    }
    translate([0,postOffset,segZ*2]) {
        cube([towerX, towerPosts, towerPosts], center=true);
    }

    translate([0,-postOffset,segZ]) {
        cube([towerX, towerPosts, towerPosts], center=true);
    }
    translate([0,-postOffset,segZ*2]) {
        cube([towerX, towerPosts, towerPosts], center=true);
    }

    translate([postOffset, 0,segZ]) {
        cube([towerPosts, towerY, towerPosts], center=true);
    }
    translate([postOffset, 0,segZ*2]) {
        cube([towerPosts, towerY, towerPosts], center=true);
    }

    translate([-postOffset, 0,segZ]) {
        cube([towerPosts, towerY, towerPosts], center=true);
    }
    translate([-postOffset, 0,segZ*2]) {
        cube([towerPosts, towerY, towerPosts], center=true);
    }
}
LegoBase();