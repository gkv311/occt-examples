pload MODELING VISUALIZATION

# Make a box b1 with a corner at [0, 0, 0] and the specified sizes
box b1 10.0 15.0 20.0

# Make a box b2 by two points
box b2 -min 5.0 7.5 10.0 -max 20.0 25.0 30.0

# find common between two boxes
bcommon r b1 b2

# cut box b2 from b1
#bcut r b1 b2

# fuse two boxes
#bfuse r b1 b2

# display in the viewer
vinit View1
vdisplay -dispMode 0 b1 b2
vaspects b1 -color YELLOW
vaspects b2 -color GREEN
vdisplay -dispMode 1 r
vaspects r -color RED
vfit
