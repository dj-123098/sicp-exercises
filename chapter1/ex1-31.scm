#lang sicp

;a) recursive
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (factorial n)
  (product identity 1 inc n))

(define (square x) (* x x))
(define (jump x) (+ x 2))
(* 4.0 (/ (* 2 (product square 4 jump 1000)) (product square 3 jump 1000) 1000))

;b) iterative
;(define (product term a next b)
;  (define (iter a result)
;    (if (> a b)
;        result
;        (iter (next a) (* result (term a)))))
;  (iter a 1))