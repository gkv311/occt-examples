# load STL file
jsupload {{site.baseurl}}/models/skull/skull_w_jaw.stl

pload XDE MODELING VISUALIZATION
vinit View1
vcamera -persp
vviewparams -scale 2 -proj -0 -1 -0 -up 0 0 1 -at 96 88 -68

# display red boxes
set aBoxTransp 0.5
box b1   0   0 0 50 50 50
box b2 150   0 0 50 50 50
box b3   0 150 0 50 50 50
vdisplay b1 b2 b3 -dispMode 1 -noupdate
vaspects b1 b2 b3 -color RED -transparency $aBoxTransp

# display green toruses
set aTorTransp 0.5
vtorus    t1 50 25 -noupdate
vlocation t1 -reset -rotate 0 0 0 0 1 0 90 -translate 175 175 -125 -noupdate
vtorus    t2 50 25 -noupdate
vlocation t2 -reset -rotate 0 0 0 0 1 0 90 -translate 175 175 25 -noupdate
vtorus    t3 50 25 -noupdate
vlocation t3 -reset -rotate 0 0 0 0 1 0 90 -translate 25 175 -125 -noupdate
vaspects  t1 t2 t3 -color GREEN -transparency $aTorTransp

# display blue spheres
set aSphTransp 0.5
set aNbSpheres 3
set aSpheres {}
for {set i 0} {$i < $aNbSpheres} {incr i} {
  for {set j 0} {$j < $aNbSpheres} {incr j} {
    for {set k 0} {$k < $aNbSpheres} {incr k} {
      set aName s$i$j$k
      lappend aSpheres $aName
      psphere    $aName 25.0
      ttranslate $aName 100.*$i 100.*$j -100.*$k
    }
  }
}
vdisplay -dispMode 1 {*}$aSpheres -noupdate
vaspects {*}$aSpheres -color BLUE -transparency $aSphTransp

# display red skulls
set aSkullTransp 0.5
readstl    s1 skull_w_jaw.stl
ttranslate s1 -71 -2 -1638
fscale     s1 0 0 0 0.75
vdisplay   s1 -dispMode 1 -hiMode 1 -noupdate
vlocation  s1 -location 75 75 -75   -noupdate
vaspects   s1 -color RED -transparency $aSkullTransp
tcopy -mesh s1 s2
vdisplay  s2 -dispMode 1 -hiMode 1 -noupdate
vlocation s2 -location 225 75 -75  -noupdate
vaspects  s2 -color RED -transparency $aSkullTransp

# define camera animation
#vfit
#vviewparams -scale 2 -proj -0 -1 -0 -up 0 0 1 -at 96 88 -68
#vviewparams -scale 2 -proj -1 -0 -0 -up 0 0 1 -at 96 88 -68
#vviewparams -scale 2 -proj -0  1 -0 -up 0 0 1 -at 96 88 -68
#vviewparams -scale 2 -proj  1 -0 -0 -up 0 0 1 -at 96 88 -68
vanim a/v1 -start  0.0 -end  5.0 -view -eye1  96 -515 -68 -eye2 -507   88 -68 -at1 96 88 -68 -at2 96 88 -68 -up1 0 0 1 -up2 0 0 1 -scale1 2 -scale2 2
vanim a/v2 -start  5.0 -end 10.0 -view -eye1 -507  88 -68 -eye2   96  691 -68 -at1 96 88 -68 -at2 96 88 -68 -up1 0 0 1 -up2 0 0 1 -scale1 2 -scale2 2
vanim a/v3 -start 10.0 -end 15.0 -view -eye1  96  691 -68 -eye2  699   88 -68 -at1 96 88 -68 -at2 96 88 -68 -up1 0 0 1 -up2 0 0 1 -scale1 2 -scale2 2
vanim a/v4 -start 15.0 -end 20.0 -view -eye1  699  88 -68 -eye2   96 -515 -68 -at1 96 88 -68 -at2 96 88 -68 -up1 0 0 1 -up2 0 0 1 -scale1 2 -scale2 2

# try without OIT
vrenderparams -oit off
# try weighted OIT
#vrenderparams -oit weight 0.0
# try Depth Peeling
set aNbPeels 2
vrenderparams -oit peeling $aNbPeels

vrenderparams -perfCounters fps
vanim a -resume
