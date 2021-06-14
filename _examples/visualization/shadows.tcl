pload MODELING VISUALIZATION

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

# add RED directional light source in disabled state
vlight -add DIRECTIONAL -color RED   -direction 1.0 -1.0 -0.5 -head 0 -display dir2 -prsSize $aPrsSize
vselect 300 85
vlight -change 2 -castShadows 1

#vrenderparams -shadingModel phong
vrenderparams -shadowMapBias 0.01
