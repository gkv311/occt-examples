pload XDE OCAF VISUALIZATION MODELING

# read IGES file into XDE document using IGESCAFControl_Reader
jsupload {{site.baseurl}}/models/occ/hammer.iges
ReadIges D hammer.iges

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
