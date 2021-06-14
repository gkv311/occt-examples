---
layout: example
title: Visualization / Hidden-line removal
categories: examples visualization
permalink: /visualization-hlr
tclSource: /visualization/hlr.tcl
---

Sample demonstrating simple hidden-line removal (HLR) rendering.

**Activate presentation**:

<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occWireframeId"> Wireframe
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occShadedId"> Shaded
  </label>
  <br><br>
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="occHlrFakeId" checked> Visualization HLR
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occHlrPolyAlgoId"> Polygonal HLR
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occHlrExactAlgoId"> Exact B-Rep HLR
  </label>
</div>
<br>

<script>
document.getElementById ("occWireframeId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vhlr off; vsetdispmode b 0;"); }
}
document.getElementById ("occShadedId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vhlr off; vsetdispmode b 1; vaspects -silhouette 0 -interiorStyle SOLID;"); }
}
document.getElementById ("occHlrFakeId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vhlr off; vsetdispmode b 1; vaspects -silhouette 1 -interiorStyle HIDDENLINE;"); }
}
document.getElementById ("occHlrPolyAlgoId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vhlr on -algo polyAlgo; vsetdispmode b 0;"); }
}
document.getElementById ("occHlrExactAlgoId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vhlr on -algo algo; vsetdispmode b 0;"); }
}
</script> 
