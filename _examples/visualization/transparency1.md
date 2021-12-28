---
layout: example
title: Visualization / Transparency 1 [OIT]
categories: examples visualization
permalink: /visualization-transparency1/
tclSource: /visualization/transparency1.tcl
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

<script>
document.getElementById ("occNoOitId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -oit off"); }
}
document.getElementById ("occWeightedOitId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -oit weight 0.0"); }
}
document.getElementById ("occDepthPeelOitId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -oit peeling 4"); }
}
</script>
