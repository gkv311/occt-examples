pload MODELING XSDRAW VISUALIZATION

vinit View1

# -----------------------------------------------------------------------------
# Prepare base contour
# -----------------------------------------------------------------------------

point p1  0  0
point p2  35 0
point p3  39 4
point p4  39 10
point p5  35 13
point p6  27 13
point p7  27 10
point p8  22 10
point p9  20 8
point p10 20 4
point p11 11 4
point p12 11 3
point p13 5  3
point p14 5  13
point p15 0  13
point p16 0  9
point p17 4  9
point p18 4  4
point p19 0  4

line l1 0 0 1 0; trim l1 l1 0 35
line l2 39 4 0 1; trim l2 l2 0 6
line l3 35 13 -1 0; trim l3 l3 0 8
line l4 27 13 0 -1; trim l4 l4 0 3
line l5 27 10 -1 0; trim l5 l5 0 5
line l6 20 8 0 -1; trim l6 l6 0 4
line l7 20 4 -1 0; trim l7 l7 0 9
line l8 11 4 0 -1; trim l8 l8 0 1
line l9 11 3 -1 0; trim l9 l9 0 6
line l10 5 3 0 1; trim l10 l10 0 10
line l11 5 13 -1 0; trim l11 l11 0 5
line l12 0 13 0 -1; trim l12 l12 0 4
line l13 0 9 1 0; trim l13 l13 0 4
line l14 4 9 0 -1; trim l14 l14 0 5
line l15 4 4 -1 0; trim l15 l15 0 4
line l16 0 4 0 -1; trim l16 l16 0 4

# We use Bezier curves here instead of circles. This does not make
# a great sense since we are focused on a principle rather than
# trying to follow the drawing precisely
2dbeziercurve c1 3 35 0 1 39 0 1 39 4 1
2dbeziercurve c2 3 39 10 1 39 13 1 35 13 1
2dbeziercurve c3 3 22 10 1 20 10 1 20 8 1

# Circle for a big hole
circle cbig 33 6.5 4.0

# Create topology
mkedge e1 l1
mkedge e2 c1
mkedge e3 l2
mkedge e4 c2
mkedge e5 l3
mkedge e6 l4
mkedge e7 l5
mkedge e8 c3
mkedge e9 l6
mkedge e10 l7
mkedge e11 l8
mkedge e12 l9
mkedge e13 l10
mkedge e14 l11
mkedge e15 l12
mkedge e16 l13
mkedge e17 l14
mkedge e18 l15
mkedge e19 l16
wire wout e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13 e14 e15 e16 e17 e18 e19
mkedge ein1 cbig
wire win1 ein1
mkplane f wout
mkplane f1 win1
fixshape f f
fixshape f1 f1
bcut f f f1

# -----------------------------------------------------------------------------
# Make extrusion
# -----------------------------------------------------------------------------

prism p f 0 0 3
vdisplay p
vfit

# -----------------------------------------------------------------------------
# Prepare a contour on top face
# -----------------------------------------------------------------------------

point p1  0  0
point p2  28 0
point p3  28 13
point p4  27 13
point p5  27 10
point p6  22 10
point p7  20 8
point p8  20 4
point p9  11 4
point p10 11 3
point p11 5  3
point p12 5  13
point p13 0  13
line l1 0 0 1 0; trim l1 l1 0 28
line l2 28 0 0 1; trim l2 l2 0 13
line l3 28 13 -1 0; trim l3 l3 0 1
line l4 27 13 0 -1; trim l4 l4 0 3
line l5 27 10 -1 0; trim l5 l5 0 5
line l6 20 8 0 -1; trim l6 l6 0 4
line l7 20 4 -1 0; trim l7 l7 0 9
line l8 11 4 0 -1; trim l8 l8 0 1
line l9 11 3 -1 0; trim l9 l9 0 6
line l10 5 3 0 1; trim l10 l10 0 10
line l11 5 13 -1 0; trim l11 l11 0 5
line l12 0 13 0 -1; trim l12 l12 0 13
2dbeziercurve c3 3 22 10 1 20 10 1 20 8 1

# Create topology on top face
plane top_pln 0 0 3
to3d l1 l1 top_pln
to3d l2 l2 top_pln
to3d l3 l3 top_pln
to3d l4 l4 top_pln
to3d l5 l5 top_pln
to3d c3 c3 top_pln
to3d l6 l6 top_pln
to3d l7 l7 top_pln
to3d l8 l8 top_pln
to3d l9 l9 top_pln
to3d l10 l10 top_pln
to3d l11 l11 top_pln
to3d l12 l12 top_pln
mkedge e1 l1
mkedge e2 l2
mkedge e3 l3
mkedge e4 l4
mkedge e5 l5
mkedge e6 c3
mkedge e7 l6
mkedge e8 l7
mkedge e9 l8
mkedge e10 l9
mkedge e11 l10
mkedge e12 l11
mkedge e13 l12
wire wout e1 e2 e3 e4 e5 e6 e7 e8 e9 e10 e11 e12 e13
mkface ftop top_pln wout
fixshape ftop ftop

# -----------------------------------------------------------------------------
# Make top extrusion
# -----------------------------------------------------------------------------

prism ptop ftop 0 0 1.5
vdisplay ptop

# -----------------------------------------------------------------------------
# Fuse top and bottom parts and make features
# -----------------------------------------------------------------------------

# Fuse top and bottom
bfuse p p ptop
vdisplay p

# Create a hole
plane top_pln 0 0 10
circle csmall 23 6.5 2.0
to3d hole_top csmall top_pln
plane bot_pln 0 0 -10
to3d hole_bot csmall bot_pln
mkedge ehole_top hole_top
mkedge ehole_bot hole_bot
wire whole_top ehole_top
wire whole_bot ehole_bot
thrusections tool 1 1 whole_top whole_bot
bcut p p tool
vdisplay p

# Add extrusion around the hole
plane top_pln 0 0 4.5
circle csmall_outer 23 6.5 3.0
circle csmall_inner 23 6.5 2.0
to3d hole_top_outer csmall_outer top_pln
to3d hole_top_inner csmall_inner top_pln
mkedge e_hole_top_outer hole_top_outer
mkedge e_hole_top_inner hole_top_inner
wire w_hole_top_outer e_hole_top_outer
wire w_hole_top_inner e_hole_top_inner
mkface ftube_outer top_pln w_hole_top_outer
mkface ftube_inner top_pln w_hole_top_inner
fixshape ftube_outer ftube_outer
fixshape ftube_inner ftube_inner
prism ptube_outer ftube_outer 0 0 3
prism ptube_inner ftube_inner 0 0 3
bcut ptube ptube_outer ptube_inner
bfuse p p ptube
vdisplay p

# Build elevation "teeths" near the big hole
box t1 26 0 0 3 2.5 7
box t2 26 13 0 3 -3 7
bfuse p p t1
bfuse p p t2
vdisplay p

# Build elevation "teeths" near the tail
box t1 0 0 0 5 3 8
box t2 0 13 0 5 -3 8
bfuse p p t1
bfuse p p t2
vdisplay p

# Remove some material from tail "teeths"
box blend_box 0 -5 0 5 25 5
trotate blend_box blend_box 0 0 0 0 1 0 -10
ttranslate blend_box blend_box 2.5 0 2.25
bcut p p blend_box
vdisplay p

# Remove some material from "teeths" near big hole
box blend_box 0 -5 0 5 25 5
trotate blend_box blend_box 0 0 0 0 1 0 -9
ttranslate blend_box blend_box 14.5 0 1.5
bcut p p blend_box
vdisplay p

# Hole at the tail
ellipse tail_hole1 0 0 0.75 0.5
plane base_pln 2 6.5 0
to3d tail_hole_3d1 tail_hole1 base_pln
mkedge e_tail_hole1 tail_hole_3d1
wire w_tail_hole1 e_tail_hole1
plane base_pln 2 6.5 20
to3d tail_hole_3d2 tail_hole1 base_pln
mkedge e_tail_hole2 tail_hole_3d2
wire w_tail_hole2 e_tail_hole2
thrusections tail_tube 1 1 w_tail_hole1 w_tail_hole2
bcut p p tail_tube
vdisplay p

# Chamfer at tail
box blend_box 0 3 0 5 7 5
trotate blend_box blend_box 0 0 0 0 1 0 -5
ttranslate blend_box blend_box 2 0 1.5
bcut p p blend_box
vdisplay p

# -----------------------------------------------------------------------------
# Extract final solid and simplify it
# -----------------------------------------------------------------------------

explode p So
unifysamedom result  p_1

# Show result
vbackground -color C8C8FF
vclear -noupdate
vdisplay -dispMode 1 result
vaspects result -setFaceBoundaryDraw 1
