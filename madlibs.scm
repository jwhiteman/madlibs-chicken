;; Ruby Quiz 28: Mad Libs
;; http://rubyquiz.com/quiz28.html
;; Author: Jim Whiteman <jimtron9000@gmail.com>

(module madlibs (run)
  (import scheme)
  (import
    (only srfi-13 string-trim-both)
    srfi-69 ;; hashes
    (only (chicken io) read-line write-line)
    (only (chicken process-context) command-line-arguments)
    (only (chicken irregex) irregex-replace/all irregex-match-substring)
    (only (chicken string) string-split)
    (only (chicken format) fprintf))

  (define run
    (lambda (template #!optional (in (current-input-port))
                                 (out (current-output-port)))
      (fprintf out "hello: ~a~%" template)))

)
