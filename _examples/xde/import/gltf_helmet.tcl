pload MODELING OCAF XDE VISUALIZATION

# read glTF model into XCAF document
jsupload \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet.gltf \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet.bin
ReadGltf D FlightHelmet.gltf

# upload texture images
jsupload \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_GlassPlasticMat_BaseColor.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_GlassPlasticMat_Normal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_GlassPlasticMat_OcclusionRoughMetal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_LeatherPartsMat_BaseColor.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_LeatherPartsMat_Normal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_LeatherPartsMat_OcclusionRoughMetal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_LensesMat_BaseColor.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_LensesMat_Normal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_LensesMat_OcclusionRoughMetal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_MetalPartsMat_BaseColor.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_MetalPartsMat_Normal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_MetalPartsMat_OcclusionRoughMetal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_RubberWoodMat_BaseColor.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_RubberWoodMat_Normal.png \
  {{site.baseurl}}/models/FlightHelmet/FlightHelmet_Materials_RubberWoodMat_OcclusionRoughMetal.png

# display XCAF document in shaded mode and exploded into parts
vinit View1
vcamera -persp
XDisplay -dispMode 1 D -explore
vfit

# setup lighting
vlight -change 0 -intensity 2.5
vlight -change 1 -intensity 0.3
vrenderparams -shadingModel PBR

# setup cubemap environment image
jsupload {{site.baseurl}}/images/kiara_2k_cube.jpg
vbackground -cubemap kiara_2k_cube.jpg -invertedz
