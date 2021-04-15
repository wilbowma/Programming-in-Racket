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

;;Tests
(number? 1)
(equal? 'yes 'no)

;;(struct foo (bar baz quux) #:transparent)
;;(foo e1 e2 e3)

;; Writing an interepreter for a programming language
(struct const (int) #:transparent)


;;Tagged data
(define (attach-tag tag data)
 (cons tag data))

(define (type-tag tagged-data)
 (if (pair? tagged-data)
     (car tagged-data)
     (error "Not tagged data")))

(define (content tagged-data)
 (if (pair? tagged-data)
  (cdr tagged-data)
  (error "not tagged data")))


;;Tests
(define (make-rat num den)
 (attach-tag num den))

(define (make-rat2 num den)
 (attach-tag 'rational (cons num den)))

(define (make-rat3 num den)
 (cons num den))

;; Real test
(make-rat 3 4)
(make-rat2 3 4)
(make-rat3 3 4)

;;Factorial
(define (factorial n)
 (define product 1)
 (for ([i (in-naturals 1)]
       #:final (= i n))
      (set! product (* product i)))
 product)
 
(factorial 2)

 ;;Recursive rracket
(define (factorial2 n)
 (if (= n 1)
  1
  (* n (factorial2 (- n 1)))))

(factorial2 3)


;; Map and filter
(define (my-map proc xs)
 (if (null? xs)
     null
     (cons (proc (first xs)) (my-map proc (rest xs)))))

;;Test
(my-map add1 '(1 2 3 4))
(my-map sub1 '(1 2 3 4))
(my-map abs (range -3 3))

;;Filter
(define (my-filter pred xs)
 (if (null? xs)
     null
     (if (pred (first xs))
         (cons (first xs) (my-filter pred (rest xs)))
         (my-filter pred (rest xs)))))
;;Test
(my-filter even? (range 10))
(my-filter add1 (range 10))
(my-filter number? (range 10))
(my-filter symbol? (range 10))
          

 
 
 









