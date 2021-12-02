---
layout: example
title: Visualization / Layer origin
categories: examples visualization
permalink: /visualization-layer-origin
tclSource: /visualization/layer_origin.tcl
---

Script demonstrates usage of `Graphic3d_ZLayerSettings::Origin()` property to display presentations at large distance from world origin.

<div style="margin-left: 35px">
  <label>Distance (10^x)
  <input type="range" min="1" max="10" value="7" class="slider" id="occDistRangeId" style="width: 200px">
  </label>
</div>
<script>
document.getElementById ("occDistRangeId").oninput = function()
{
  DRAWEXE.terminalPasteScript (
    "set aDist [expr pow(10, " + this.value + ")]\n"
  + "vzlayer $aLayer -origin $aDist 0 0 -noupdate\n"
  + "vlocation t3 -location $aDist 0 0 -noupdate\n"
  + "vlocation t2 -location $aDist 0 0 -noupdate\n"
  + "vlocation b  -location $aDist 0 0 -noupdate\n"
  + "vdrawtext t4 \"$aDist\" -pos [expr $aDist + 100] 0 -70 -height 30 -plane {*}$aPlane -halign center -color GREEN -noupdate\n"
  + "\n"
  + "reset t1\n"
  + "ttranslate t1 $aDist 0 50\n"
  + "vdisplay -dispMode 1 t1 -noupdate\n"
  + "vfit\n"
  );
}
</script>

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
