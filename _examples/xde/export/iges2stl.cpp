
// read IGES file into single TopoDS_Shape
IGESControl_Reader anIgesReader;
if (!anIgesReader.ReadFile ("hammer.iges") != IFSelect_RetDone)
{ // parse error }
if (anIgesReader.TransferRoots() <= 0)
{ // translation error }
TopoDS_Shape aShape = anIgesReader.OneShape();

...
// IGES format doesn't support solids,
// and sewing algorithm might help to heal shape topology.
//
// Sewing tolerance is usually a user input parameter,
// adjusted iteratively (from small to larger values)
// until desired result is achieved (necessary faces are sewed).
double aSewTolerance = 1.0e-06;
BRepBuilderAPI_Sewing aSewing (aSewTolerance);
aSewing.Load (aShape);
aSewing.Perform();
if (!aSewing.SewedShape().IsNull())
{
  aShape = aSewing.SewedShape();
}

...

// perform meshing
Handle(Prs3d_Drawer) aDrawer = new Prs3d_Drawer(); // holds visualization defaults
BRepMesh_IncrementalMesh anAlgo;
anAlgo.ChangeParameters().Deflection = Prs3d::GetDeflection (aShape, aDrawer);
anAlgo.ChangeParameters().Angle      = 20.0 * M_PI / 180.0; // 20 degrees
anAlgo.ChangeParameters().InParallel = true;
anAlgo.SetShape (aShape);
anAlgo.Perform();

...

// export shape into STL file
StlAPI_Writer anStlWriter;
anStlWriter.ASCIIMode() = false;
if (!anStlWriter.Write (aShape, "exported.stl"))
{
  // export error
}
