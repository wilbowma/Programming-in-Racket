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

;;Moving from fixed output macros to input dependent macros
(define-syntax (show-me stx)
;;shows what the transformer is given which is a syntax object
;;Syntax object 
 (print stx)
 #'(void))
 
 ;;Testing the above thing 
(show-me '(+ 1 2))
(show-me (+ 1 2))
(show-me "(+ 1 2)")


;;Functions to access syntax object
(define stx #'(if x (list "true") #f))
;; To be honest, I am not sure why I would 
;; need this sort of things,
;; WHat is expected from syntax source, line, column?
;; WHY WOULD I USE THIS??
;; MAybe during compiler or interpreter or something?
(syntax-source stx)
(syntax-line stx)
(syntax-column stx)

(syntax->datum stx)
(syntax-e stx)

;; Transforming the input
;; yaar i still dont see the point of this :/

;;Wait, I think I am starting to see it a little bit. 
;;It's all about playing with the syntax in different ways

;;First use syntax->datum to convert syntax to list
;; cdr slices off the "reverse-me" or the name 
;; reverse, reverses the values
;; datum->syntax can now be converted back into values
;; That is finally passed through the racket compiler and evaluation is conducted. 

(define-syntax (reverse-me stx)
    (datum->syntax stx (reverse (cdr (syntax->datum stx)))))
(reverse-me "back" "am" "i" values)
;(reverse-me "back" "am" "i")
;;(reverse-me "back" "am" "i" reverse)
;;(reverse-me "back" "am" "i" concat)








