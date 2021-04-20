#lang racket


;; function that takes syntax and returns syntax
;; define-syntax; creating language binding 

(define-syntax foo
 (lambda (stx)
  (syntax "I am foo")))


;;shorthand for the above thing
;; still a transformer function that takes in syntax and retuurns syntx; no magic as such 
(define-syntax (also-foo stx)
 (syntax "I am also foo"))

;;Yet-another way
(define-syntax (quoted-foo stx)
 #'"I am also foo")

;; Interesting way to replace syntax with racket syntax to produce something interesting
;; This replaces the syntax with a display ln and evaluated that 
(define-syntax (say-hi stx)
 #'(displayln "hi"))


 

