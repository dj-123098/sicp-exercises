#lang sicp

(define (loop? x)
  (define (iter item visited)
    (cond ((not (pair? item)) #f)
          ((memq item visited) #t)
          (else (iter (cdr item) (cons item visited)))))
  (iter x '()))

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define z (make-cycle (list 'a 'b 'c)))
(loop? z)