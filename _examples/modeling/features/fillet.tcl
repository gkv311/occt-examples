pload MODELING VISUALIZATION

# create a box
box b 8.0 10.0 15.0
explode b E

# make fillet at the first edge in the box
set aRadius 3.0
blend r b $aRadius b_1

# display results
vinit View1
vdisplay -dispMode 0 b
vdisplay -dispMode 1 r
vsetcolor r RED
vfit




