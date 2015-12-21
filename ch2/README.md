# Getting Started

To begin our introduction to ℓGTK, we'll start with the simplest program possible. This program will create a 200x200 pixel window. To keep things simple, it will have no way of exiting except to be killed by using the shell.

To get the code, be sure you have a ``git`` clone of this tutorial's repository:

```bash
$ git clone git@github.com:lfe/lgtk-tutorial.git
$ cd lgtk-tutorial
$ make examples
```

The code for this particular example is the following:

```cl
(defmodule lgtk-example-base
  (export all))
  
(defun start ..).
```

You can run the above program using:

```bash
$ make run-example-base
```

Line 1 will invoke python to run base.py in this case. Lines 5-6 help differentiate between various versions of PyGTK that may be installed on your system. These lines specify that we want to use PyGTK version 2.0 which covers all versions of PyGTK with the major number 2. This prevents the program from using the earlier version of PyGTK if it happens to be installed on your system. Lines 18-20 check if the __name__ variable is "__main__" which indicates that the program is being run directly from python and not being imported into a running python interpreter. In this case the program creates a new instance of the Base class and saves a reference to it in the variable base. It then invokes the method main() to start the GTK+ event processing loop.

A window similar to Figure 2.1, “Simple PyGTK Window” should popup on your display.

Figure 2.1. Simple PyGTK Window
Simple PyGTK Window

The first line allows the program base.py to be invoked from a Linux or Unix shell program assuming that python is found your PATH. This line will be the first line in all the example programs.

Lines 5-7 import the PyGTK 2 module and initializes the GTK+ environment. The PyGTK module defines the python interfaces to the GTK+ functions that will be used in the program. For those familiar with GTK+ the initialization includes calling the gtk_init() function. This sets up a few things for us such as the default visual and color map, default signal handlers, and checks the arguments passed to your application on the command line, looking for one or more of the following:

    --gtk-module
    --g-fatal-warnings
    --gtk-debug
    --gtk-no-debug
    --gdk-debug
    --gdk-no-debug
    --display
    --sync
    --name
    --class

It removes these from the argument list, leaving anything it does not recognize for your application to parse or ignore. These are a set of standard arguments accepted by all GTK+ applications.

Lines 9-15 define a python class named Base that defines a class instance initialization method __init__(). The __init__() function creates a top level window (line 11) and directs GTK+ to display it (line 12). The gtk.Window is created in line 11 with the argument gtk.WINDOW_TOPLEVEL that specifies that we want the window to undergo window manager decoration and placement. Rather than create a window of 0x0 size, a window without children is set to 200x200 by default so you can still manipulate it.

Lines 14-15 define the main() method that calls the PyGTK main() function that, in turn, invokes the GTK+ main event processing loop to handle mouse and keyboard events as well as window events.

Lines 18-20 allow the program to start automatically if called directly or passed as an argument to the python interpreter; in these cases the program name contained in the python variable __name__ will be the string "__main__" and the code in lines 18-20 will be executed. If the program is loaded into a running python interpreter using an import statement, lines 18-20 will not be executed.

Line 19 creates an instance of the Base class called base. A gtk.Window is created and displayed as a result.

Line 20 calls the main() method of the Base class which starts the GTK+ event processing loop. When control reaches this point, GTK+ will sleep waiting for X events (such as button or key presses), timeouts, or file IO notifications to occur. In our simple example, however, events are ignored. 