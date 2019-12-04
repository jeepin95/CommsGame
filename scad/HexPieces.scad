LABEL = "SCHOOL";

hexHeight = 1;
hexRadius = 53;
nubRadius = 5.0/2;
nubSpacing = 4.0;
nubHeight = 1.95;
nubX = 30;
nubY = 18;
nubYBase = 3;
letterOffset = 15;
letterSize = 7;
fontSize = 10;
fontOffset = 32;

hexPiece(LABEL,fontSize);

echo(Label=LABEL);
echo(HexRadius=hexRadius);
echo(HexHeight=hexHeight);


module nubs(letter, letterOffset)
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

    rotate([0,0,-90]) {
    translate(letterOffset) {
    linear_extrude(height = nubHeight*.75) {
                    text(letter, size=letterSize, font="Arial Black:Style=bold", halign="center", valign="center");
                }

    }

    }
}

module hexPiece(label, fontSize) {
    union() {
        // // Draw the "R" for the DATA and place it below the left nubs
        // rotate([0,0,-90]) {
        //     translate([-nubX,(-nubYBase-letterOffset),hexHeight]) {    
        //         linear_extrude(height = nubHeight*.75) {
        //             text("R", size=letterSize, font="Arial Black:Style=bold", halign="center", valign="center");
        //         }
        //     }
        // }

        // // Draw the "V" for Voice and place it below the right nubs
        // rotate([0,0,-90]) {
        //     translate([nubX,(nubYBase-letterOffset),hexHeight]) {    
        //         linear_extrude(height = nubHeight*.75) {
        //             text("B",size=letterSize, font="Arial Black:Style=bold", halign="center", valign="center");
        //         }
        //     }
        // }

        // // Draw the "F" for Fuel and place it below the top nubs
        // rotate([0,0,-90]) {
        //     translate([0,(-nubYBase-letterOffset),hexHeight]) {    
        //         linear_extrude(height = nubHeight*.75) {
        //             text("M",size=letterSize, font="Arial Black:Style=bold", halign="center", valign="center");
        //         }
        //     }
        // }

        // // Draw the "C" for the DATA and place it below the left nubs
        // rotate([0,0,-90]) {
        //     translate([-nubX*.8,(nubY-letterOffset),hexHeight]) {    
        //         linear_extrude(height = nubHeight*.75) {
        //             text("C", size=letterSize, font="Arial Black:Style=bold", halign="center", valign="center");
        //         }
        //     }
        // }

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
        translate([-nubYBase,nubX,0]) {
            nubs("R", [0,-letterOffset, hexHeight]);
        }
        translate([nubY,nubX,0]) {
            nubs("C", [letterOffset,0, hexHeight]);
        }
        translate([nubY-nubSpacing*2,0,0]) {
            nubs("M", [0,-letterOffset, hexHeight]);
        }
        translate([nubY,-nubX,0]) {
            nubs("P", [-letterOffset, 0, hexHeight]);
        }
        translate([-nubYBase,-nubX,0]) {
            nubs("B", [0,-letterOffset, hexHeight]);
        }


        translate([hexRadius*.75,-nubX*.5,hexHeight]) {
                    rotate([0,10,0]) cube([4,nubX,nubHeight*2]);
        }
        translate([(hexRadius*.75) - 2.8,-nubX*.5,hexHeight]) {
            cube([2,nubX,nubHeight]);
        }
    }
}