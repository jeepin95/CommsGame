SET oscad="c:\Program Files\OpenSCAD\openscad.exe" 
SET version=v01

mkdir %version%

%oscad% -o %version%\SATCOLT_%version%.stl scad\SATCOLT.scad
%oscad% -o %version%\VSAT_%version%.stl scad\VSAT.scad
%oscad% -o %version%\RV_%version%.stl scad\RV.scad
%oscad% -D "topLabel=\"M\"" -o %version%\Tower_Microwave_%version%.stl scad\Tower.scad
%oscad% -D "topLabel=\"L\"" -o %version%\Tower_LMR_%version%.stl scad\Tower.scad
%oscad% -o %version%\SatPhone_%version%.stl scad\SatPhone.scad
%oscad% -o %version%\Truck_%version%.stl scad\Truck.scad
%oscad% -o %version%\RadioCache_%version%.stl scad\RadioCache.scad
%oscad% -o %version%\BGAN_%version%.stl scad\BGAN.scad
%oscad% -o %version%\COW_%version%.stl scad\COW.scad




SET oscad = ..

%oscad% -D "LABEL=\"AIR\"" -o %version%\HexPiece_%version%_AIR.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"CELL\"" -o %version%\HexPiece_%version%_CELL.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"LMR\"" -o %version%\HexPiece_%version%_LMR.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"FIRE\"" -o %version%\HexPiece_%version%_FIRE.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"SCHOOL\"" -D "fontSize=9" -o %version%\HexPiece_%version%_SCHOOL.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"POLICE\"" -o %version%\HexPiece_%version%_POLICE.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"EOC\"" -o %version%\HexPiece_%version%_EOC.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"HOSPITAL\"" -D "fontSize=8" -o %version%\HexPiece_%version%_HOSPITAL.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"PSAP\"" -o %version%\HexPiece_%version%_PSAP.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"CO\"" -o %version%\HexPiece_%version%_CO.stl scad\HexPieces.scad
%oscad% -D "LABEL=\"MSC\"" -o %version%\HexPiece_%version%_MSC.stl scad\HexPieces.scad
