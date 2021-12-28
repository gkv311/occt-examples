pload MODELING VISUALIZATION

# display sample model
box b 1 2 3
psphere s 1
vinit View1
vclear
vcamera -fovy 100
vzbufftrihedron
vdisplay -dispMode 1 s
vfit
vrenderparams -shadingModel pbr

# setup environment cubemap texture
jsupload {{site.baseurl}}/images/cubemap_labels.png
vbackground -cubemap cubemap_labels.png -invertedz
