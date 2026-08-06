#lang sicp

(define (sum-of-two x y z)
  ((- (+ x y z)
      (if (> x y)
          (if (> y z)
              z
              y)
          (if (> y z)
              (if (> x z) z x)
              x)))))