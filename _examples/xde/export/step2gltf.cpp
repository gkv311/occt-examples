
// read / create / fill in the document
Handle(TDocStd_Document) theXdeDoc; // created in advance

STEPCAFControl_Reader aStepReader;
if (!aStepReader.ReadFile ("as1-oc-214.stp") != IFSelect_RetDone)
{ // parse error }
if (!aStepReader.Transfer (theXdeDoc))
{ // translation error }
...
// collect document roots into temporary compound
Handle(XCAFDoc_ShapeTool) aShapeTool = XCAFDoc_DocumentTool::ShapeTool (myXdeDoc->Main());

TDF_LabelSequence aRootLabels;
aShapeTool->GetFreeShapes (aRootLabels);

TopoDS_Compound aCompound;
BRep_Builder    aBuildTool;
aBuildTool.MakeCompound (aCompound);
for (TDF_LabelSequence::Iterator aRootIter (aRootLabels); aRootIter.More(); aRootIter.Next())
{
  const TDF_Label& aRootLabel = aRootIter.Value();
  TopoDS_Shape aRootShape;
  if (XCAFDoc_ShapeTool::GetShape (aRootLabel, aRootShape))
  {
    aBuildTool.Add (aCompound, aRootShape);
  }
}

// perform meshing
Handle(Prs3d_Drawer) aDrawer = new Prs3d_Drawer(); // holds visualization defaults
BRepMesh_IncrementalMesh anAlgo;
anAlgo.ChangeParameters().Deflection = Prs3d::GetDeflection (aCompound, aDrawer);
anAlgo.ChangeParameters().Angle      = 20.0 * M_PI / 180.0; // 20 degrees
anAlgo.ChangeParameters().InParallel = true;
anAlgo.SetShape (aCompound);
anAlgo.Perform();

...

// write or export the document
TColStd_IndexedDataMapOfStringString aMetadata;
RWGltf_CafWriter aGltfWriter ("exported.glb", true);
// STEP reader translates into mm units by default
aGltfWriter.ChangeCoordinateSystemConverter().SetInputLengthUnit (0.001);
aGltfWriter.ChangeCoordinateSystemConverter().SetInputCoordinateSystem (RWMesh_CoordinateSystem_Zup);
if (!aGltfWriter.Perform (theXdeDoc, aMetadata, Handle(Message_ProgressIndicator)()))
{
  // export error
}
