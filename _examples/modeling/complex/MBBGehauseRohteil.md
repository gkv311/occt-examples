---
layout: example
title: Complex Modeling / MBB Rohteil
categories: examples modeling-complex
permalink: /modeling-complex-mbbgehauserohteil/
tclSource: /modeling/complex/MBBGehauseRohteil.tcl
---

Sample demonstrating creation of a MBB Gehause Rohteil (classic test for CAD modelling by CAM-I).

The following example constructs (however, not trying to follow the drawings precisely) an airplane part called Gehause Rohteil from MBB Deutsche Aerospace.
In this example the planar geometry is combined together with cylindrical parts.
There are many ways to create a single mechanical workpiece like the following one.
Here we choose Booleans as a main tool for material cutting.
Fillets (presented in the original model) are not employed herein as we are focused on BOPs only.
However, Gehause Rohteil is a good model to test blendings as well.

This model was used as a test part for comparing modeling systems in 1979 and again in 1983.
The tests were organized by Computer Aided Manufacturing International (CAM-I).
