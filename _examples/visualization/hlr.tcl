pload MODELING VISUALIZATION

# load sample model
jsupload /occt-examples/models/occ/Ball.brep
restore Ball.brep b

# display sample model
vinit View1
vclear
vdisplay -dispMode 1 b
vfit

# HLR-alike visual effect using OpenGL tricks
# (NO geometry computations)
vhlr off
vaspects b -edgeColor RED -edgeWidth 1 -faceBoundaryDraw 1 -mostContinuity g2 -faceBoundaryColor RED -faceBoundaryWidth 1
vaspects b -silhouette 1 -interiorStyle HIDDENLINE

# HLRBRep_PolyAlgo algorithm on triangulation
# (presentation is recomputed on each camera movement)
#vhlr on -algo polyAlgo -showHidden 0

# HLRBRep_Algo algorithm on exact geomtry
# (presentation is recomputed on each camera movement)
#vhlr on -algo algo -showHidden 0
