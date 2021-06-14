---
layout: post
title: OCCT live Draw Harness examples
categories: en
---

## About this project

This site contains provides code snippets for learning [Open CASCADE Technology](https://dev.opencascade.org) (or OCCT) framework.
Each example defines a C++ code snippet elaborating particular class or algorithm,
as well as a [Tcl](https://en.wikipedia.org/wiki/Tcl) script for *Draw Harness* application.

*Draw Harness* scripts (Tcl) are run directly on a page,
allowing user to see an output of executed algorithms within emulated Terminal as well as within interactive WebGL 3D Viewer.
[WebAssembly](https://en.wikipedia.org/wiki/WebAssembly) support in modern Browsers makes it possible using C++ libraries like OCCT in a web applications in a portable manner
without installation of any native plugins or backing libraries on a server side.

This site is generated from the following git repository (see project readme for more details):<br>
[https://github.com/gkv311/occt-examples](https://github.com/gkv311/occt-examples)

## About Draw Harness

*Draw Harness* is an open-source [Tcl](https://en.wikipedia.org/wiki/Tcl) command interpreter
used to test and demonstrate *Open CASCADE Technology* (OCCT) modeling libraries.

Draw Harness provides a set of manually written Tcl commands utilizing OCCT functionality,
providing a natural environment for interactive input.

Draw Harness allows:
- Performing modeling operations from OCCT.
- Performing import/export operations into STEP/IGES/glTF/STL file formats.
- Displaying and interacting with models in 3D Viewer, as well as making screenshots.
- Learning, evaluating, prototyping algorithms interactively - through command line input or available Tcl samples.
- Scripting operations using Tcl language for reuse in interactive and non-interactive modes.
- Automated non-regression testing of algorithms.
- Extending with own commands through writing Draw Plugins.

Draw Harness can be used on a wide range of platforms, including Windows, macOS, Linux,
and even directly in the browser as WebAssembly module (this project is a live DEMO of the latter)!

See also the [Draw Harness User Guide](https://dev.opencascade.org/doc/overview/html/occt_user_guides__test_harness.html).

## About Open CASCADE Technology

Open CASCADE Technology (OCCT) is an open source full-scale 3D geometry library.
Striving to be one of the best free cad software kernels, OCCT is widely used for the development of specialized programs
dealing with the following engineering and mechanical domains:
3D modeling (CAD), manufacturing (CAM), numerical simulation (CAE), measurement equipment (CMM) and quality control (CAQ).
Since its publication in 1999 as an open source CAD software kernel,
OCCT has been successfully used in numerous projects ranging from building and construction to aerospace and automotive.

Please visit official site for more information:<br/>
[https://dev.opencascade.org](https://dev.opencascade.org)
