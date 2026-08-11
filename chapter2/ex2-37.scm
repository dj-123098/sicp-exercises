#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (lambda (s) (car s)) seqs))
            (accumulate-n op init (map (lambda (s) (cdr s)) seqs)))))

(define (matrix-*-vector m v)
  (map (lambda (mi) (accumulate + 0 (map * mi v))) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (mi) (map (lambda (nj) (accumulate + 0 (map * mi nj))) cols)) m)))