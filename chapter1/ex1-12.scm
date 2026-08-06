#lang sicp

(define (pascal m n)
  (+ (pascal (- m 1) (- n 1))
     (pascal (- m 1) n)))