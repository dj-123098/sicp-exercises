#lang sicp

(define (same-parity parity . items)
  (define (find-same-parity parity items)
    (cond ((null? items) nil)
          ((even? (- parity (car items))) (cons items (find-same-parity parity (cdr items))))
          (else (find-same-parity parity parity (cdr items)))))
  (cons parity (find-same-parity parity items)))