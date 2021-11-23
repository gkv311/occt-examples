pload MODELING VISUALIZATION
vinit View1
vbackground -gradient GRAY70 BLACK -gradientMode ELLIPTICAL

# check MSAA limits on specific graphics hardware
set aNbSamples 0
regexp {Max MSAA samples: ([0-9]+)\s} [uplevel 0 vglinfo] res aNbSamples
puts $aNbSamples

# display sample wireframe
box b2 100 100 100
vdisplay b2 -dispMode 0
vfit

# display sample shading
box b1 25 25 25 50 50 50
vdisplay b1 -dispMode 1

# display sample text
vdrawtext t " Label 1.0" -pos 100 50 50 -color GREEN -height 20

# display sample marker
vpoint   p 100 50 50
vaspects p -markerType XCIRCLE -markerSize 3 -color BLUE

# render frame at 200% scale
vrenderparams -rendScale 2.00 -msaa 0
