---
layout: example
title: XDE / Export / STEP to glTF
categories: examples xde export
permalink: /xde-export-step2gltf/
tclSource: /xde/export/step2gltf.tcl
cppSource: /xde/export/step2gltf.cpp
---

Sample shows conversion of a colored STEP model into glTF model using [RWGltf_CafWriter]({{ site.occt_refman }}/class_r_w_gltf___caf_writer.html).

<input type="button" value="Upload another STEP file" id="occUploadStepId">

<input type="button" value="Download generated glTF file" id="occDownloadGltfId">

<script>
document.getElementById ("occUploadStepId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("vclear; Close *\n");
  DRAWEXE.terminalPasteScript ("jsupload .  -path uploaded.stp\n");
  DRAWEXE.terminalPasteScript ("ReadStep D uploaded.stp; XDisplay -dispMode 1 D; vfit; WriteGltf D exported.glb\n");
}
document.getElementById ("occDownloadGltfId").onclick = function()
{
  DRAWEXE.terminalPasteScript ("jsdownload exported.glb\n");
}
</script>
