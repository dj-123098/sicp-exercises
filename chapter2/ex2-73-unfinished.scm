#lang sicp
(define table '())
(define (put op type item)
  (set! table (cons (list op type item) table)))
(define (get op type)
  (define (find t)
    (cond ((null? t) #f)
          ((and (equal? op (caar t)) (equal? type (cadar t)))
           (caddar t))
          (else (find (cdr t)))))
  (find table))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp))
               (operands exp) var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;a)
;they don't have operator

;b)
(define (install-+-package)
  (define (deriv exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))
  (put 'deriv '+ deriv))