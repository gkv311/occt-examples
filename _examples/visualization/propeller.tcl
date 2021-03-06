pload MODELING VISUALIZATION

# load shapes
jsupload {{site.baseurl}}/models/occ/CrankArm.rle \
  {{site.baseurl}}/models/occ/CylinderHead.rle \
  {{site.baseurl}}/models/occ/Propeller.rle \
  {{site.baseurl}}/models/occ/EngineBlock.rle

restore CrankArm.rle     a
restore CylinderHead.rle h
restore Propeller.rle    p
restore EngineBlock.rle  e

vclear
vinit View1
vzbufftrihedron
vcamera -persp -fovy 60
vdisplay -dispMode 1 -mutable a h p e
vfit
vsetcolor p GREEN
vsetcolor e RED
vsetcolor h PURPLE

vanimation anim -clear

# custom callback
proc drawAnimLabels    {thePts}        { vdrawtext lab "Current PTS: $thePts sec" -2d -persPos -1 1 30 -noupdate }
#proc drawAnimPropeller {theLocalPts}   { set aVal 0.0; if { $theLocalPts >= 1.0 && $theLocalPts <= 1.5 } { set aVal 0.9 }; vaspects -noupdate p -setTransparency $aVal }
proc drawAnimProp1     {theNormalized} { vaspects -noupdate p -setTransparency [expr $theNormalized * 0.9] }
proc drawAnimProp2     {theNormalized} { vaspects -noupdate p -setTransparency [expr (1.0 - $theNormalized) * 0.9] }
vanimation anim/cmd/1 -start 0   -dur 2.0 -cmd "drawAnimLabels %pts"
#vanimation anim/cmd/2 -start 0   -dur 2.0 -cmd "drawAnimPropeller %localPts"
vanimation anim/cmd/2 -start 1.0  -dur 0.1 -cmd "drawAnimProp1 %localNormalized"
vanimation anim/cmd/3 -start 1.5  -dur 0.1 -cmd "drawAnimProp2 %localNormalized"

# camera animation
vanimation anim/cam/1 -start 0   -dur 0.5 -view -up1 -0.408248   0.408248 0.816497  -up2 -0.70394    0.70394 -0.094542  -at1 0 0 -52.5 -at2 0 0 -52.5                 -eye1 718.333 -718.333 665.833 -eye2 -83.1757 83.1757 1186.12 -scale1 0.736953 -scale2 1.3
vanimation anim/cam/2 -start 0.5 -dur 0.5 -view -up1 -0.70394    0.70394 -0.094542  -up2 -0.0582751 -0.996311 0.0629907 -at1 0 0 -52.5 -at2 0 0 -52.5                 -eye1 -83.1757 83.1757 1186.12 -eye2 -83.1757 83.1757 1186.12 -scale1 1.3 -scale2 2.5
vanimation anim/cam/3 -start 1.0 -dur 0.5 -view -up1 -0.0582751 -0.996311 0.0629907 -up2 -0.0757833 -0.103462 0.991742  -at1 0 0 -52.5 -at2 0 0 -52.5                 -eye1 -83.1757 83.1757 1186.12 -eye2  57.3134 1235.7  80.7922 -scale1 2.5 -scale2 5.0
vanimation anim/cam/4 -start 1.5 -dur 0.5 -view -up1 -0.0757833 -0.103462 0.991742  -up2 -0.0757833 -0.103462 0.991742  -at1 0 0 -52.5 -at2 85.6748 -3.38673 -57.9416 -eye1  57.3134 1235.7  80.7922 -eye2  142.989 1232.32 75.3506 -scale1 5.0 -scale2 2.0

# propeller animation
vanimation anim/p/1  -start 0   -dur 0.5 -objectTrsf p -rot1 0 0 0 1                -rot2 0 0 0.707107 0.707107
vanimation anim/p/2  -start 0.5 -dur 0.5 -objectTrsf p -rot1 0 0 0.707107 0.707107  -rot2 0 0 1 6.12323e-17
vanimation anim/p/3  -start 1.0 -dur 0.5 -objectTrsf p -rot1 0 0 1 6.12323e-17      -rot2 0 0 -0.707107 0.707107
vanimation anim/p/4  -start 1.5 -dur 0.5 -objectTrsf p -rot1 0 0 -0.707107 0.707107 -rot2 0 0 0 1

# arm animation
vanimation anim/a/1  -start 0 -dur 0.03125 -objectTrsf a -rot1 0 0 0 1 -rot2 0 0 -0.0183813 0.999831 -loc1 0 0 0 -loc2 -0.186279 6.06481 -0
vanimation anim/a/2  -start 0.03125 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.0183813 0.999831 -rot2 0 0 -0.036604 0.99933 -loc1 -0.186279 6.06481 -0 -loc2 -0.744076 12.0712 -0
vanimation anim/a/3  -start 0.0625 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.036604 0.99933 -rot2 0 0 -0.0545094 0.998513 -loc1 -0.744076 12.0712 -0 -loc2 -1.67027 17.9614 -0
vanimation anim/a/4  -start 0.09375 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.0545094 0.998513 -rot2 0 0 -0.0719395 0.997409 -loc1 -1.67027 17.9614 -0 -loc2 -2.95964 23.6785 -0
vanimation anim/a/5  -start 0.125 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.0719395 0.997409 -rot2 0 0 -0.0887369 0.996055 -loc1 -2.95964 23.6785 -0 -loc2 -4.60486 29.1677 -0
vanimation anim/a/6  -start 0.15625 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.0887369 0.996055 -rot2 0 0 -0.104746 0.994499 -loc1 -4.60486 29.1677 -0 -loc2 -6.59642 34.3759 -0
vanimation anim/a/7  -start 0.1875 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.104746 0.994499 -rot2 0 0 -0.119812 0.992797 -loc1 -6.59642 34.3759 -0 -loc2 -8.92259 39.2531 -0
vanimation anim/a/8  -start 0.21875 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.119812 0.992797 -rot2 0 0 -0.133785 0.99101 -loc1 -8.92259 39.2531 -0 -loc2 -11.5693 43.7522 -0
vanimation anim/a/9  -start 0.25 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.133785 0.99101 -rot2 0 0 -0.146521 0.989208 -loc1 -11.5693 43.7522 -0 -loc2 -14.5202 47.83 -0
vanimation anim/a/10 -start 0.28125 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.146521 0.989208 -rot2 0 0 -0.157881 0.987458 -loc1 -14.5202 47.83 -0 -loc2 -17.756 51.4472 -0
vanimation anim/a/11 -start 0.3125 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.157881 0.987458 -rot2 0 0 -0.167737 0.985832 -loc1 -17.756 51.4472 -0 -loc2 -21.2549 54.5689 -0
vanimation anim/a/12 -start 0.34375 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.167737 0.985832 -rot2 0 0 -0.175973 0.984395 -loc1 -21.2549 54.5689 -0 -loc2 -24.9922 57.165 -0
vanimation anim/a/13 -start 0.375 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.175973 0.984395 -rot2 0 0 -0.182491 0.983208 -loc1 -24.9922 57.165 -0 -loc2 -28.9399 59.2107 -0
vanimation anim/a/14 -start 0.40625 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.182491 0.983208 -rot2 0 0 -0.187207 0.98232 -loc1 -28.9399 59.2107 -0 -loc2 -33.0668 60.6861 -0
vanimation anim/a/15 -start 0.4375 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.187207 0.98232 -rot2 0 0 -0.190062 0.981772 -loc1 -33.0668 60.6861 -0 -loc2 -37.3381 61.5771 -0
vanimation anim/a/16 -start 0.46875 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.190062 0.981772 -rot2 0 0 -0.191017 0.981587 -loc1 -37.3381 61.5771 -0 -loc2 -41.7161 61.875 -0
vanimation anim/a/17 -start 0.5 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.191017 0.981587 -rot2 0 0 -0.190062 0.981772 -loc1 -41.7161 61.875 -0 -loc2 -46.1597 61.5771 -0
vanimation anim/a/18 -start 0.53125 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.190062 0.981772 -rot2 0 0 -0.187207 0.98232 -loc1 -46.1597 61.5771 -0 -loc2 -50.6249 60.6861 -0
vanimation anim/a/19 -start 0.5625 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.187207 0.98232 -rot2 0 0 -0.182491 0.983208 -loc1 -50.6249 60.6861 -0 -loc2 -55.0656 59.2107 -0
vanimation anim/a/20 -start 0.59375 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.182491 0.983208 -rot2 0 0 -0.175973 0.984395 -loc1 -55.0656 59.2107 -0 -loc2 -59.4338 57.165 -0
vanimation anim/a/21 -start 0.625 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.175973 0.984395 -rot2 0 0 -0.167737 0.985832 -loc1 -59.4338 57.165 -0 -loc2 -63.6806 54.5689 -0
vanimation anim/a/22 -start 0.65625 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.167737 0.985832 -rot2 0 0 -0.157881 0.987458 -loc1 -63.6806 54.5689 -0 -loc2 -67.7573 51.4472 -0
vanimation anim/a/23 -start 0.6875 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.157881 0.987458 -rot2 0 0 -0.146521 0.989208 -loc1 -67.7573 51.4472 -0 -loc2 -71.6155 47.83 -0
vanimation anim/a/24 -start 0.71875 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.146521 0.989208 -rot2 0 0 -0.133785 0.99101 -loc1 -71.6155 47.83 -0 -loc2 -75.2089 43.7522 -0
vanimation anim/a/25 -start 0.75 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.133785 0.99101 -rot2 0 0 -0.119812 0.992797 -loc1 -75.2089 43.7522 -0 -loc2 -78.4935 39.2531 -0
vanimation anim/a/26 -start 0.78125 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.119812 0.992797 -rot2 0 0 -0.104746 0.994499 -loc1 -78.4935 39.2531 -0 -loc2 -81.4287 34.3759 -0
vanimation anim/a/27 -start 0.8125 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.104746 0.994499 -rot2 0 0 -0.0887369 0.996055 -loc1 -81.4287 34.3759 -0 -loc2 -83.9778 29.1677 -0
vanimation anim/a/28 -start 0.84375 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.0887369 0.996055 -rot2 0 0 -0.0719395 0.997409 -loc1 -83.9778 29.1677 -0 -loc2 -86.1088 23.6785 -0
vanimation anim/a/29 -start 0.875 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.0719395 0.997409 -rot2 0 0 -0.0545094 0.998513 -loc1 -86.1088 23.6785 -0 -loc2 -87.7949 17.9614 -0
vanimation anim/a/30 -start 0.90625 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.0545094 0.998513 -rot2 0 0 -0.036604 0.99933 -loc1 -87.7949 17.9614 -0 -loc2 -89.0148 12.0712 -0
vanimation anim/a/31 -start 0.9375 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.036604 0.99933 -rot2 0 0 -0.0183813 0.999831 -loc1 -89.0148 12.0712 -0 -loc2 -89.7529 6.06481 -0
vanimation anim/a/32 -start 0.96875 -dur 0.03125 -objectTrsf a -rot1 0 0 -0.0183813 0.999831 -rot2 0 0 -2.29621e-17 1 -loc1 -89.7529 6.06481 -0 -loc2 -90 7.5775e-15 -0
vanimation anim/a/33 -start 1 -dur 0.03125 -objectTrsf a -rot1 0 0 -2.29621e-17 1 -rot2 0 0 0.0183813 0.999831 -loc1 -90 7.5775e-15 -0 -loc2 -89.7529 -6.06481 -0
vanimation anim/a/34 -start 1.03125 -dur 0.03125 -objectTrsf a -rot1 0 0 0.0183813 0.999831 -rot2 0 0 0.036604 0.99933 -loc1 -89.7529 -6.06481 -0 -loc2 -89.0148 -12.0712 -0
vanimation anim/a/35 -start 1.0625 -dur 0.03125 -objectTrsf a -rot1 0 0 0.036604 0.99933 -rot2 0 0 0.0545094 0.998513 -loc1 -89.0148 -12.0712 -0 -loc2 -87.7949 -17.9614 -0
vanimation anim/a/36 -start 1.09375 -dur 0.03125 -objectTrsf a -rot1 0 0 0.0545094 0.998513 -rot2 0 0 0.0719395 0.997409 -loc1 -87.7949 -17.9614 -0 -loc2 -86.1088 -23.6785 -0
vanimation anim/a/37 -start 1.125 -dur 0.03125 -objectTrsf a -rot1 0 0 0.0719395 0.997409 -rot2 0 0 0.0887369 0.996055 -loc1 -86.1088 -23.6785 -0 -loc2 -83.9778 -29.1677 -0
vanimation anim/a/38 -start 1.15625 -dur 0.03125 -objectTrsf a -rot1 0 0 0.0887369 0.996055 -rot2 0 0 0.104746 0.994499 -loc1 -83.9778 -29.1677 -0 -loc2 -81.4287 -34.3759 -0
vanimation anim/a/39 -start 1.1875 -dur 0.03125 -objectTrsf a -rot1 0 0 0.104746 0.994499 -rot2 0 0 0.119812 0.992797 -loc1 -81.4287 -34.3759 -0 -loc2 -78.4935 -39.2531 -0
vanimation anim/a/40 -start 1.21875 -dur 0.03125 -objectTrsf a -rot1 0 0 0.119812 0.992797 -rot2 0 0 0.133785 0.99101 -loc1 -78.4935 -39.2531 -0 -loc2 -75.2089 -43.7522 -0
vanimation anim/a/41 -start 1.25 -dur 0.03125 -objectTrsf a -rot1 0 0 0.133785 0.99101 -rot2 0 0 0.146521 0.989208 -loc1 -75.2089 -43.7522 -0 -loc2 -71.6155 -47.83 -0
vanimation anim/a/42 -start 1.28125 -dur 0.03125 -objectTrsf a -rot1 0 0 0.146521 0.989208 -rot2 0 0 0.157881 0.987458 -loc1 -71.6155 -47.83 -0 -loc2 -67.7573 -51.4472 -0
vanimation anim/a/43 -start 1.3125 -dur 0.03125 -objectTrsf a -rot1 0 0 0.157881 0.987458 -rot2 0 0 0.167737 0.985832 -loc1 -67.7573 -51.4472 -0 -loc2 -63.6806 -54.5689 -0
vanimation anim/a/44 -start 1.34375 -dur 0.03125 -objectTrsf a -rot1 0 0 0.167737 0.985832 -rot2 0 0 0.175973 0.984395 -loc1 -63.6806 -54.5689 -0 -loc2 -59.4338 -57.165 -0
vanimation anim/a/45 -start 1.375 -dur 0.03125 -objectTrsf a -rot1 0 0 0.175973 0.984395 -rot2 0 0 0.182491 0.983208 -loc1 -59.4338 -57.165 -0 -loc2 -55.0656 -59.2107 -0
vanimation anim/a/46 -start 1.40625 -dur 0.03125 -objectTrsf a -rot1 0 0 0.182491 0.983208 -rot2 0 0 0.187207 0.98232 -loc1 -55.0656 -59.2107 -0 -loc2 -50.6249 -60.6861 -0
vanimation anim/a/47 -start 1.4375 -dur 0.03125 -objectTrsf a -rot1 0 0 0.187207 0.98232 -rot2 0 0 0.190062 0.981772 -loc1 -50.6249 -60.6861 -0 -loc2 -46.1597 -61.5771 -0
vanimation anim/a/48 -start 1.46875 -dur 0.03125 -objectTrsf a -rot1 0 0 0.190062 0.981772 -rot2 0 0 0.191017 0.981587 -loc1 -46.1597 -61.5771 -0 -loc2 -41.7161 -61.875 -0
vanimation anim/a/49 -start 1.5 -dur 0.03125 -objectTrsf a -rot1 0 0 0.191017 0.981587 -rot2 0 0 0.190062 0.981772 -loc1 -41.7161 -61.875 -0 -loc2 -37.3381 -61.5771 -0
vanimation anim/a/50 -start 1.53125 -dur 0.03125 -objectTrsf a -rot1 0 0 0.190062 0.981772 -rot2 0 0 0.187207 0.98232 -loc1 -37.3381 -61.5771 -0 -loc2 -33.0668 -60.6861 -0
vanimation anim/a/51 -start 1.5625 -dur 0.03125 -objectTrsf a -rot1 0 0 0.187207 0.98232 -rot2 0 0 0.182491 0.983208 -loc1 -33.0668 -60.6861 -0 -loc2 -28.9399 -59.2107 -0
vanimation anim/a/52 -start 1.59375 -dur 0.03125 -objectTrsf a -rot1 0 0 0.182491 0.983208 -rot2 0 0 0.175973 0.984395 -loc1 -28.9399 -59.2107 -0 -loc2 -24.9922 -57.165 -0
vanimation anim/a/53 -start 1.625 -dur 0.03125 -objectTrsf a -rot1 0 0 0.175973 0.984395 -rot2 0 0 0.167737 0.985832 -loc1 -24.9922 -57.165 -0 -loc2 -21.2549 -54.5689 -0
vanimation anim/a/54 -start 1.65625 -dur 0.03125 -objectTrsf a -rot1 0 0 0.167737 0.985832 -rot2 0 0 0.157881 0.987458 -loc1 -21.2549 -54.5689 -0 -loc2 -17.756 -51.4472 -0
vanimation anim/a/55 -start 1.6875 -dur 0.03125 -objectTrsf a -rot1 0 0 0.157881 0.987458 -rot2 0 0 0.146521 0.989208 -loc1 -17.756 -51.4472 -0 -loc2 -14.5202 -47.83 -0
vanimation anim/a/56 -start 1.71875 -dur 0.03125 -objectTrsf a -rot1 0 0 0.146521 0.989208 -rot2 0 0 0.133785 0.99101 -loc1 -14.5202 -47.83 -0 -loc2 -11.5693 -43.7522 -0
vanimation anim/a/57 -start 1.75 -dur 0.03125 -objectTrsf a -rot1 0 0 0.133785 0.99101 -rot2 0 0 0.119812 0.992797 -loc1 -11.5693 -43.7522 -0 -loc2 -8.92259 -39.2531 -0
vanimation anim/a/58 -start 1.78125 -dur 0.03125 -objectTrsf a -rot1 0 0 0.119812 0.992797 -rot2 0 0 0.104746 0.994499 -loc1 -8.92259 -39.2531 -0 -loc2 -6.59642 -34.3759 -0
vanimation anim/a/59 -start 1.8125 -dur 0.03125 -objectTrsf a -rot1 0 0 0.104746 0.994499 -rot2 0 0 0.0887369 0.996055 -loc1 -6.59642 -34.3759 -0 -loc2 -4.60486 -29.1677 -0
vanimation anim/a/60 -start 1.84375 -dur 0.03125 -objectTrsf a -rot1 0 0 0.0887369 0.996055 -rot2 0 0 0.0719395 0.997409 -loc1 -4.60486 -29.1677 -0 -loc2 -2.95964 -23.6785 -0
vanimation anim/a/61 -start 1.875 -dur 0.03125 -objectTrsf a -rot1 0 0 0.0719395 0.997409 -rot2 0 0 0.0545094 0.998513 -loc1 -2.95964 -23.6785 -0 -loc2 -1.67027 -17.9614 -0
vanimation anim/a/62 -start 1.90625 -dur 0.03125 -objectTrsf a -rot1 0 0 0.0545094 0.998513 -rot2 0 0 0.036604 0.99933 -loc1 -1.67027 -17.9614 -0 -loc2 -0.744076 -12.0712 -0
vanimation anim/a/63 -start 1.9375 -dur 0.03125 -objectTrsf a -rot1 0 0 0.036604 0.99933 -rot2 0 0 0.0183813 0.999831 -loc1 -0.744076 -12.0712 -0 -loc2 -0.186279 -6.06481 -0
vanimation anim/a/64 -start 1.96875 -dur 0.03125 -objectTrsf a -rot1 0 0 0.0183813 0.999831 -rot2 0 0 4.59243e-17 1 -loc1 -0.186279 -6.06481 -0 -loc2 3.79627e-31 -1.5155e-14 -0

#vanimation anim -play -playSpeed 0.2
