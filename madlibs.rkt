;; RACKET: https://learnxinyminutes.com/docs/racket/
;; https://the-eye.eu/public/Books/IT%20Various/Realm%20of%20Racket.pdf

;; 8. run w/ slime? or neo-vim ?
;; https://www.youtube.com/watch?v=JWD1Fpdd4Pc
;; https://www.youtube.com/watch?v=eXB3I3S3vJc

;; 1. stub stdin and stdout (maybe just pass in functions)
    ;; RACKET
    (define-values (n) (open-input-string "hey\nho\nlet's go!\n"))
    (read-line n)

    (define-values (op1) (open-output-string))
    (write-line "asfasdf..." op1)
    (get-output-string op1)

    (write-line "eat shit" (current-output-port))
    (read-line (current-input-port))

    (define greet
      (lambda (given [surname "Smith"])
        (string-append "Hello, " given " " surname)))

(define greet
   (lambda (given #!optional (surname "Smith"))
     (string-append "Hello, " given " " surname)))

;; 7. project structure

    ;; RACKET
    ;; http://www.ccs.neu.edu/home/matthias/Style/style/Units_of_Code.html
    ;; (example) https://github.com/mbutterick/pollen

;; 10. how to do a heredoc?
    ;; RACKET
    ;; https://rosettacode.org/wiki/Here_document#Racket

;; 6. unit test
    ;; RACKET
    ;; https://docs.racket-lang.org/rackunit/quick-start.html?q=unit%20test
    ;; https://docs.racket-lang.org/rackunit/api.html?q=rackunit
    ;; raco pkg install rackunit


;; 1. argv
(map print (command-line-arguments))

   ;; RACKET
   #lang racket

   ;;(for-each print (vector->list (current-command-line-arguments)))
   (print (vector-ref (current-command-line-arguments) 0))

;; 2. create a constant time hash lookup
(define t1 (make-hash-table))
(hash-table-set! t1 "name" "jim")
(hash-table-ref/default t1 "name" #f)

   ;; RACKET
   (define t1 (make-hash))
   (hash-set! t1 "name" "jim")
   (hash-ref t1 "name" #f)

;; 4. string split on ":"
(string-split "gem: a gemstone" ":")
(string-split "a gemstone" ":")
;; string-trim-both ;; will be useful

  ;; RACKET
  ;; string-split works as is
  ;; use string-trim

;; 5. array reverse
;; no - just check for the length
(if (eq? 2 (length '(a b)))
         "it is two"
         "it is not two")

  ;; RACKET
  ;; works fine

(import (chicken io)) ;; read-line, i think
(import (chicken process-context)) ;; command-line-arguments
(import (chicken irregex))
(import (chicken string)) ;; string-split
(import srfi-13) ;; string-contains, string-trim-both
(import srfi-69) ;; hashes
;; (import regex)

;; 1. open and read a file
;; (call-with-input-file
;;   "idear.txt"
;;   (lambda (port)
;;      (read-string #f port)))

    ;; RACKET
    (file->string "fun.md")


;; gets: save content to a variable
;; (set! x (read-line))

    ;; RACKET
    (define x "")  ;; wtf; or use let, dickhead
    (set! x (read-line))
    (format "you said '~a', motherfucker" x)


;; 3. gsub w/ regex and block w/ match
;; https://wiki.call-cc.org/man/3/Unit%20regex#unit-regex ?
;; https://srfi.schemers.org/srfi-115/srfi-115.html regexp-fold ?
;; (in racket): https://is.gd/GtkFII

;; hack
(define jw/str-eq?
  (lambda (str1 str2)
    (and
      (string-contains str1 str2)
      (string-contains str2 str1))))

;; ^ no, stupid: just use (equal? "..." "...")
;; or: (string=? "Hello" "Hello")

      ;; RACKET
      ;; eq? works for strings

(irregex-replace/all
  "\\(\\(([^)]*)\\)\\)"
  "I went to ((place)) and then I ((verb))."
  (lambda (m)
    (let ((match (irregex-match-substring m 1)))
      (cond
        ((jw/str-eq? match "place") "Monterey")
        ((jw/str-eq? match "verb" ) "and married Nora")
        ("dunno")))))


      ;; RACKET
      (regexp-replace*
        #rx"\\(\\(([^)]+)\\)\\)"
        "i did ((the thing)) and ((some: bullshit))"
        (lambda (_a _b) "dikbut"))
