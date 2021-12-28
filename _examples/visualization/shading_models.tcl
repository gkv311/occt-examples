pload MODELING VISUALIZATION
vinit View1

# define spheres with a rough triangulation to easily distinguish Shading Models
psphere p0 10
copytranslate p11 p0  0  0 0
copytranslate p12 p0 40  0 0
copytranslate p21 p0  0 20 0
copytranslate p22 p0 40 20 0
copytranslate p31 p0  0 40 0
copytranslate p32 p0 40 40 0
compound p11 p12 p21 p22 p31 p32 ss
incmesh ss 1
vdefaults -autoTriang 0

# display objects
vdisplay -dispMode 1 p11 p12 p21 p22 p31 p32
vdrawparray p41 triangles v  0 55 0 v  0 75 0 v 20 55 0 v  0 55 0 v  0 75 0 v  0 55 20 v  0 55 0 v  0 55 20 v 20 55 0 v  0 75 0 v  0 55 20 v 20 55 0
vdrawparray p42 triangles v 40 55 0 v 40 75 0 v 60 55 0 v 40 55 0 v 40 75 0 v 40 55 20 v 40 55 0 v 40 55 20 v 60 55 0 v 40 75 0 v 40 55 20 v 60 55 0
vtop
vrotate -0.9 0.1 0
vfit

# customize shading models
vaspects  p11 -setShadingModel VERTEX
vdrawtext t11   Graphic3d_TOSM_VERTEX   -pos 10  5 10 -color RED -aspect BOLD
vaspects  p12 -setShadingModel FRAGMENT
vdrawtext t12   Graphic3d_TOSM_FRAGMENT -pos 50  5 10 -color RED -aspect BOLD

vaspects  p21 -setShadingModel PBR
vdrawtext t21   Graphic3d_TOSM_PBR       -pos 10 25 10 -color RED -aspect BOLD
vaspects  p22 -setShadingModel PBR_FACET
vdrawtext t22   Graphic3d_TOSM_PBR_FACET -pos 50 25 10 -color RED -aspect BOLD

vaspects  p31 -setShadingModel UNLIT
vdrawtext t31   Graphic3d_TOSM_UNLIT    -pos 10 45 10 -color RED -aspect BOLD
vaspects  p32 -setShadingModel FACET
vdrawtext t32   Graphic3d_TOSM_FACET    -pos 50 45 10 -color RED -aspect BOLD
vaspects  p41 -setShadingModel VERTEX
vdrawtext t41   Graphic3d_TOSM_VERTEX   -pos 10 65 10 -color RED -aspect BOLD
vaspects  p42 -setShadingModel FACET
vdrawtext t42   Graphic3d_TOSM_FACET    -pos 50 65 10 -color RED -aspect BOLD
vdisplay -topmost t11 t12 t21 t22 t31 t32 t41 t42

vlight -change 1 -intensity 0.1
vrenderparams -shadingModel pbr

# setup cubemap image
jsupload {{site.baseurl}}/images/white_room_2k_cube.png
vbackground -cubemap white_room_2k_cube.png -invertedz
vlight -change 1 -intensity 0.5
