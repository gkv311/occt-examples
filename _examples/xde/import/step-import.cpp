
// read / create / fill in the document
Handle(TDocStd_Document) theXdeDoc; // created in advance

STEPCAFControl_Reader aStepReader;
if (!aStepReader.ReadFile ("as1-oc-214.stp") != IFSelect_RetDone)
{ // parse error }
if (!aStepReader.Transfer (theXdeDoc))
{ // translation error }
...

// iterate over document leaves
for (XCAFPrs_DocumentExplorer aLeafIter (theXdeDoc, XCAFPrs_DocumentExplorerFlags_OnlyLeafNodes);
     aLeafIter.More(); aLeafIter.Next())
{
  const XCAFPrs_DocumentNode& aDocNode = aLeafIter.Current();
  TopoDS_Shape aShape = XCAFDoc_ShapeTool::GetShape (aDocNode.RefLabel);
  if (!aShape.IsNull())
  {
    // process shape
    aShape.Location (aDocNode.Location);
  }

  Handle(TDataStd_Name) anInstanceName, aProductName;
  aDocNode.Label   .FindAttribute (TDataStd_Name::GetID(), anInstanceName);
  aDocNode.RefLabel.FindAttribute (TDataStd_Name::GetID(), aProductName);
  if (!anInstanceName.IsNull())
  {
    // read node name
    TCollection_AsciiString aName (anInstanceName->Get());
  }
}
