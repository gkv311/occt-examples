---
layout: example
title: Visualization / X-Ray shader
categories: examples visualization
permalink: /visualization-xray/
tclSource: /visualization/xray.tcl
---

Script demonstrates usage of custom GLSL programs using Graphic3d_ShaderProgram interface and defines a simple X-Ray shading program.

<div style="margin-left: 35px">
  <label>Transparency
  <input type="range" min="1" max="100" value="50" class="slider" id="occTranspRangeId" style="width: 200px">
  </label>
</div>
<script>
document.getElementById ("occTranspRangeId").oninput = function()
{
  DRAWEXE.terminalPasteScript ("vsettransparency s " + this.value/100.0);
}
</script>
