pload MODELING VISUALIZATION
vinit View1

# create multiple AIS_ViewCube with various styles
# color
vrenderparams -rendScale 2
vviewcube vc1 -boxColor B0E0FF -textColor 00668A
vdisplay vc1 -trihedron bottomLeft 100 100

# transparency
vviewcube vc2 -transparency 0.5
vdisplay vc2 -trihedron topLeft 100 100

# font
vviewcube vc3 -reset -boxSideColor WHITE -font "monospace" -fontHeight 16
vdisplay vc3 -trihedron bottomRight 100 100
vaspects vc3 -setFaceBoundaryDraw 1 -setFaceBoundaryWidth 2

# corner radius
vviewcube vc4 -reset -boxSideColor WHITE -roundRadius 0.2 -boxEdgeGap 2
vdisplay vc4 -trihedron topRight 100 100
vaspects vc4 -setFaceBoundaryDraw 1

# padding
vviewcube vc5 -reset -boxFacetExtension 0 -axesPadding 0
vdisplay vc5 -trihedron center
