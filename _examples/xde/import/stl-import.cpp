
// read STL model
Handle(Poly_Triangulation) aPolyTri = RWStl::ReadFile ("skull_w_jaw.stl")
if (aPolyTri.IsNull())
{
  // reading error
}

// make a single TopoDS_Face from imported triangulation
TopoDS_Face aFace;
BRep_Builder().MakeFace (aFace, aPolyTri);

// do something with the shape - like display in the viewer
Handle(AIS_Shape) aShapePrs = new AIS_Shape (aFace);






