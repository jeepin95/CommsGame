HoodPoints = [
  [  1,  0,  0 ],  //0
  [ 13,  0,  0 ],  //1
  [ 14,  5,  0 ],  //2
  [  0,  5,  0 ],  //3
  [  1,  0,  4 ],  //4
  [ 13,  0,  4 ],  //5
  [ 14,  5,  5 ],  //6
  [  0,  5,  5 ]]; //7
  
HoodFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
CabPoints = [
  [  0,  5,  0 ],  //0
  [ 14,  5,  0 ],  //1
  [ 14,  7,  0 ],  //2
  [  0,  7,  0 ],  //3
  [  0,  5,  5 ],  //4
  [ 14,  5,  5 ],  //5
  [ 14,  7,  8 ],  //6
  [  0,  7,  8 ]]; //7
  
CabFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
  
CabSidePoints = [
  [ -1,  5,  5 ],  //0
  [ .2,  5,  5 ],  //1
  [ .2,  12,  5 ],  //2
  [  -1,  12,  5 ],  //3
  [  -1,  5,  12 ],  //4
  [ 2,  5,  12 ],  //5
  [ 2,  12,  12 ],  //6
  [ -1,  12,  12 ]]; //7
  
CabLeftSidePoints = [
  [ 15,  5,  5 ],  //0
  [ 13.8,  5,  5 ],  //1
  [ 13.8,  12,  5 ],  //2
  [  15,  12,  5 ],  //3
  [  15,  5,  12 ],  //4
  [ 11,  5,  12 ],  //5
  [ 11,  12,  12 ],  //6
  [ 15,  12,  12 ]]; //7
  
CabSideFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left

scale([1.5,1.5,2]) {
    union() {
        difference() {
            truckCab();
            polyhedron(CabSidePoints, CabSideFaces);
            polyhedron(CabLeftSidePoints, CabSideFaces);
        }

        difference() {
            translate([0, 12, 0]) cube([14,10,5]);
            translate([1.5, 12, 1.5]) cube([11,8.5,5]);
        }

        $fn = 60;
        difference() {
            wheels();
            translate([-4,0,-10]) cube([20,20,10]);
        }
    }
}
module truckCab() {
    polyhedron( HoodPoints, HoodFaces );
    polyhedron(CabPoints, CabFaces);
    translate([0, 7, 0]) cube([14,5,8]);
}

module wheels() {
    translate([-1.5, 17, 0]) rotate([0,90,0]) cylinder(r=2, h=3);
    translate([12.5, 17, 0]) rotate([0,90,0]) cylinder(r=2, h=3);

    translate([-1, 4, 0]) rotate([0,90,0]) cylinder(r=2, h=3);
    translate([12, 4, 0]) rotate([0,90,0]) cylinder(r=2, h=3);
}

include <LegoBase.scad>
translate([10,17,0]) LegoBase();