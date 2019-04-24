SET oscad="c:\Program Files\OpenSCAD\openscad.exe" 
SET version=v01

mkdir %version%

%oscad% -o %version%\SATCOLT_%version%.stl SATCOLT.scad
%oscad% -o %version%\RV_%version%.stl RV.scad
%oscad% -D "topLabel=\"M\"" -o %version%\Tower_Microwave_%version%.stl Tower.scad
%oscad% -D "topLabel=\"L\"" -o %version%\Tower_LMR_%version%.stl Tower.scad
%oscad% -o %version%\SatPhone_%version%.stl SatPhone.scad
%oscad% -o %version%\Truck_%version%.stl Truck.scad
%oscad% -o %version%\RadioCache_%version%.stl RadioCache.scad
%oscad% -o %version%\BGAN_%version%.stl BGAN.scad
%oscad% -o %version%\COW_%version%.stl COW.scad




SET oscad = ..

%oscad% -D "LABEL=\"AIR\"" -o %version%\HexPiece_%version%_AIR.stl HexPieces.scad
%oscad% -D "LABEL=\"CELL\"" -o %version%\HexPiece_%version%_CELL.stl HexPieces.scad
%oscad% -D "LABEL=\"LMR\"" -o %version%\HexPiece_%version%_LMR.stl HexPieces.scad
%oscad% -D "LABEL=\"FIRE\"" -o %version%\HexPiece_%version%_FIRE.stl HexPieces.scad
%oscad% -D "LABEL=\"SCHOOL\"" -D "fontSize=9" -o %version%\HexPiece_%version%_SCHOOL.stl HexPieces.scad
%oscad% -D "LABEL=\"POLICE\"" -o %version%\HexPiece_%version%_POLICE.stl HexPieces.scad
%oscad% -D "LABEL=\"EOC\"" -o %version%\HexPiece_%version%_EOC.stl HexPieces.scad
%oscad% -D "LABEL=\"HOSPITAL\"" -D "fontSize=8" -o %version%\HexPiece_%version%_HOSPITAL.stl HexPieces.scad
%oscad% -D "LABEL=\"PSAP\"" -o %version%\HexPiece_%version%_PSAP.stl HexPieces.scad
%oscad% -D "LABEL=\"CO\"" -o %version%\HexPiece_%version%_CO.stl HexPieces.scad
%oscad% -D "LABEL=\"MSC\"" -o %version%\HexPiece_%version%_MSC.stl HexPieces.scad
