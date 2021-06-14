pload MODELING VISUALIZATION

# Request    OpenGL ES 2.0 (WebGL 1.0)
# instead of OpenGL ES 3.0 (WebGL 2.0)
# before WebGL context creation
vdriver -load GLES
vcaps -maxVersion 2 0

# create verbose (debug) OpenGL context (desktop-only)
#vgldebug 1

vinit View1
vclear
vcamera -persp -fovy 60
psphere s 1
vdisplay -dispMode 1 s
vfit

# common memory usage information
meminfo

# information about Draw Harness build parameters
dversion

# OpenGL context information
vglinfo -complete

# GPU memory usage (desktop-only)
#vmemgpu
