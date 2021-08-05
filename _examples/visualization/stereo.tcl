pload MODELING VISUALIZATION

jsupload models/occ/Top.brep
restore Top.brep s

vinit View1
vclear
vzbufftrihedron
vcamera -persp -fovy 60
vdisplay s -dispMode 1 -highMode 1
vaspects s -isoOnTriangulation 1
vfit

# simple red-cyan anaglyph glasses
vstereo -anaglyph redCyan

# row-interleaved displays
#vstereo -mode rowInterlaced -reverse 0

# shutter-glasses are unsupported in browser
#vstereo -mode quadBuffer

# TODO propagate WebXR support
#vstereo -mode openVR
