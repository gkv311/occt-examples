pload XDE OCAF VISUALIZATION MODELING

# read STL file into single shape using RWStl_Reader
jsupload /occt-examples/models/skull/skull_w_jaw.stl
readstl s skull_w_jaw.stl
trinfo s

# display the shape in 3D viewer using AIS_Shape
vinit View1
vdisplay -dispMode 1 s
vfit









