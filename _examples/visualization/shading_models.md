---
layout: example
title: Visualization / Shading Models
categories: examples visualization
permalink: /visualization-shading_models/
tclSource: /visualization/shading_models.tcl
---

Sample shows the various Shading Models supported by OCCT defined by **Graphic3d_TypeOfShadingModel** enumeration:

<div class="btn-group" data-toggle="buttons" style="margin-left: 35px">
  <label class="btn btn-primary active">
    <input type="radio" name="options" id="occAllId" checked> All
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occUnlitId"> Unlit
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occFacetId"> Faceted
  </label>
  <br>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occGouraudId"> Gouraud
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occPhongId"> Phong
  </label>
  <label class="btn btn-primary">
    <input type="radio" name="options" id="occPBRId"> PBR
  </label>
</div>

- **Graphic3d_TOSM_UNLIT**<br>
  Unlit Shading (or shadeless), lighting is ignored and facet is fully filled by its material color.
  This model is useful for artificial/auxiliary objects, not intended to be lit, or for objects with pre-calculated lighting information (e.g. captured by camera).
- **Graphic3d_TOSM_FACET**<br>
  Flat Shading, calculated per-facet basing on facet normal.
  This model is useful for mesh element analysis.
  Note that unlike Graphic3d_TOSM_VERTEX/Graphic3d_TOSM_FRAGMENT, this shading model does NOT require normals to be defined within vertex attributes.
- **Graphic3d_TOSM_VERTEX**<br>
  Gouraud Shading, calculated per-vertex basing on nodal normal, and then color is interpolated across fragments.
  This shading model was default within Fixed-Function Pipeline of old OpenGL.
  Shading model requires normals to be defined within vertex attributes.
- **Graphic3d_TOSM_FRAGMENT**<br>
  Phong Shading, calculated per-fragment basing on nodal normal, so that normal is interpolated across fragments.
  This is a main shading model nowadays, providing the best image quality.
  Shading model requires normals to be defined within vertex attributes.
- **Graphic3d_TOSM_PBR**<br>
  Metallic-roughness physically based (PBR) illumination system.
- **Graphic3d_TOSM_PBR_FACET**<br>
  Same as Graphic3d_TOSM_PBR but using flat per-triangle normal.

<br>

See also the [following article](https://unlimited3d.wordpress.com/2020/07/18/pbr-in-occt-3d-viewer/) for more detailed comparison.

<script>
document.getElementById ("occAllId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vdisplay *; vfit;"); }
}
document.getElementById ("occUnlitId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vdonly p31; vfit;"); }
}
document.getElementById ("occFacetId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vdonly p32; vfit;"); }
}
document.getElementById ("occGouraudId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vdonly p11; vfit;"); }
}
document.getElementById ("occPhongId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vdonly p12; vfit;"); }
}
document.getElementById ("occPBRId").onchange = function()
{
  if (this.checked) { DRAWEXE.terminalPasteScript ("vdonly p21; vfit;"); }
}
</script>
