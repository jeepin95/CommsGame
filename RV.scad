HoodPoints = [
  [  1,  0,  0 ],  //0
  [ 9,  0,  0 ],  //1
  [ 10,  5,  0 ],  //2
  [  0,  5,  0 ],  //3
  [  1,  0,  3 ],  //4
  [ 9,  0,  3 ],  //5
  [ 10,  5,  5 ],  //6
  [  0,  5,  5 ]]; //7
  
HoodFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
polyhedron( HoodPoints, HoodFaces );

CabPoints = [
  [  0,  5,  0 ],  //0
  [ 10,  5,  0 ],  //1
  [ 10,  8,  0 ],  //2
  [  0,  8,  0 ],  //3
  [  0,  5,  5 ],  //4
  [ 10,  5,  5 ],  //5
  [ 10,  8,  10 ],  //6
  [  0,  8,  10 ]]; //7
  
CabFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
polyhedron(CabPoints, CabFaces);

CoverPoints = [
  [  0,  8,  10 ],  //0
  [ 10,  8,  10 ],  //1
  [ 11,  13,  10 ],  //2
  [  -1,  13,  10 ],  //3
  [  0,  8,  10.5 ],  //4
  [ 10,  8,  10.5 ],  //5
  [ 11,  13,  12 ],  //6
  [  -1,  13,  12 ]]; //7
  
CoverFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
polyhedron(CoverPoints, CoverFaces);

$fn = 60;
translate([-2, 30, 0]) rotate([0,90,0]) cylinder(r=2, h=2);
translate([10, 30, 0]) rotate([0,90,0]) cylinder(r=2, h=2);

translate([0, 4, 0]) rotate([0,90,0]) cylinder(r=2, h=2);
translate([8, 4, 0]) rotate([0,90,0]) cylinder(r=2, h=2);

translate([0,8,0]) cube([10,5,10]);

translate([0,5,0]) {
    translate([-1,8,0]) cube([12,24,12]);
    translate([(12/2)-(4/2),12,12]) cube([3,3,1]);
    translate([(12/2)-(4/2),20,12]) cube([4,5,1.5]);
}
