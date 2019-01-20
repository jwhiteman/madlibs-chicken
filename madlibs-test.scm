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

(let ((in (open-input-string "Ruby\nEmerald"))
      (out (open-output-string))
      (template (ml/read-file "templates/2.madlibs")))
  (begin
    (ml/run template in out)
    (print (get-output-string out))
    (test-assert
      "2.madlibs"
       (string-contains
         (get-output-string out)
         "Our favorite language is Ruby. We think it is better than Emerald"))))

(test-exit)
