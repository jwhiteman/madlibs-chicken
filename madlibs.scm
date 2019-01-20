;; Ruby Quiz 28: Mad Libs
;; http://rubyquiz.com/quiz28.html
;; Author: Jim Whiteman <jimtron9000@gmail.com>

(module madlibs (run)
  (import scheme)
  (import
    (only srfi-13 string-trim-both)
    srfi-69 ;; hashes
    (only (chicken io) read-line write-string)
    (only (chicken process-context) command-line-arguments)
    (only (chicken irregex) irregex-replace/all irregex-match-substring)
    (only (chicken string) string-split)
    (only (chicken format) fprintf))

  (define run
    (lambda (template #!optional (in (current-input-port))
                                 (out (current-output-port)))
      (write-string
        (irregex-replace/all
          "\\(\\(([^)]*)\\)\\)"
          template
          (lambda (m)
            (let ((match (irregex-match-substring m 1)))
              "Ruby")))
        #f
        out)))
)

