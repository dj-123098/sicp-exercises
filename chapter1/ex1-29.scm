#lang sicp

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (simpson-iter x k)
    (cond ((> k n) x)
          ((or (= k 0) (= k n)) (simpson-iter (+ x (y k)) (+ k 1)))
          ((odd? k) (simpson-iter (+ x (* 4.0 (y k))) (+ k 1)))
          (else (simpson-iter (+ x (* 2.0 (y k))) (+ k 1)))))
  (/ (* h (simpson-iter 0.0 0)) 3.0))

(define (cube x) (* x x x))
(simpson cube 0 1 100)
(simpson cube 0 1 1000)