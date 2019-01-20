(module squish (squish)
  (import scheme)
  (import
    (only srfi-13 string-trim-both)
    (only (chicken irregex) irregex-replace/all irregex-match-substring)
    (chicken base))

  (define squish
    (lambda (s)
      (foldl
        (lambda (acc replacement)
          (let ((regex (car replacement))
                (subst (car (cdr replacement))))
            (irregex-replace/all regex acc subst)))
        s
        '(("\\A[[:space:]]+" "")
          ("[[:space:]]+\\z" "")
          ("[[:space:]]+" " ")))))
)
