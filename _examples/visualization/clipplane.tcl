pload XDE OCAF VISUALIZATION MODELING

# read sample model
jsupload {{site.baseurl}}/models/occ/as1-oc-214.stp
ReadStep D as1-oc-214.stp

vinit View1
vzbufftrihedron
XDisplay -dispMode 1 D -explore
vfit

# define Clipping Plane with -DY normal with capping
# and assign it to entire View
vclipplane c -equation 0 1 0 -60 -set -capping 1 -useObjMaterial 0

# use texture for capping
jsupload {{site.baseurl}}/images/hatch_1.png
vclipplane c -texName hatch_1.png -texScale 0.05 -0.05


