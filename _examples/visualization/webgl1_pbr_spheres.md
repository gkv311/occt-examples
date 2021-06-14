---
layout: example
title: Visualization / WebGL1 PBR Spheres
categories: examples visualization
permalink: /visualization-webgl1-pbr-spheres
tclSource: /visualization/webgl1_pbr_spheres.tcl
---

Sample testing PBR metallic-roughness compatibility with obsolete WebGL 1.0 context (with extensions).

**Background cubemap image**:

<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="occBlackId" checked> None
  </label>
  <br>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occWhiteRoomId"> White room
  </label>
  <br>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occKiaraId"> Kiara
  </label>
  <br>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occLabelsId"> Labeled
  </label>
</div>
<br>

<script>
document.getElementById ("occBlackId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vbackground -color BLACK"); }
}
document.getElementById ("occWhiteRoomId").onchange = function()
{
  if (this.checked)
  {
    DRAWEXE.terminalPasteScript ("jsupload {{site.baseurl}}/images/white_room_2k_cube.png\n");
    DRAWEXE.terminalPasteScript ("vbackground -cubemap white_room_2k_cube.png -invertedz\n");
  }
}
document.getElementById ("occKiaraId").onchange = function()
{
  if (this.checked)
  {
    DRAWEXE.terminalPasteScript ("jsupload {{site.baseurl}}/images/kiara_2k_cube.jpg\n");
    DRAWEXE.terminalPasteScript ("vbackground -cubemap kiara_2k_cube.jpg -invertedz\n");
  }
}
document.getElementById ("occLabelsId").onchange = function()
{
  if (this.checked)
  {
    DRAWEXE.terminalPasteScript ("jsupload {{site.baseurl}}/images/cubemap_labels.png\n");
    DRAWEXE.terminalPasteScript ("vbackground -cubemap cubemap_labels.png -invertedz\n");
  }
}
</script>
