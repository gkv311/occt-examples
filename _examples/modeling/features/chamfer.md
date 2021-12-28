---
layout: example
title: Modeling / Features / Chamfer
categories: examples modeling-features
permalink: /modeling-features-chamfer/
tclSource: /modeling/features/chamfer.tcl
cppSource: /modeling/features/chamfer.cpp
---

Sample showing chamfer construction using [BRepFilletAPI_MakeChamfer]({{ site.occt_refman }}/class_b_rep_fillet_a_p_i___make_chamfer.html) algorithm.

<div style="margin-left: 35px">
  <label>Chamfer distance
  <input type="range" min="1" max="7" step="0.01" value="4" class="slider" id="occChamfRangeId" style="width: 200px">
  <output></output>
  </label>
</div>
<script>
document.getElementById ("occChamfRangeId").oninput = function()
{
  this.nextElementSibling.value = this.value;
  DRAWEXE.terminalPasteScript ("chamf r b b_5 " + this.value + "; vdisplay r");
}
</script>
