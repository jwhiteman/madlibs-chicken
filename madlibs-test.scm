(import test)

(load "madlibs.scm")
(import madlibs)

(import
  (chicken io) ;; read-string
  (only srfi-13 string-contains))

(let ((in (open-input-string "Ruby"))
      (out (open-output-string))
      (template (call-with-input-file
                  "templates/1.madlibs"
                  (lambda (port)
                    (read-string #f port)))))
  (begin
    (run template in out)
    (test-assert
      "1.madlibs"
       (string-contains
         (get-output-string out)
         "Our favorite language is Ruby."))))

(test-exit)
