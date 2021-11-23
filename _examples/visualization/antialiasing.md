---
layout: example
title: Visualization / Anti-aliasing
categories: examples visualization
permalink: /visualization-anti-aliasing
tclSource: /visualization/antialiasing.tcl
---

Sample demonstrating [Anti-aliasing](https://en.wikipedia.org/wiki/Spatial_anti-aliasing) options that can be configured within `Graphic3d_RenderingParams` structure returned by `V3d_View::ChangeRenderingParams()`.
Anti-aliasing algorithms are intended to solve the problem of jagged and pixelated edges. Interactive options:

<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occScale50"> 50%
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occScale75"> 75%
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occScale100"> 100% Scale
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occScale150"> 150%
  </label>
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="occScale200" checked> 200%
  </label>
  <br>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occMsaa0"> MSAA 0
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occMsaa2"> MSAA 2
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occMsaa4"> MSAA 4
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occMsaa8"> MSAA 8
  </label>
</div>
<br>

`Graphic3d_RenderingParams::NbMsaaSamples` allows enabling [multi-sampling anti-aliasing](https://en.wikipedia.org/wiki/Multisample_anti-aliasing) (MSAA) with specified number of samples within graphics hardware limits.
Limit could be queried using `Graphic3d_GraphicDriver::InquireLimit()` with `Graphic3d_TypeOfLimit_MaxMsaa` parameter or using `vglinfo` command in Draw Harness.
Note that returned limit could be equal to `0`, which means no MSAA support.
`::RenderResolutionScale` should be set to default 1.0 value to use MSAA mode.
In general, MSAA is a compromise between quality and performance.
2 samples configuration doesn't cost to much but usually provides poor visual result (worse than without MSAA in some cases).
4 samples provides average result, and 8 samples gives best results (some systems might support a higher number of samples).

`Graphic3d_RenderingParams::RenderResolutionScale` manages resolution used for rendering, which is equal to 1.0 (100%) by default.
Setting this property to values above 1.0 activates [super-sampling anti-aliasing](https://en.wikipedia.org/wiki/Supersampling) (SSAA) mode (e.g. 2.0 for 200% scale).
It is also possible setting property to values below 1.0, which could be used to improve performance on slow graphics hardware (e.g. 0.5 for 50%).
`::NbMsaaSamples` should be set to default 0 value to use `::RenderResolutionScale`.

<br>

<script>
document.getElementById ("occScale50").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 0.50 -msaa 0"); }
}
document.getElementById ("occScale75").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 0.75 -msaa 0"); }
}
document.getElementById ("occScale100").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 1.00 -msaa 0"); }
}
document.getElementById ("occScale150").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 1.50 -msaa 0"); }
}
document.getElementById ("occScale200").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 2.00 -msaa 0"); }
}
document.getElementById ("occMsaa0").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 1.00 -msaa 0"); }
}
document.getElementById ("occMsaa2").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 1.00 -msaa 2"); }
}
document.getElementById ("occMsaa4").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 1.00 -msaa 4"); }
}
document.getElementById ("occMsaa8").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vrenderparams -rendScale 1.00 -msaa 8"); }
}
</script>
