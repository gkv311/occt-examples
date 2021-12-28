---
layout: example
title: Visualization / Transparency 2 [OIT]
categories: examples visualization
permalink: /visualization-transparency2/
tclSource: /visualization/transparency2.tcl
---

Script displays order-independent transparency (OIT) managed by Graphic3d_RenderingParameters::TransparencyMethod parameter or V3d_View::ChangeRenderingParameters() property.

**Activate mode**:

<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occNoOitId"> Unordered
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occWeightedOitId"> Weighted OIT
  </label>
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="occDepthPeelOitId" checked> Depth Peeling OIT
  </label>
</div>
<br>
<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label>Nb. Peels
    <input type="range" min="2" max="10" value="2" class="slider" id="occPeelsRangeId" style="width: 200px">
    <output id="occPeelsRangeValId">2</output>
  </label>
  <br>
  <label>Boxes transparency
    <input type="range" min="0" max="100" value="50" class="slider" id="occBoxRangeId" style="width: 200px">
    <output id="occBoxRangeValId">50%</output>
  </label>
  <br>
  <label>Spheres transparency
    <input type="range" min="0" max="100" value="50" class="slider" id="occSphereRangeId" style="width: 200px">
    <output id="occSphereRangeValId">50%</output>
  </label>
  <br>
  <label>Toruses transparency
    <input type="range" min="0" max="100" value="50" class="slider" id="occTorusRangeId" style="width: 200px">
    <output id="occTorusRangeValId">50%</output>
  </label>
  <br>
  <label>Skulls transparency
    <input type="range" min="0" max="100" value="50" class="slider" id="occSkullRangeId" style="width: 200px">
    <output id="occSkullRangeValId">50%</output>
  </label>
</div>
<br>
<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary" id="occStopLabId">
    <input type="radio" name="animation" id="occStopId"> Stop animation
  </label>
  <label class="btn btn-primary" id="occPlayLabId">
    <input type="radio" name="animation" id="occPlayId"> Start animation
  </label>
</div>
<br>

<script>
document.getElementById ("occNoOitId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -oit off"); }
  document.getElementById ("occPeelsRangeId").disabled = true;
}
document.getElementById ("occWeightedOitId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -oit weight 0.0"); }
  document.getElementById ("occPeelsRangeId").disabled = true;
}
document.getElementById ("occDepthPeelOitId").onchange = function()
{
  if (this.checked)
  {
    DRAWEXE.terminalPasteScript ("vrenderparams -oit peeling $aNbPeels");
    document.getElementById ("occPeelsRangeId").disabled = false;
  }
}
document.getElementById ("occPeelsRangeId").oninput = function()
{
  DRAWEXE.terminalPasteScript ("set aNbPeels " + this.value + "; vrenderparams -oit peeling $aNbPeels");
  document.getElementById ("occPeelsRangeValId").value = this.value;
}

document.getElementById ("occBoxRangeId").oninput = function()
{
  DRAWEXE.terminalPasteScript ("set aBoxTransp " + this.value/100.0 + "; vaspects b1 b2 b3 -transparency $aBoxTransp");
  document.getElementById ("occBoxRangeValId").value = this.value + "%";
}
document.getElementById ("occSphereRangeId").oninput = function()
{
  DRAWEXE.terminalPasteScript ("set aSphTransp " + this.value/100.0 + "; vaspects {*}$aSpheres -color BLUE -transparency $aSphTransp");
  document.getElementById ("occSphereRangeValId").value = this.value + "%";
}
document.getElementById ("occTorusRangeId").oninput = function()
{
  DRAWEXE.terminalPasteScript ("set aTorTransp " + this.value/100.0 + "; vaspects t1 t2 t3 -color GREEN -transparency $aTorTransp");
  document.getElementById ("occTorusRangeValId").value = this.value + "%";
}
document.getElementById ("occSkullRangeId").oninput = function()
{
  DRAWEXE.terminalPasteScript ("set aSkullTransp " + this.value/100.0 + "; vaspects s1 s2 -transparency $aSkullTransp");
  document.getElementById ("occSkullRangeValId").value = this.value + "%";
}

document.getElementById ("occStopLabId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("vanimation a -pause");
}
document.getElementById ("occPlayLabId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("vanimation a -resume");
}
</script>
