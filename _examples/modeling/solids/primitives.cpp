#include <BRepPrimAPI_MakeBox.hxx>
#include <BRepPrimAPI_MakeCylinder.hxx>
#include <BRepPrimAPI_MakeCone.hxx>
#include <BRepPrimAPI_MakeSphere.hxx>

...

// Create a box with specified origin (lower-left corner) and dimensions.
gp_Pnt aBoxOrigin(0,   100, 0);
gp_XYZ aBoxDims  (100, 200, 300);
TopoDS_Solid aBox = BRepPrimAPI_MakeBox (aBoxOrigin, aBoxDims.X(), aBoxDims.Y(), aBoxDims.Z());

// Create a cylinder of the specified radius and length.
Standard_Real aRadius1 = 50.0;
Standard_Real aLength1 = 150.0;
TopoDS_Shape aCyl1 = BRepPrimAPI_MakeCylinder (aRadius1, aLength1);

// Create a cylinder of the specified radius, length and sector angle.
Standard_Real aRadius2 = 80.0;
Standard_Real aLength2 = 250.0;
Standard_Real anAngle = M_PI_2;
TopoDS_Shape aCyl2 = BRepPrimAPI_MakeCylinder (aRadius2, aLength2, anAngle);
