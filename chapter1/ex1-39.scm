#lang sicp

(define (tan-cf x k)
  (define (iter result i)
    (cond ((= i 0) result)
          (else (iter (/ x (- (- (* 2.0 i) 1.0) (* x result))) (dec i)))))
  (iter 0 k))