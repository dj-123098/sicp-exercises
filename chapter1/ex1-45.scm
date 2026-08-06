#lang sicp

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (<(abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (average x y) (/ (+ x y) 2.0))
(define (average-damp f)
  (lambda (x) (average x (f x))))
(define (compose f g)
  (lambda (x) (f (g x))))
(define (repeated f n)
  (if (= n 0) identity
      (compose f (repeated f (dec n)))))

(define (nth-root x n guess)
  (let ((times (floor (/ (log n) (log 2)))))
    (fixed-point ((repeated average-damp times)
                  (lambda (y) (/ x (expt y (dec n))))) guess)))