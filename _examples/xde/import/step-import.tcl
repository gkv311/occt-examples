pload XDE OCAF VISUALIZATION MODELING

# read STEP file into XDE document using STEPCAFControl_Reader
jsupload {{site.baseurl}}/models/occ/as1-oc-214.stp
ReadStep D as1-oc-214.stp

# display the document in 3D viewer using XCAFPrs_AISObject
vinit View1
XDisplay -dispMode 1 D -explore
vfit

# get the whole document as a single shape
XGetOneShape s D
trinfo s

# print some information
XGetAllColors D
XGetAllVisMaterials D
