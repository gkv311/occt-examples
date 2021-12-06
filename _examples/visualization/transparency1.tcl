pload MODELING VISUALIZATION

# create objects
pcylinder c 0.5 1
box b1 -1 -1 -0.5 1 1 1
box b2  0 0 -0.5 1 1 1
box b3 -1  0 -0.5 1 1 1

vclear
vinit View1
vdisplay -dispMode 1 c b1 b2 b3
vaspects c  -color yellow -transparency 0.4
vaspects b1 -color blue   -transparency 0.8
vaspects b2 -color green  -transparency 0.0
vaspects b3 -color red    -transparency 0.5
vfit
vaxo
vzoom 0.9

vraytrace 0
# try without OIT
vrenderparams -oit off
# try weighted OIT
vrenderparams -oit weight 0.0
# try Depth Peeling with 4 layers 
vrenderparams -oit peeling 4
