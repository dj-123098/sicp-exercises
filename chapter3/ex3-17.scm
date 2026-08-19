#lang sicp

(define (count-pairs x)
  (define (helper x items)
    (if (or (not (pair? x)) (memq x items))
        0
        (+ (helper (car x) (car x items))
           (helper (cdr x) (car x items))
           1)))
  (helper x '()))