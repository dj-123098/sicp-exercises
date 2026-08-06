#lang sicp

;a) recursive
(define (cont-frac n d k)
  (define (recu i)
    (cond ((= i k) (/ (n k) (d k)))
          (else (/ (n i) (+ (d i) (recu (+ i 1)))))))
  (recu 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

;b) iterative
;(define (cont-frac n d k)
;  (define (iter result i)
;    (cond ((= i 0) result)
;          (else (iter (/ (n i) (+ (d i) result)) (dec i)))))
;  (iter 0 k))