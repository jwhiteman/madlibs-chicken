(import test)

(load "madlibs.scm")
(import madlibs)

(import
  (chicken io) ;; read-string
  (only srfi-13 string-contains))

(define ml/read-file
  (lambda (filename)
    (call-with-input-file
      filename
      (lambda (port)
        (read-string #f port)))))

(let ((in (open-input-string "Ruby"))
      (out (open-output-string))
      (template (ml/read-file "templates/1.madlibs")))
  (begin
    (ml/run template in out)
    (test-assert
      "1.madlibs"
       (string-contains
         (get-output-string out)
         "Our favorite language is Ruby."))))

(test-exit)
