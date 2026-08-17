#lang sicp

(define (make-monitored f)
  (let ((monitor 0))
    (lambda (input)
      (cond ((eq? input 'how-many-calls?) monitor)
            ((eq? input 'reset-count) (set! monitor 0))
            (else (begin (set! monitor (+ monitor 1)) (f input)))))))