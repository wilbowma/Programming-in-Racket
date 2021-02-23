#lang racket

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
    (+ a b c)
)


