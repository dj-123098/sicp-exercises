#lang sicp

(define table '())
(define (put op type proc)
  (set! table (cons (list op type proc) table)))
(define (get op type)
  (define (search t)
    (cond ((null? t) #f)
          ((and (equal? op (caar t)) 
                (equal? type (cadar t)))
           (caddar t))
          (else (search (cdr t)))))
  (search table))
(define coercion-table '())
(define (put-coercion type1 type2 proc)
  (set! coercion-table  (cons (list type1 type2 proc) coercion-table)))
(define (get-coercion type1 type2)
  (define (search t)
    (cond ((null? t) #f)
          ((and (equal? type1 (caar t))
                (equal? type2 (cadar t)))
           (caddar t))
          (else (search (cdr t)))))
  (search coercion-table))
(define (attach-tag type-tag contents)
  (cons type-tag contents))
(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum: TYPE-TAG" datum)))
(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum: CONTENTS" datum)))

(define (andmap pred list)
  (if (null? list) #t
      (and (pred (car list)) (andmap pred (cdr list)))))
(define (ormap pred list)
  (if (null? list) #f
      (or (pred (car list)) (ormap pred (cdr list)))))
(define (apply-generic op . args)
  (define (can-coerce-into? types target-type)
    (andmap
     (lambda (type)
        (get-coercion type target-type))
     types))
  (define (find-coercion-target types)
    (ormap
     (lambda (target-type)
       (if (can-coerce-into? types target-type)
           target-type
           #f))
     types))
  (define (coerce-all args target-type)
    (map 
     (lambda (arg)
       (let ((arg-type (type-tag arg)))
         (if (equal? arg-type target-type)
             arg
             ((get-coercion arg-type target-type) arg))))
     args))
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (let ((target-type (find-coercion-target type-tags)))
            (if target-type
                (apply
                 apply-generic
                 (append 
                  (list op)
                  (coerce-all args target-type)))
                (error "No method for these types"
                       (list op type-tags))))))))

;right triangle, isosceles right triangle, equilateral triangle