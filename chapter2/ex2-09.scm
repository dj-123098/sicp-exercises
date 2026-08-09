#lang sicp

(define (make-interval a b) (cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))
(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))