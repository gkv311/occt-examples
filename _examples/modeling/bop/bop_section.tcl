pload MODELING VISUALIZATION

# Make a box b with a corner at [0, 0, 0] and the specified sizes
box b 10.0 15.0 20.0

# Make a plane with the origin in box center and DZ normal
plane p 10.0/2 15.0/2 20.0/2  0.0 0.0 1.0
mkface pp p -100 100 -100 100

# make a section of box b by plane pp
bsection r b pp

# display in the viewer
vinit View1
vdisplay -dispMode 0 b pp
vaspects b  -color YELLOW
vaspects pp -color GREEN
vdisplay -dispMode 1 r
vaspects r -color RED
vfit
