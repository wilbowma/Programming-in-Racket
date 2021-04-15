#lang racket

(define (div num denom)
  (/ num
     (if (zero? denom)
         (error 'division-by-zero)
         denom)))

(define (div num denom)
 ((if (zero? denom)
      (error 'divison-by-zero)
      /) num denom))


(define (div 
