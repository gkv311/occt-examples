---
layout: example
title: XDE / Import / STEP
categories: examples xde import
permalink: /xde-import-step/
tclSource: /xde/import/step-import.tcl
cppSource: /xde/import/step-import.cpp
---

Sample shows reading of STEP model into XCAF document using [STEPCAFControl_Reader]({{ site.occt_refman }}/class_s_t_e_p_c_a_f_control___reader.html).

<input type="button" value="Upload another STEP file" id="occUploadStepId">

<script>
document.getElementById ("occUploadStepId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("vclear; Close *\n");
  DRAWEXE.terminalPasteScript ("jsupload . -path uploaded.stp\n");
  DRAWEXE.terminalPasteScript ("ReadStep D uploaded.stp; XDisplay -dispMode 1 D -explore; vfit;\n");
}
</script>
