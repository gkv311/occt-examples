---
layout: example
title: XDE / Import / IGES
categories: examples xde import
permalink: /xde-import-iges
tclSource: /xde/import/iges-import.tcl
cppSource: /xde/import/iges-import.cpp
---

Sample shows reading of IGES model into XCAF document using [IGESCAFControl_Reader]({{ site.occt_refman }}/class_i_g_e_s_c_a_f_control___reader.html).

<input type="button" value="Upload another IGES file" id="occUploadIgesId">

<script>
document.getElementById ("occUploadIgesId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("vclear; Close *\n");
  DRAWEXE.terminalPasteScript ("jsupload . -path uploaded.igs\n");
  DRAWEXE.terminalPasteScript ("ReadIges D uploaded.igs; XDisplay -dispMode 1 D -explore; vfit;\n");
}
</script>
