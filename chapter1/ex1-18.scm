#lang sicp

(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (fast-* a b)
  (fast-*-iter 0 a b))
(define (fast-*-iter x a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-*-iter x (double a) (halve b)))
        (else (fast-*-iter (+ x a) a (- b 1)))))