---
layout: example
title: Modeling / Features / Fillet
categories: examples modeling-features
permalink: /modeling-features-fillet/
tclSource: /modeling/features/fillet.tcl
cppSource: /modeling/features/fillet.cpp
---

Sample showing fillet construction using [BRepFilletAPI_MakeFillet]({{ site.occt_refman }}/class_b_rep_fillet_a_p_i___make_fillet.html) algorithm.

<div style="margin-left: 35px">
  <label>Fillet radius
  <input type="range" min="1" max="7" step="0.01" value="3" class="slider" id="occFilletRangeId" style="width: 200px">
  <output></output>
  </label>
</div>
<script>
document.getElementById ("occFilletRangeId").oninput = function()
{
  this.nextElementSibling.value = this.value;
  DRAWEXE.terminalPasteScript ("blend r b " + this.value + " b_1; vdisplay r");
}
</script>
