#lang br/quicklang

; reader - converts the source code of language from string of characters
; into racket style parenthisized forms also known as S expressions.
(define (read-syntax path port)
    (define src (port->lines port))
    (datum->syntax #f '(module lucy32 br
                        42)))

(provide read-syntax)




