
  // Make a box #1 with a corner at [0, 0, 0] and the specified sizes.
  Standard_Real aSizeX = 10.0;
  Standard_Real aSizeY = 15.0;
  Standard_Real aSizeZ = 20.0;
  TopoDS_Shape aShape = BRepPrimAPI_MakeBox(aSizeX, aSizeY, aSizeZ);
  myResult << "Box at corner [0, 0, 0] and sizes ["
           << aSizeX << ", " << aSizeY << ", " << aSizeZ
           << "] was created in yellow wireframe" << std::endl;

  // Create a boolean algo.
  // Make a section by a plane.
  gp_Pln aPln(gp_Pnt(aSizeX / 2.0, aSizeY / 2.0, aSizeZ / 2.0), gp::DZ());
  BRepAlgoAPI_Section anAlgo(aShape, aPln, Standard_False);

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
    myResult << "Result shape was created in red" << std::endl;
    Handle(AIS_ColoredShape) anAisShape = new AIS_ColoredShape(aShape);
    Handle(AIS_Plane) anAisPlane = new AIS_Plane(new Geom_Plane(aPln));
    anAisShape->SetColor(Quantity_Color(Quantity_NOC_YELLOW));
    Handle(AIS_ColoredShape) anAisResult = new AIS_ColoredShape(aResultShape);
    anAisResult->SetColor(Quantity_Color(Quantity_NOC_RED));
    myObject3d.Append(anAisShape);
    myObject3d.Append(anAisPlane);
    myObject3d.Append(anAisResult);
    myContext->SetDisplayMode(anAisShape, 0, Standard_True);
  }
