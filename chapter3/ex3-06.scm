#lang sicp
(define random-init 7)
(define (rand-update x)
  (let ((a 27) (b 26) (m 127))
    (modulo (+ (* a x) b) m)))
(define rand
  (let ((x random-init))
    (lambda (symbol)
      (cond ((eq? symbol 'generate) (begin (set! x (rand-update x)) x))
            ((eq? symbol 'reset) (lambda (value) (set! x value)))
            (else (error "Unknown request: RAND" symbol))))))