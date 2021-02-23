#lang br

(module my-module br)
    (* 6 7)

(module mod-nam br
    (format-datum '(hello world)))
'(hello world)

(let ([x 42]
      [y 58])
    (* x y))
(define (square x) (expt x 2))
(define (squarer xs)
    (if (empty? xs)
        empty?
        (cons (square (first xs)) (squarer (rest xs)))))

(squarer '(1 2 3 4 5));

(module tired br
    (sleep 10000)
    (module awake br
        (define greeting "Good morning")
        (provide greeting)
        (module also-tired br
            (sleep 10000))))

(require (submod "." tired awake))


