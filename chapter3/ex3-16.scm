#lang sicp

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(count-pairs '(a b c)) ;3
(define x (cons 'a 'b))
(count-pairs (list x x)) ;4
(define y (cons x x))
(count-pairs (cons y y)) ;7