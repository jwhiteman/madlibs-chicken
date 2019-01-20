;; Ruby Quiz 28: Mad Libs
;; http://rubyquiz.com/quiz28.html
;; Author: Jim Whiteman <jimtron9000@gmail.com>

(module madlibs (ml/run)
  (import scheme)
  (import
    (only srfi-13 string-trim-both)
    srfi-69 ;; hashes
    (only (chicken io) read-line write-string)
    (only (chicken process-context) command-line-arguments)
    (only (chicken irregex) irregex-replace/all irregex-match-substring)
    (only (chicken string) string-split)
    (only (chicken format) fprintf))

  (define ml/replace-each
    (lambda (match table in out)
      (let ((cached-value (hash-table-ref/default table match #f)))
        (if cached-value
          cached-value
          "Ruby"))))

  (define ml/replace-all
    (lambda (template table in out)
      (irregex-replace/all
        "\\(\\(([^)]*)\\)\\)"
        template
        (lambda (m)
          (let ((match (irregex-match-substring m 1)))
            (ml/replace-each match table in out))))))

  (define ml/run
    (lambda (template #!optional (in (current-input-port))
                                 (out (current-output-port)))
      (let ((table (make-hash-table)))
        (write-string
          (ml/replace-all template table in out)
          #f
          out))))
)
