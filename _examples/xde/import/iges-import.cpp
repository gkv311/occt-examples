
// read / create / fill in the document
Handle(TDocStd_Document) theXdeDoc; // created in advance

IGESCAFControl_Reader anIgesReader;
if (!anIgesReader.ReadFile ("hammer.iges") != IFSelect_RetDone)
{ // parse error }
if (!anIgesReader.Transfer (theXdeDoc))
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
