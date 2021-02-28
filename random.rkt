#lang racket/base
    (require br)

;;use require br instead and always as racket/base

(define (extract str)
    (substring str 4 7))

(extract "Aartylash")

(define pie 3)
(define (piece str)
    (substring str 0 pie))

(define (anti-sum lst)
    (apply - 0 lst))

((lambda x x)
 1 2 3)
((lambda x x))

(let ([a 1] [b 2] [c 4])
    (+ a b c))


(let* ([a 1] [b a] [c 4])
    (+ a b c))


(let ([a 1])
    (let ([b a])
        (let ([c 4])
            (+ a b c))))




;;Different ways of defining macros

(define-macro (report EXPR)
  #'(begin
     (displayln (format "input was ~a" 'EXPR))
     EXPR))
     
(report (* 1 2 3 4))
    

