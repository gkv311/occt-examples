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
jsupload /occt-examples/images/cubemap_labels.dds
vbackground -cubemap cubemap_labels.dds -invertedz
