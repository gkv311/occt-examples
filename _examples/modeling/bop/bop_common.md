---
layout: example
title: Modeling / Boolean / Common
categories: examples modeling-bop
permalink: /modeling-bop-common/
tclSource: /modeling/bop/bop_common.tcl
cppSource: /modeling/bop/bop_common.cpp
---

Sample demonstrating Boolean operations between two solids using BRepAlgoAPI_Common, BRepAlgoAPI_Cut and BRepAlgoAPI_Fuse algorithms (which are aliases to [BRepAlgoAPI_BooleanOperation]({{ site.occt_refman }}/class_b_rep_algo_a_p_i___boolean_operation.html)).

**Perform Boolean operation**:

<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="occBopCommonId" checked> Common
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occBopCutId"> Cut
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occBopFuseId"> Fuse
  </label>
</div>
<br>

<script>
document.getElementById ("occBopCommonId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("bcommon r b1 b2; vdisplay r"); }
}
document.getElementById ("occBopCutId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("bcut r b1 b2; vdisplay r"); }
}
document.getElementById ("occBopFuseId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("bfuse r b1 b2; vdisplay r"); }
}
</script>
