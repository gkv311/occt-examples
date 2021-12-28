---
layout: example
title: Visualization / Stereoscopy
categories: examples visualization
permalink: /visualization-stereo/
tclSource: /visualization/stereo.tcl
---

Sample shows stereoscopic display support managed by Graphic3d_RenderingParameters::StereoMode parameter or V3d_View::ChangeRenderingParameters() property.

**Activate mode**:

<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occMonoId"> Monoscopic
  </label>
  <br>
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="occRedCyanId" checked> Red-Cyan Anaglyph
  </label>
  <br>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occRowInterlacedId" checked> Row-Interlaced
  </label>
  <br>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occRowInterlacedRevId" checked> Row-Interlaced (Reversed)
  </label>
</div>
<br>

<script>
document.getElementById ("occMonoId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vstereo off"); }
}
document.getElementById ("occRedCyanId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vstereo -anaglyph redCyan"); }
}
document.getElementById ("occRowInterlacedId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vstereo -mode rowInterlaced -reverse 0"); }
}
document.getElementById ("occRowInterlacedRevId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vstereo -mode rowInterlaced -reverse 1"); }
}
</script>
