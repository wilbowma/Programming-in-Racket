#lang racket
;;Eg 1
(+ (+ 2 4) (* 1 3))
;;Eq2 
;; Simple continuation example
;; k = <continuation> (lambda (x) (+ 5 x))
(+ (+ 2 3) (call/cc (lambda (k) (k 4))))

;;Random 
(lambda (x) ( + x 4) 5)

;;Eg 3
(+ 3 (call/cc (lambda (k)
               (begin
                (k 5)
                (error "bad error")))))

;Eg 3a
(+  (call/cc (lambda (k)
                (begin
                 (k 5)
                 (error "bad error")))))

;Eg 3b
(let* ([x (+ (call/cc (lambda (k) (k 5))) 4)]
       [y (add1 x)])
      y)

