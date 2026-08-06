#lang sicp

(define (square x) (* x x))
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (carmichael? n)
  (carmichael?-iter n 1))
(define (carmichael?-iter n a)
  (cond ((= a n) #t)
        ((= a (expmod a n n)) (carmichael?-iter n (+ a 1)))
        (else #f)))