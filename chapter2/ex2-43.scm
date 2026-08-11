#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (new-row)
            (map (lambda (rest-of-queens)
                   (adjoin-position new-row k rest-of-queens))
                 (queen-cols (- k 1))))
          (enumerate-interval 1 board-size)))))
  (queen-cols board-size))

(define empty-board
  nil)
(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))
(define (safe? k positions)
  (define (safe-iter row rest i)
    (if (null? rest)
        #t
        (let ((r (car rest)))
          (and (not (= row r))
               (not (= (- row r) i))
               (not (= (- r row) i))
               (safe-iter row (cdr rest) (+ i 1))))))
  (safe-iter (car positions) (cdr positions) 1))
;T * n