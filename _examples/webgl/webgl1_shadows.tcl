pload MODELING VISUALIZATION

# restrict context to OpenGL ES 2.0 (WebGL 1.0)
vdriver -load GLES
vcaps -maxVersion 2 0

# create simple scene
box b 1 2 3
box bb -5 -5 0 10 10 0 -preview
vgldebug 1
vclear
vinit View1
vcamera -persp
vdisplay -dispMode 1 b bb
vaspects bb -material STONE
vfit

# setup light sources
set aPrsSize 75
vlight -clear
vlight -add AMBIENT -color WHITE -display amb -prsSize $aPrsSize

# add WHITE directional light source
vlight -add DIRECTIONAL -color WHITE -direction 1.0  1.0 -1.0 -head 0 -display dir1 -prsSize $aPrsSize
vlight -change 1 -castShadows 1

vrenderparams -shadingModel PBR
vrenderparams -shadowMapBias 0.01

# setup environment cubemap
jsupload {{site.baseurl}}/images/kiara_2k_cube.jpg
vbackground -cubemap kiara_2k_cube.jpg
