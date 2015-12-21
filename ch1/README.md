# Introduction

## Erlang, LFE, gtknode, and ℓGTK

ℓGTK is an LFE library for creating stateful desktop applications using the Erlang VM. LFE, a Lisp for the Erlang VM, was created in 2008 by:

* Robert Virding

ℓGTK wraps the gtknode library, using Erlang ``gen_server`` functionality to provide state information to LFE/Erlang processes that are in communication with the GTK C port. This is meant to provide the same level of convenience that opbject-oriented programmers have, without having to pass state to every function, as is sometimes the case in functional programming languages.

The C port and the larger gtknode library were written by:

* Mats Cronqvist

ℓGTK was written in LFE by:

* Duncan McGreggor

## GTK

GTK (GIMP Toolkit) is a library for creating graphical user interfaces. It is licensed using the LGPL license, so you can develop open software, free software, or even commercial non-free software using GTK without having to spend anything for licenses or royalties.

It's called the GIMP toolkit because it was originally written for developing the GNU Image Manipulation Program (GIMP), but GTK has now been used in a large number of software projects, including the GNU Network Object Model Environment (GNOME) project. GTK is built on top of GDK (GIMP Drawing Kit) which is basically a wrapper around the low-level functions for accessing the underlying windowing functions (Xlib in the case of the X windows system). The primary authors of GTK are:

* Peter Mattis petm@xcf.berkeley.edu
* Spencer Kimball spencer@xcf.berkeley.edu
* Josh MacDonald jmacd@xcf.berkeley.edu 

GTK is currently maintained by:

* Owen Taylor otaylor@redhat.com
* Tim Janik timj@gtk.org 

GTK is essentially an object oriented application programmers interface (API). Although written completely in C, it is implemented using the idea of classes and callback functions (pointers to functions).

There is also a third component called GLib which contains a few replacements for some standard calls, as well as some additional functions for handling linked lists, etc. The replacement functions are used to increase GTK's portability, as some of the functions implemented here are not available or are nonstandard on other unixes such as g_strerror(). Some also contain enhancements to the libc versions, such as g_malloc that has enhanced debugging utilities.

In version 2.0, GLib has picked up the type system which forms the foundation for GTK's class hierarchy, the signal system which is used throughout GTK, a thread API which abstracts the different native thread APIs of the various platforms and a facility for loading modules.

As the last component, GTK uses the Pango library for internationalized text output.

This tutorial describes the LFE interface to GTK+ and is based on the PyGTK 2.0 Tutorial written by John Finlay. That, in turn, was based upon the GTK+ 2.0 Tutorial written by Tony Gale and Ian Main. This tutorial attempts to document as much as possible of PyGTK, but is by no means complete.

## Assumptions

This tutorial assumes familiarity with a Lisp dialect (preferably a Lisp-2), some understanding of Erlang, basic use of OTP, and how to create and run LFE programs on the Erlang VM. If you are not familiar with LFE, please read the materials provided at https://lfe.gitbooks.io and http://docs.lfe.io/. This tutorial does not assume an understanding of GTK; if you are learning ℓGTK to learn GTK, please [create an issue](https://github.com/lfe/lgtk-tutorial/issues/new) for any difficulties you had with this tutorial. This tutorial does not describe how to compile or install Erlang, LFE, GTK+ or ℓGTK.

## Dependencies

This tutorial is based on:

* ℓGTK 0.1.0
* gtknode 1.0.3
* GTK+ 2.24 (2.24.27-0ubuntu1)
* LFE 0.10.1
* Erlang 18.1

The examples were written and tested on an Ubuntu 15.10 system running OpenSTEP and WindowMaker.

This document is a *work in progress*. Please look for updates on https://lfe.gitbooks.io/lfe-gtk2-tutorial. Please submit any issues on the [Github project](https://github.com/lfe/lgtk-tutorial/issues/new).
