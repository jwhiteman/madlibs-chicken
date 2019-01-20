(import test)

(load "madlibs.scm")
(import madlibs)

(load "lib/squish.scm")

(import
  (chicken io) ;; read-string
  (only srfi-13 string-contains)
  squish)

(define ml/read-file
  (lambda (filename)
    (squish
      (call-with-input-file
        filename
        (lambda (port)
          (read-string #f port))))))

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
    (test-assert
      "2.madlibs"
       (string-contains
         (get-output-string out)
         "Our favorite language is Ruby. We think Ruby is better than Emerald"))))

(let ((in (open-input-string "soup\nhands\nshoes"))
      (out (open-output-string))
      (template (ml/read-file "templates/3.madlibs")))
  (begin
    (ml/run template in out)
    (test-assert
      "3.madlibs"
       (string-contains
         (get-output-string out)
         "I had a soup sandwich for lunch today. It dripped all over my hands and shoes."))))

(test-exit)
