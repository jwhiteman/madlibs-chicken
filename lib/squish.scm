(module squish (squish)
  (import scheme)
  (import
    (only (chicken irregex) irregex-replace/all)
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
