#lang sicp

(define (square x) (* x x))
(define (nontrivial-square-root? a n)
  (and (not (= a 1))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((nontrivial-square-root? base m) 0)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (miller-rabin-test-iter n (ceiling (/ n 2))))
(define (miller-rabin-test-iter n count)
    (cond ((= count 0) #t)
          ((= (expmod (+ (random (- n 1)) 1) (- n 1) n) 1) (miller-rabin-test-iter n (- count 1)))
          (else #f)))