#lang sicp

(define dx 0.00001)
(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx))) 3.0)))

(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 0) identity
      (compose f (repeated f (dec n)))))

(define (repeated-smooth f n)
  ((repeated smooth n) f))