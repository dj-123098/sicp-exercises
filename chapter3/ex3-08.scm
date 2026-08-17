#lang sicp

(define f
  (let ((help 0))
    (lambda (x) (if (= help x) (begin (set! help (inc help)) 0) x))))

(+ (f 0) (f 1)) ;0