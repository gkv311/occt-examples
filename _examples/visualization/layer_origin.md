---
layout: example
title: Visualization / Layer origin
categories: examples visualization
permalink: /visualization-layer-origin
tclSource: /visualization/layer_origin.tcl
---

Script demonstrates usage of `Graphic3d_ZLayerSettings::Origin()` property to display presentations at large distance from world origin.
- First label "KO Premultiplied" is displayed with premultiplied large transformation.
  `TopLoc_Location` with large distance is set to `TopoDS_Shape` and displayed as `AIS_Shape` having identity local transformation.
  This leads to severe visual artifacts due to insufficient single floating point precision of vertex data uploaded onto GPU and calculations in GLSL program.
- Second label "KO Located" is displayed with transformation assigned to presentation.
  `TopoDS_Shape` has identity or small location and displayed as `AIS_Shape`.
  `AIS_Shape::LocalTransformation()` is set to large displacement.
  This allows to avoid vertex corruption as could be seen in first sample, but presentation jitters during camera rotation due to insufficient single floating point precision of transformation matrix uploaded onto GPU.
- Third label "OK ZLayer origin" displays located presentation close to Z-Layer origin.
  As in case of second label, `TopoDS_Shape` has identity or small location and displayed as `AIS_Shape`; `AIS_Shape::LocalTransformation()` is set to large displacement.
  In addition, `Graphic3d_ZLayerSettings::Origin()` of Z-Layer used for displaying the object is moved close to presentation.
  This activates a special workflow temporarily moving camera to Z-Layer origin, so that single floating point precision becomes enough to display presentation without artifacts.

This approach could be used to display objects within large distances, or to preserve desired precision while aggressively zooming-in.
