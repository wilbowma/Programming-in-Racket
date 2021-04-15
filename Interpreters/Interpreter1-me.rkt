#lang racket

(require (planet dyoo/simply-scheme))
(provide (all-defined-out))

;; General structure of the interpreter
;; The two things, to use when desgining an interpreter: eval and apply 
(define (racket-1)
 (newline)
 (display "My lang:")
 (flush-output)
 (print (eval-1 (read)))
 (newline)
 (racket-1)) 


 ;; Desgining eval-1
 ;; Eval is incharge of returning the result of wtv computation is passed as exp
 ;; Eval is where special forms are handled
 ;; Composed of cond where everything can be interpreted and computed

(define (eval-1 exp)
 (cond ((constant? exp) exp)
       ((symbol? exp) (eval exp))
       ((quote-exp? exp) (cadr exp))
       ((if-exp? exp)
        (if (eval-1 (cadr exp))
            (eval-1 (caddr exp))
            (eval-1 (cadddr exp))))
       ((lambda-exp? exp) exp)
       ((pair? exp) (apply-1 (eval-1 (car exp))
                     (map eval-1 (cdr exp))))
         
       (else (error "No expr found" exp))))

;; Desgining apply-1

(define (apply-1 proc args)
 (cond ((procedure? proc)
        (apply proc args))
       ((lambda-exp? proc)
        (eval-1 (substitute (caddr proc) 
                  (cadr proc)
                  args
                  '())))
       (else (error "bad proc: " proc))))

;; Helper functions for the above code
(define (constant? exp)
 (or (boolean? exp) (number? exp) (string? exp) (procedure? exp)))

;; takes in type, 
(define (exp-checker type)
 (lambda (exp) (and (pair? exp) (eq? (car exp) type))))

(define (quote-exp?) (exp-checker 'quote))
(define (if-exp?) (exp-checker 'if))
(define (lambda-exp?) (exp-checker 'lambda))

;; Defining the substitute procedure used in apply-1
;; The substitute works in a standard way with tracking 
;; bound and unbound variable. 

(define (substitute exp params args bound)
    (cond ((constant? exp) exp)
          ((symbol? exp)
           (if (memq exp bound)
            exp
            (lookup exp params args)))
          ((quote-exp? exp) exp)
          ((lambda-exp? exp)
           (list 'lambda
               (cadr exp)
               (substitute (caddr exp) params args (append bound (cadr exp)))))
          (else (map (lambda (subexp) (substitute subexp params args bound))
                 exp))))

;; lookup used in substitute

(define (lookup name params args)
 (cond ((null? params) name)
       ((eq? name (car params)) (maybe-quote (car args)))
       (else (lookup name (cdr params) (cdr args)))))


;; Define maybe-quote finally to handle substitution

(define (maybe-quote value)
 (cond ((lambda-exp? value) value)
       ((constant? value) value)
       ((procedure? value) value)
       (else (list 'quote value))))

;;Testing the interpreter





       
       


        
        
         
        
        
        
  
  
        
        
        
        
  
 
  
  
        
  
  
  
  
  
 

 
