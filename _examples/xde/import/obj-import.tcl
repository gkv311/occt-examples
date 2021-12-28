pload XDE OCAF VISUALIZATION MODELING

# read OBJ file into XDE document using RWObj_CafReader
jsupload \
  {{site.baseurl}}/models/HDU/HDU_lowRez_part1.obj \
  {{site.baseurl}}/models/HDU/HDU_lowRez_part2.obj \
  {{site.baseurl}}/models/HDU/HDU_lowRez_part1.mtl \
  {{site.baseurl}}/models/HDU/HDU_lowRez_part2.mtl

ReadObj D HDU_lowRez_part1.obj -fileUnit m
ReadObj D HDU_lowRez_part2.obj -fileUnit m -noCreateDoc

# get the whole document as a single shape
XGetOneShape s D
trinfo s

# print some information
XGetAllVisMaterials D

# upload texture images
jsupload \
  {{site.baseurl}}/models/HDU/HDU_01.jpg \
  {{site.baseurl}}/models/HDU/HDU_02.jpg

# remove textures
#XRemoveVisMaterial D lambert2SG
#XRemoveVisMaterial D lambert3SG

# display the document in 3D viewer using XCAFPrs_AISObject
vinit View1
XDisplay -dispMode 1 D -explore
vfit
