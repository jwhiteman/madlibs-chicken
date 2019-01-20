(import test)

(load "squish.scm")
(import squish)

(test "squish"
      "foo bar boo"
      (squish "    \n \n foo   bar    \n   \t   boo \n\t\n  \n"))

(test-exit)
