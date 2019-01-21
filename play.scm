;; TODO: clear argv or learn how to actually pass arguments
;; TODO: learn to compile this
(load "madlibs.scm")
(load "lib/squish.scm")

(import
  (chicken io) ;; read-string
  (chicken process-context)
  (only (chicken format) sprintf)
  squish
  madlibs)

(define ml/read-file
  (lambda (filename)
    (squish
      (call-with-input-file
        filename
        (lambda (port)
          (read-string #f port))))))

(let* ((game (car (cdr (command-line-arguments))))
       (template-file (sprintf "templates/~a.madlibs" game))
       (template (ml/read-file template-file)))
  (begin
    (ml/run template)))
