
  // Make a box with a corner at [0, 0, 0] and the specified sizes.
  Standard_Real aSizeX = 8.0;
  Standard_Real aSizeY = 10.0;
  Standard_Real aSizeZ = 15.0;
  TopoDS_Shape aBox = BRepPrimAPI_MakeBox(aSizeX, aSizeY, aSizeZ);
  myResult << "Box at corner [0, 0, 0] and sizes ["
           << aSizeX << ", " << aSizeY << ", " << aSizeZ
           << "] was created in yellow wirewrame" << std::endl;

  // Initialize chamfer algo.
  BRepFilletAPI_MakeChamfer anAlgo(aBox);

  // Set edge to apply a chamfer with specified distance from it.
  // Select the 5th edge in the map returned by TopExp::MapShapes method.
  TopTools_IndexedMapOfShape anEdges;
  TopExp::MapShapes(aBox, TopAbs_EDGE, anEdges);
  TopoDS_Edge anEdge = TopoDS::Edge(anEdges.FindKey(5));
  Standard_Real aDist = 4.0;
  anAlgo.Add(aDist, anEdge);
  myResult << "Make a chamfer of " << aDist << " size on an edge in green" << std::endl;

  Handle(AIS_ColoredShape) anAisBox = new AIS_ColoredShape(aBox);
  Handle(AIS_ColoredShape) anAisEdge = new AIS_ColoredShape(anEdge);
  anAisBox->SetColor(Quantity_Color(Quantity_NOC_YELLOW));
  anAisEdge->SetColor(Quantity_Color(Quantity_NOC_GREEN));
  anAisEdge->SetWidth(2.5);
  myObject3d.Append(anAisBox);
  myObject3d.Append(anAisEdge);
  myContext->SetDisplayMode(anAisBox, 0, Standard_True);

  // Make a chamfer.
  anAlgo.Build();
  if (anAlgo.IsDone())
  {
    // Get result.
    TopoDS_Shape aResult = anAlgo.Shape();
    myResult << "Fillet was built. Result shape is in red shading" << std::endl;

    Handle(AIS_ColoredShape) anAisResult = new AIS_ColoredShape(aResult);
    anAisResult->SetColor(Quantity_Color(Quantity_NOC_RED));
    myObject3d.Append(anAisResult);
    myContext->SetDisplayMode(anAisResult, 1, Standard_True);

    const TopTools_ListOfShape& aGenShapes = anAlgo.Generated(anEdge);
    for (TopTools_ListOfShape::Iterator anIt(aGenShapes); anIt.More(); anIt.Next())
    {
      Handle(AIS_ColoredShape) anAisShape = new AIS_ColoredShape(anIt.Value());
      anAisShape->SetColor(Quantity_Color(Quantity_NOC_RED));
      anAisShape->SetWidth(2.5);
      myObject3d.Append(anAisShape);
    }
  }
