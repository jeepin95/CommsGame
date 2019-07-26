include <LegoBase.scad>
bladeX=4;
bladeY=30;
bladeZ=2.2;
$fn = 60;
module helo() {
    cube([bladeX, 40, bladeZ], true); // Blade

    translate([-8, 0, -bladeY/2]) rotate([0,90,0])  cylinder(h=16, r=(bladeY/2)); // Body

    translate([0, 20, -11+bladeZ]) cube([bladeX, 17, 3], true);


    VertPoints = [
      [  -2,  22,  -11 ],  //0
      [ 2,  22,  -11 ],  //1
      [ 2,  32,  -11 ],  //2
      [  -2,  32,  -11 ],  //3
      [  -2,  30,  -5 ],  //4
      [ 2,  30,  -5 ],  //5
      [ 2,  33,  -5 ],  //6
      [  -2,  33,  -5 ]]; //7
      
    BodyFaces = [
      [0,1,2,3],  // bottom
      [4,5,1,0],  // front
      [7,6,5,4],  // top
      [5,6,2,1],  // right
      [6,7,3,2],  // back
      [7,4,0,3]]; // left
      
    polyhedron(VertPoints, BodyFaces);
}
difference() {
    helo();
    translate([0,0,-(bladeY-5)]) cube([bladeY, bladeY*3, bladeY], true); // Remove bottom half
}
translate([0,0,-(bladeY/2)+5]) LegoBase();