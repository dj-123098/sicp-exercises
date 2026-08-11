#lang sicp

(define (equal? a b)
  (cond ((not (pair? a)) (eq? a b))
        (else (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))))