#lang racket/base
    (require br)
    (require racket/port)

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
    

;;Macro helpers
(define stx #'(foo bar uganda))


(syntax->datum 
 (with-pattern ([(FIRST SECOND THIRD) stx])
  #'(list FIRST SECOND FIRST)))

(syntax->datum 
 (with-pattern ([(FIRST SECOND THIRD) #'(1 2 3)])
  #'(list FIRST SECOND FIRST)))

(syntax->datum 
 (with-pattern ([(FIRST SECOND THIRD) #'(12 3 dd)])
  #'(list FIRST SECOND FIRST)))





;;Defining a macro without a hygiene
(define y 42)
(define-macro (mac1)
 #'(begin
    (define y 88)
    (println y)))

(mac1)
(println y)


;;Defining a new macro using hygeiene

(define x 42)
(define-unhygienic-macro (mac)
    #'(begin
       (define x 84)
       (println x)))

;Test
(syntax->datum #'foo)
(syntax->datum #'(+ 1 2 3))
(syntax-line #'foo)


;;Define-macro
(define-macro (artistic BB y)
 #'(format "~a" 'BB))
 
(artistic art y)

