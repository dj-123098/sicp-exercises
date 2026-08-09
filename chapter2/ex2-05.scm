#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (car m)
  (if (= 0 (remainder m 2))
      (inc (car (/ m 2)))
      0))
(define (cdr m)
  (if (= 0 (remainder m 3))
      (inc (car (/ m 3)))
      0))