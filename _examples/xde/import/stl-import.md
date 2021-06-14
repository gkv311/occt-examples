---
layout: example
title: XDE / Import / STL
categories: examples xde import
permalink: /xde-import-stl
tclSource: /xde/import/stl-import.tcl
cppSource: /xde/import/stl-import.cpp
---

Sample shows reading of STL model into TopoDS_Shape using [RWStl_Reader]({{ site.occt_refman }}/class_r_w_stl___reader.html).

<input type="button" value="Upload another STL file" id="occUploadStlId">

<script>
document.getElementById ("occUploadStlId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("vclear; clear\n");
  DRAWEXE.terminalPasteScript ("jsupload . -path uploaded.stl\n");
  DRAWEXE.terminalPasteScript ("readstl s uploaded.stl; vdisplay -dispMode 1 s; vfit;\n");
}
</script>
