---
layout: example
title: Visualization / Clipping plane
categories: examples visualization
permalink: /visualization-clipplane
tclSource: /visualization/clipplane.tcl
---

Script demonstrates section of an object by Clipping Plane defined by [Graphic3d_ClipPlane]({{ site.occt_refman }}/class_graphic3d___clip_plane.html) class.

<div style="margin-left: 35px">
  <label>Clipping plane Y Position
  <input type="range" min="-150" max="0" value="-60" class="slider" id="occClipRangeId" style="width: 200px">
  </label>

  <br>
  <input type="checkbox" id="occClippingId" checked>
  <label for="occClippingId">Enable clipping</label>

  <br>
  <input type="checkbox" id="occCappingId" checked>
  <label for="occCappingId">Capping</label>

  <br>
  <input type="checkbox" id="occKeepObjMatId">
  <label for="occKeepObjMatId">Keep object color</label>
</div>


<script>
document.getElementById ("occClipRangeId").oninput = function()
{
  DRAWEXE.terminalPasteScript ("vclipplane c -equation 0 1 0 " + this.value);
}
document.getElementById ("occClippingId").onchange = function()
{
  DRAWEXE.terminalPasteScript ("vclipplane c " + (this.checked ? "-set" : "-unset"));
}
document.getElementById ("occCappingId").onchange = function()
{
  DRAWEXE.terminalPasteScript ("vclipplane c -capping " + (this.checked ? "1" : "0"));
}
document.getElementById ("occKeepObjMatId").onchange = function()
{
  DRAWEXE.terminalPasteScript ("vclipplane c -useObjMaterial " + (this.checked ? "1" : "0"));
}
</script>
