pload MODELING VISUALIZATION

set aDist   -10000000
set aHeight 20
set aThick  10
set aPlane {0 -1 0 1 0 0}

vinit View1
vfront

# location is premultiplied to vertices position
text2brep t1 "KO Premultiplied" -plane {*}$aPlane -height $aHeight
prism t1 t1 0 $aThick 0
ttranslate t1 0 $aDist 50
vdisplay -dispMode 1 t1
vaspects t1 -color RED

# location is set to presentation
text2brep t2 "KO Located" -plane {*}$aPlane -height $aHeight
prism t2 t2 0 $aThick 0
vdisplay -dispMode 1 t2
vlocation t2 -location 0 $aDist 0
vaspects t2 -color YELLOW

# location is set to presentation + to Z-Layer origin
text2brep t3 "OK ZLayer origin" -plane {*}$aPlane -height $aHeight
ttranslate t3 0 0 -50
prism t3 t3 0 $aThick 0

set aLayer [vzlayer -insertBefore DEFAULT -origin 0 $aDist 0]
vselprops dynHighlight -layer -1
vdisplay -dispMode 1 t3 -zlayer $aLayer
vlocation t3 -location 0 $aDist 0
vaspects t3 -color GREEN

box b -5 -100 -100 200 200 200
vdisplay -dispMode 0 b -zlayer $aLayer -noselect
vlocation b -location 0 $aDist 0

vfit
