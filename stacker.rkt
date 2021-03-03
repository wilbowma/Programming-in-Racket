#lang br/quicklang

(define (read-syntax path port)
  (define src-lines (port->lines port))
  (define src-datums (format-datums '(handle ~a) src-lines))
  (define module-datum `(module stacker-mod "stacker.rkt"
                          ,@src-datums))
  (datum->syntax #f module-datum))
(provide read-syntax)


;; Step 1 -- Provide speecial #%module-begin macro
(define-macro (stacker-module-begin HANDLE-EXPR ...)
 #'(#%module-begin
    HANDLE-EXPR ...
    (display (first stack))))
(provide (rename-out [stacker-module-begin #%module-begin]))

;; Step 2 -- Stack implementation; interface for storing 
; reading, and doing operations on arguments that can be 
; used by handle 

(define stack empty)

(define (pop-stack!)
 (define arg (first stack))
 (set! stack (rest stack))
 arg)

(define (push-stack! arg)
 (set! stack (cons arg stack)))


;;Step 3 -- Define the handle function that will use the stack 
; to evaluate stuff

(define (handle [arg #f])
 (cond
  [(number? arg) (push-stack! arg)]
  [(or (equal? + arg) (equal? * arg))
   (define op-result (arg (pop-stack!) (pop-stack!)))
   (push-stack! op-result)]))

(provide handle)

; Pre-defined in br library

(provide + *)








