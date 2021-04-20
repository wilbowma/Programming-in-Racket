#lang algebraic/model/core

;;Yet another library for building an interpreter

;; 3 main components: syntax, semantics, pattern matching semantics

;;Abstract syntax -- not the coolest thing

;; Create binds
(data Term (TApp TSeq TFun TMac TVar TCon TUni)
      Patt (PApp PSeq PWil PVar PCon PUni))

;;Parser
;;App, Seq. Fun take 2 arguments
;;Var and Con take 1 argument
;;Wil and Uni take 0 argument
;;App and Seq recursive

(define (parse t)
 (define term 
  (function
   [( t1 t2) (TApp (term t1) (term t2))]
   ;;'$ is apply
   [('$ t1 t2) (TSeq (term t1) (term t2))]
   ;; phi is a pattern function
   [('ϕ p1 t2) (values-> (TFun (α-rename (patt p1) (term t2))))]
   ;; mu is a 
   [('μ p1 t2) (values-> (TMac (α-rename (patt p1) (term t2))))]
   [x #:if (con-name? x) (TCon x)]
   [x #:if (var-name? x) (TVar x)]
   ['⋄ TUni]))
 (define patt
  (function
   [( p1 p2) (PApp (patt p1) (patt p2))]
   [('$ p1 p2) (Pseq (patt p1) (patt p2))]
   [x #:if (con-name? x) (PCon x)]
   [x #:if (var-name? x) (PVar x)]
   ['_ PWil]
   ['⋄ PUni]))
 (term t))

(define-syntax values-> (μ* (f xs-expr) (call-with-values (\lambda () xs-expr) f)))
   
 
 
   

   
   
   
   
              
    