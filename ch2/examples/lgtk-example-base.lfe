(defmodule lgtk-example-base
  (export all))

 (defun start ()
   (io:format "Hey!" '())
   (io:format "CWD: ~p" `(,(file:get_cwd))))
