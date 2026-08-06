#lang sicp

(define (square x) (* x x))
(define (abs x) (if (> x 0) x (- x)))
(define (average x y) (/ (+ x y) 2))

(define (sqrt-iter old-guess new-guess x)
  (if (good-enough? old-guess new-guess)
      new-guess
      (sqrt-iter new-guess
                 (improve new-guess x)
                 x)))

(define (good-enough? old-guess new-guess)
  (< (/ (abs (- old-guess new-guess)) new-guess) 0.001))
(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))