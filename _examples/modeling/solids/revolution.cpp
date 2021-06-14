
  // Make a toroidal face by a series of shape revolves.
  // Make a starting vertex at [-1.0, 0, 0].
  TopoDS_Shape aVertex = BRepBuilderAPI_MakeVertex(gp_Pnt(-1.0, 0.0, 0.0));

  // Make a circular edge by revolting aVertex around
  // an axis Y positioned at [-1.5, 0.0, 0.0] on 2*Pi angle
  gp_Ax1 anAxis1(gp_Pnt(-1.5, 0.0, 0.0), gp::DY());
  TopoDS_Shape anEdge = BRepPrimAPI_MakeRevol(aVertex, anAxis1);
  myResult << "Circular edge was created in yellow" << std::endl;

  // Make a toroidal face by revolting anEdge around
  // Z axis on 2*Pi angle.
  TopoDS_Shape aFace = BRepPrimAPI_MakeRevol(anEdge, gp::OZ());
  myResult << "Toroidal face was created in red" << std::endl;

  Handle(AIS_Axis) anAisAxis1 = new AIS_Axis(new Geom_Axis1Placement(anAxis1));
  Handle(AIS_Axis) anAisAxis2 = new AIS_Axis(new Geom_Axis1Placement(gp::OZ()));
  Handle(AIS_Shape) anAisVertex = new AIS_Shape(aVertex);
  Handle(AIS_ColoredShape) anAisEdge = new AIS_ColoredShape(anEdge);
  Handle(AIS_ColoredShape) anAisFace = new AIS_ColoredShape(aFace);
  anAisEdge->SetColor(Quantity_Color(Quantity_NOC_GREEN));
  anAisEdge->SetWidth(1.5);
  anAisAxis1->SetColor(Quantity_NOC_GREEN);
  anAisFace->SetColor(Quantity_Color(Quantity_NOC_RED));
  anAisAxis2->SetColor(Quantity_NOC_RED);
  myObject3d.Append(anAisVertex);
  myObject3d.Append(anAisEdge);
  myObject3d.Append(anAisFace);
