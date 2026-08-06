#lang sicp

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0) identity
      (compose f (repeated f (dec n)))))