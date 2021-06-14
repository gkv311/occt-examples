pload MODELING VISUALIZATION

# Make a toroidal face by a series of shape revolves.
# Make a starting vertex at [-1.0, 0, 0].
set aVertPos {-1.0 0.0 0.0}
vertex v {*}$aVertPos

# Make a circular Edge by revolting Vertex around
# an axis DY positioned at [-1.5, 0.0, 0.0] on angle 360 degrees
set aRevBase {-1.5 0.0 0.0}
set aDirDY   {0 1 0}
set anAngle 360
revol e v {*}$aRevBase {*}$aDirDY $anAngle

# Make a toroidal face by revolting Edge
# around DZ axis on 2*Pi angle.
set aZero  {0 0 0}
set aDirDZ {0 0 1}
revol f e {*}$aZero {*}$aDirDZ $anAngle

# display results
vinit View1
vdisplay -dispMode 1 f
vdisplay -dispMode 0 v e
vsetcolor e GREEN
vsetcolor f RED
vfit
