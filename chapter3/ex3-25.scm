#lang sicp

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (lookup keys table)
  (if (null? keys)
      (cdr table)
      (let ((subtable (assoc (car keys) (cdr table))))
        (if subtable
            (lookup (cdr keys) subtable)
            false))))
(define (insert! keys value table)
  (define (helper keys value)
    (if (null? (cdr keys))
        (cons (car keys) value)
        (list (car keys) (helper (cdr keys) value))))
  (if (null? keys)
      (set-cdr! table value)
      (let ((subtable (assoc (car keys) (cdr table))))
        (if subtable
            (insert! (cdr keys) value subtable)
            (set-cdr! table
                      (cons (helper keys value) (cdr table))))))
  'ok)
(define (make-table) (list '*table*))