pload MODELING VISUALIZATION
vinit View1

# Create box with specified origin and dimensions.
# Tip: BRepPrimAPI_MakeBox origin is at lower-left corner.
set aBoxOrig {  0 -300   0}
set aBoxDims {100  50  100}
box b -min {*}$aBoxOrig -size {*}$aBoxDims
vdisplay -dispMode 1 b
vaspects b -color CYAN -faceBoundary 1 -faceBoundaryColor BLACK
vtrihedron bt -origin {*}$aBoxOrig

# Create sphere with specified dimensions.
# Tip: BRepPrimAPI_MakeSphere origin is at arc center.
set aSphereOrig {0 0 0}
set aSphereRadius 100.0
plane sa {*}$aSphereOrig {*}{0 0 1}
psphere s sa $aSphereRadius
vdisplay -dispMode 1 s
vaspects s -color GREEN -transparency 0.5 -faceBoundary 1 -faceBoundaryColor BLACK
vtrihedron st -origin {*}$aSphereOrig

# Create cylinder defined by radius and height.
# Tip: BRepPrimAPI_MakeCylinder origin is at bottom circle center.
set aCyl1Orig {-150 200 0}
set aCyl1Radius  50.0
set aCyl1Length 150.0
plane c1a {*}$aCyl1Orig {*}{0 0 1}
pcylinder c1 c1a $aCyl1Radius $aCyl1Length
vdisplay -dispMode 1 c1
vaspects c1 -color YELLOW -faceBoundary 1 -faceBoundaryColor BLACK
vtrihedron c1t -origin {*}$aCyl1Orig

# Create cylinder defined by radius, height and cut angle.
set aCyl2Orig {0 200 0}
set aCyl2Radius  80.0
set aCyl2Length 250.0
set aCyl2Angle   90
plane c2a {*}$aCyl2Orig {*}{0 0 1}
pcylinder c2 c2a $aCyl2Radius $aCyl2Length $aCyl2Angle
vdisplay -dispMode 1 c2
vaspects c2 -color RED -faceBoundary 1 -faceBoundaryColor BLACK
vtrihedron c2t -origin {*}$aCyl2Orig

# Create cone defined by bottom radius and height.
# Tip: BRepPrimAPI_MakeCone origin is at bottom circle center.
set aCone1Orig {-200 0 0}
set aCone1Radius1  80.0
set aCone1Radius2   0.0
set aCone1Height  250.0
plane co1a {*}$aCone1Orig {*}{0 0 1}
pcone co1 co1a $aCone1Radius1 $aCone1Radius2 $aCone1Height
vdisplay -dispMode 1 co1
vaspects co1 -color PURPLE -faceBoundary 1 -faceBoundaryColor BLACK
vtrihedron co1t -origin {*}$aCone1Orig

# Create torus defined by bottom radius and height.
# Tip: BRepPrimAPI_MakeTorus origin is at arc center.
set aTor1Orig {-200 -200 0}
set aTor1Radius1 80.0
set aTor1Radius2 30.0
set aTor1Angle  270.0
plane t1a {*}$aTor1Orig {*}{0 0 1}
ptorus t1 t1a $aTor1Radius1 $aTor1Radius2 $aTor1Angle
vdisplay -dispMode 1 t1
vaspects t1 -color MAGENTA -faceBoundary 1 -faceBoundaryColor BLACK
vtrihedron t1t -origin {*}$aTor1Orig

vfit
