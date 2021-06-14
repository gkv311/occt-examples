---
layout: example
title: Visualization / Propeller Animation
categories: examples visualization
permalink: /visualization-propeller
tclSource: /visualization/propeller.tcl
---

Sample demonstrates propeller animation in 3D Viewer based on AIS_Animation interface.

<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occStopId"> Stop
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occPauseId"> Pause
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occResumeId"> Resume
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occPlayId"> Play
  </label>
</div>
<br>

<script>
document.getElementById ("occStopId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vanimation anim -stop;"); }
}
document.getElementById ("occPauseId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vanimation anim -pause;"); }
}
document.getElementById ("occResumeId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vanimation anim -resume -playSpeed 0.2;"); }
}
document.getElementById ("occPlayId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vanimation anim -play -playSpeed 0.2;"); }
}
</script>
