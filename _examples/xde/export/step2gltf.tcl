pload XDE OCAF VISUALIZATION MODELING

# read STEP file into XDE document using STEPCAFControl_Reader
jsupload /occt-examples/models/occ/as1-oc-214.stp
ReadStep D as1-oc-214.stp

# display the document in 3D viewer using XCAFPrs_AISObject
# (will also compute default triangulation)
vinit View1
XDisplay -dispMode 1 D -explore
vfit

# alternatively - perform meshing explicitly
XGetOneShape s D
#incmesh s 1.0
#trinfo s

# export XDE document into glTF file using RWGltf_CafWriter
WriteGltf D exported.glb

# download generated file
#jsdownload exported.glb
