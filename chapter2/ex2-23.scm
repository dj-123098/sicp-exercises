#lang sicp

(define (for-each proc items)
  (cond ((null? items) (values))
        (else (proc (car items))
              (for-each proc (cdr items)))))