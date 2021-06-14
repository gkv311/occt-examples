---
layout: example
title: XDE / Export / IGES to STL
categories: examples xde export
permalink: /xde-export-iges2stl
tclSource: /xde/export/iges2stl.tcl
cppSource: /xde/export/iges2stl.cpp
---

Sample shows conversion of IGES model into STL file using [StlAPI_Writer]({{ site.occt_refman }}/class_stl_a_p_i___writer.html).

<input type="button" value="Upload another IGES file" id="occUploadIgesId">

<input type="button" value="Download generated STL file" id="occDownloadStlId">

<script>
document.getElementById ("occUploadIgesId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("vclear; clear\n");
  DRAWEXE.terminalPasteScript ("jsupload . -path uploaded.igs\n");
  DRAWEXE.terminalPasteScript ("igesread uploaded.igs s *; vdisplay -dipsMode 1 s; vfit; writestl s exported.stl\n");
}
document.getElementById ("occDownloadStlId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("jsdownload exported.stl\n");
}
</script>
