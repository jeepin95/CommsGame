include <LegoBase.scad>
wingX = 30;
wingY = 7;
wingZ = 2;

translate([0,5,5.5]) cube([wingX, wingY, wingZ], true);

$fn=40;
rotate([0,90,0]) cylinder(r=5, h=6, center=true);

BodyPoints = [
  [  -3,  6,  -5 ],  //0
  [ 3,  6,  -5 ],  //1
  [ 1,  30,  -5 ],  //2
  [  -1,  30,  -5 ],  //3
  [  -3,  6,  5 ],  //4
  [ 3,  6,  5 ],  //5
  [ 1,  30,  0 ],  //6
  [  -1,  30,  0 ]]; //7
  
BodyFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
  
translate([-3, 0, -5]) cube([6, 6, 10]);
polyhedron(BodyPoints, BodyFaces);
polyhedron(VertPoints, BodyFaces);
polyhedron(HorizPoints, BodyFaces);
translate([-8, 33, -5]) cube([16,3,2]);
translate([-1,30,-5]) cube([2,6,4]);

HorizPoints = [
  [  -1,  28,  -5 ],  //0
  [ 1,  28,  -5 ],  //1
  [ 8,  33,  -5 ],  //2
  [  -8,  33,  -5 ],  //3
  [  -1,  28,  -3 ],  //4
  [ 1,  28,  -3 ],  //5
  [ 8,  33,  -3],  //6
  [  -8,  33,  -3 ]]; //7
  
VertPoints = [
  [  -1,  28,  -1 ],  //0
  [ 1,  28,  -1 ],  //1
  [ 1,  36,  -1 ],  //2
  [  -1,  36,  -1 ],  //3
  [  -1,  33,  6 ],  //4
  [ 1,  33,  6 ],  //5
  [ 1,  36,  6 ],  //6
  [  -1,  36,  6 ]]; //7

  translate([0,10,-3.9]) LegoBase();