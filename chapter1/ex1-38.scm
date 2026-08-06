#lang sicp

(define (cont-frac n d k)
  (define (iter result i)
    (cond ((= i 0) result)
          (else (iter (/ (n i) (+ (d i) result)) (dec i)))))
  (iter 0 k))

(+ 2
   (cont-frac (lambda (i) 1.0)
              (lambda (i)
                (if (= 2 (remainder i 3))
                    (* 2.0 (+ 1 (quotient i 3)))
                    1.0))
              100))