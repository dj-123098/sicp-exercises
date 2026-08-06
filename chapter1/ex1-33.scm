#lang sicp

(define (filtered-accumulate combiner null-value term a next b pred)
  (define (iter a result)
    (cond ((> a b) result)
          ((pred a) (iter (next a) (combiner result (term a))))
          (else (iter (next a) result))))
  (iter a null-value))

;a)
(define (divides? a b)
  (= (remainder b a) 0))
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (prime? n)
  (= n (smallest-divisor n)))

(define (sum-of-primes a b)
  (filtered-accumulate + 0 identity a inc b prime?))

;b)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-of-coprime n)
  (define (coprime? i)
    (= 1 (gcd i n)))
  (filtered-accumulate * 1 identity 1 inc (- n 1) coprime?))