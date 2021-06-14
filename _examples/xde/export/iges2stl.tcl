pload XDE OCAF VISUALIZATION MODELING

# read IGES file into B-Rep shape using IGESControl_Reader
jsupload /occt-examples/models/occ/hammer.iges
igesread hammer.iges i *

# sew Faces into a single Shell
sewing s i

# display the shape in 3D viewer (will also compute default triangulation)
vinit View1
vdisplay -dispMode 1 s
vfit

# alternatively - perform meshing explicitly
#incmesh s 1.0
#trinfo s

# export shape into STL file using StlAPI_Writer
writestl s exported.stl

# download generated file
#jsdownload exported.stl
