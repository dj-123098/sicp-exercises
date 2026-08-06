#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;normal-order
;(gcd 206 40)
;(gcd 40 (remainder 206 40))
;(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
;(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
;(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
;(gcd (remainder 6 (remainder 40 6)) (remainder (remainder 40 6) (remainder 6 (remainder 40 6))))
;(gcd (remainder 6 4) (remainder 4 (remainder 6 4)))
;(gcd 2 (remainder 4 2))
;(gcd 2 0)
;2
;operations: 11

;applicative-order
;(gcd 206 40)
;(gcd 40 6)
;(gcd 6 4)
;(gcd 4 2)
;(gcd 2 0)
;2
;operations: 3