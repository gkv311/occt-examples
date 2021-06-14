pload MODELING OCAF XDE VISUALIZATION

# read glTF model into XCAF document
jsupload /occt-examples/models/buggy/Buggy.glb
ReadGltf D Buggy.glb

# display XCAF document in shaded mode and exploded into parts
vinit View1
XDisplay -dispMode 1 D -explore
vfit









