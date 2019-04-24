LABEL = "SCHOOL";

hexHeight = 1;
hexRadius = 53;
nubRadius = 5.0/2;
nubSpacing = 4.0;
nubHeight = 1.95;
nubX = 30;
nubY = 35;
letterOffset = 15;
letterSize = 7;
fontSize = 10;
fontOffset = 32;

hexPiece(LABEL,fontSize);

echo(Label=LABEL);
echo(HexRadius=hexRadius);
echo(HexHeight=hexHeight);


module nubs()
{
    $fn = 360;
    translate([0,0,hexHeight+(nubHeight/2)]) {
        
        translate([-nubSpacing, -nubSpacing, 0]) {
            cylinder(h=nubHeight, r=nubRadius, center=true);
        }
        translate([nubSpacing, nubSpacing, 0]) {
            cylinder(h=nubHeight, r=nubRadius, center=true);
        }
        translate([nubSpacing, -nubSpacing, 0]) {
            cylinder(h=nubHeight, r=nubRadius, center=true);
        }
        translate([-nubSpacing,nubSpacing,0]) {
            cylinder(h=nubHeight, r=nubRadius, center=true);
        }
    }
    
}

module hexPiece(label, fontSize) {
    union() {
        // Draw the "D" for the DATA and place it below the left nubs
        rotate([0,0,-90]) {
            translate([-nubX,-letterOffset,hexHeight]) {    
                linear_extrude(height = nubHeight*.75) {
                    text("D", size=letterSize, font="Arial Black:Style=bold", halign="center", valign="center");
                }
            }
        }

        // Draw the "V" for Voice and place it below the right nubs
        rotate([0,0,-90]) {
            translate([nubX,-letterOffset,hexHeight]) {    
                linear_extrude(height = nubHeight*.75) {
                    text("V",size=letterSize, font="Arial Black:Style=bold", halign="center", valign="center");
                }
            }
        }

        // Draw the "F" for Fuel and place it below the top nubs
        rotate([0,0,-90]) {
            translate([0,(nubY-letterOffset),hexHeight]) {    
                linear_extrude(height = nubHeight*.75) {
                    text("F",size=letterSize, font="Arial Black:Style=bold", halign="center", valign="center");
                }
            }
        }

        // Draw the label for this piece
        rotate([0,0,-90]) {
            translate([0,-fontOffset,hexHeight]) {
                linear_extrude(height = nubHeight*0.75) {
                    text(label, size=fontSize, font="Arial Black:Style=bold", halign="center", valign="center");
                }
            }
        }

        rotate([0,0,90]) {
            cylinder(h=hexHeight, r=hexRadius, center=false, $fn = 6);
        }
        translate([35,0,0]) {
            nubs();
        }
        translate([0,30,0]) {
            nubs();
        }
        translate([0,-30,0]) {
            nubs();
        }
    }
}