pload MODELING VISUALIZATION

# create a box
box b 8.0 10.0 15.0
explode b E

# make chamfer at the fifth edge in the box
set aDist 4.0
chamf r b b_5 $aDist

# display results
vinit View1
vdisplay -dispMode 0 b
vdisplay -dispMode 1 r
vsetcolor r RED
vfit




