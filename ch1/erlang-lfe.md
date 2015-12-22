## Erlang, LFE, gtknode, and ℓGTK

ℓGTK is an LFE library for creating stateful desktop applications using the Erlang VM. LFE, a Lisp for the Erlang VM, was created in 2008 by:

* Robert Virding

ℓGTK wraps the gtknode library, using Erlang ``gen_server`` functionality to provide state information to LFE/Erlang processes that are in communication with the GTK C port. This is meant to provide the same level of convenience that opbject-oriented programmers have, without having to pass state to every function, as is sometimes the case in functional programming languages.

The C port and the larger gtknode library were written by:

* Mats Cronqvist

ℓGTK was written in LFE by:

* Duncan McGreggor
