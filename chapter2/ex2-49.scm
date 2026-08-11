#lang sicp
(#%require sicp-pict)

;a)
(define outline->painter
  (segments->painter (list (make-segment (make-vect 0 0) (make-vect 0 1))
                           (make-segment (make-vect 0 0) (make-vect 1 0))
                           (make-segment (make-vect 1 0) (make-vect 1 1))
                           (make-segment (make-vect 0 1) (make-vect 1 1)))))

;b)
(define x->painter
  (segments->painter (list (make-segment (make-vect 0 1) (make-vect 1 0))
                           (make-segment (make-vect 0 0) (make-vect 1 1)))))

;c)
(define diamond->painter
  (segments->painter (list (make-segment (make-vect 0.5 0.0) (make-vect 1.0 0.5))
                           (make-segment (make-vect 1.0 0.5) (make-vect 0.5 1.0))
                           (make-segment (make-vect 0.5 1.0) (make-vect 0.0 0.5))
                           (make-segment (make-vect 0.0 0.5) (make-vect 0.5 0.0)))))

;d)
(define wave
  (segments->painter (list (make-segment (make-vect 0.4 1.0) (make-vect 0.35 0.85))
                           (make-segment (make-vect 0.35 0.85) (make-vect 0.4 0.64))
                           (make-segment (make-vect 0.4 0.65) (make-vect 0.25 0.65))
                           (make-segment (make-vect 0.25 0.65) (make-vect 0.15 0.6))
                           (make-segment (make-vect 0.15 0.6) (make-vect 0.0 0.85))
                           (make-segment (make-vect 0.0 0.65) (make-vect 0.15 0.35))
                           (make-segment (make-vect 0.15 0.35) (make-vect 0.25 0.6))
                           (make-segment (make-vect 0.25 0.6) (make-vect 0.35 0.5))
                           (make-segment (make-vect 0.35 0.5) (make-vect 0.25 0.0))
                           (make-segment (make-vect 0.6 1.0) (make-vect 0.65 0.85))
                           (make-segment (make-vect 0.65 0.85) (make-vect 0.6 0.65))
                           (make-segment (make-vect 0.6 0.65) (make-vect 0.75 0.65))
                           (make-segment (make-vect 0.75 0.65) (make-vect 1.0 0.3))
                           (make-segment (make-vect 1.0 0.15) (make-vect 0.6 0.5))
                           (make-segment (make-vect 0.6 0.5) (make-vect 0.75 0.0))
                           (make-segment (make-vect 0.4 0.0) (make-vect 0.5 0.3))
                           (make-segment (make-vect 0.6 0.0) (make-vect 0.5 0.3)))))