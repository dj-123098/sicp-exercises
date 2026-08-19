#lang sicp

(define (loop? x)
  (define (iter slow fast)
    (cond ((not (pair? fast)) #f)
          ((not (pair? (cdr fast))) #f)
          ((eq? slow fast) #t)
          (else (iter (cdr slow) (cddr fast)))))
  (iter x (cdr x)))

(define (last-pair x)
  (if (null? (cdr x)) x (last-pair (cdr x))))
(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)
(define z (make-cycle (list 'a 'b 'c)))
(loop? z)