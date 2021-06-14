
  // Make a box #1 with a corner at [0, 0, 0] and the specified sizes.
  Standard_Real aSizeX = 10.0;
  Standard_Real aSizeY = 15.0;
  Standard_Real aSizeZ = 20.0;
  TopoDS_Shape aShape1 = BRepPrimAPI_MakeBox(aSizeX, aSizeY, aSizeZ);
  myResult << "Box at corner [0, 0, 0] and sizes ["
           << aSizeX << ", " << aSizeY << ", " << aSizeZ
           << "] was created in yellow wireframe" << std::endl;

  // Make a box #2 by two points.
  gp_Pnt aPnt1(5.0, 7.5, 10.0);
  gp_Pnt aPnt2(20.0, 25.0, 30.0);
  TopoDS_Shape aShape2 = BRepPrimAPI_MakeBox(aPnt1, aPnt2);
  myResult << "Box with corners ["
           << aPnt1.X() << ", " << aPnt1.Y() << ", " << aPnt1.Z()
           << "] and ["
           << aPnt2.X() << ", " << aPnt2.Y() << ", " << aPnt2.Z()
           << "] was created in green wirefreme" << std::endl;

  // Create a boolean algo.
  BRepAlgoAPI_Common anAlgo(aShape1, aShape2);
  //BRepAlgoAPI_Cut anAlgo(aShape1, aShape2);
  //BRepAlgoAPI_Fuse anAlgo(aShape1, aShape2);

  // Make operation.
  anAlgo.Build();

  if (!anAlgo.IsDone()) // Process errors
  {
    myResult << "Errors : " << std::endl;
    anAlgo.DumpErrors(myResult);
  }
  if (anAlgo.HasWarnings()) // Process warnings
  {
    myResult << "Warnings : " << std::endl;
    anAlgo.DumpErrors(myResult);
  }

  if (anAlgo.IsDone())
  {
    // Get result.
    TopoDS_Shape aResultShape = anAlgo.Shape();
    myResult << "Result shape was created in red shading" << std::endl;

    Handle(AIS_ColoredShape) anAisShape1 = new AIS_ColoredShape(aShape1);
    Handle(AIS_ColoredShape) anAisShape2 = new AIS_ColoredShape(aShape2);
    anAisShape1->SetColor(Quantity_Color(Quantity_NOC_YELLOW));
    anAisShape2->SetColor(Quantity_Color(Quantity_NOC_GREEN));
    Handle(AIS_ColoredShape) anAisResult = new AIS_ColoredShape(aResultShape);
    anAisResult->SetColor(Quantity_Color(Quantity_NOC_RED));
    myObject3d.Append(anAisShape1);
    myObject3d.Append(anAisShape2);
    myObject3d.Append(anAisResult);
    myContext->SetDisplayMode(anAisShape1, 0, Standard_True);
    myContext->SetDisplayMode(anAisShape2, 0, Standard_True);
    myContext->SetDisplayMode(anAisResult, 1, Standard_True);
  }
