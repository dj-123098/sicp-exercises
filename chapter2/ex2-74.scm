#lang sicp

;a)
(define (get-record personnel-file employee-id)
  ((get 'get-record (type-tag personnel-file))
   employee-id (content personnel-file)))
;personnel-file needed: type-tag content

;b)
(define (get-salary employee-record)
  ((get 'get-salary (type-tag employee-record))
   (content employee-record)))
;employee-record needed: type-tag content

;c)
(define (find-employee-record employee-id files)
  (if (null? files)
      #f
      (let ((record (get-record employee-id (car files))))
        (if record
            record
            (find-employee-record employee-id (cdr files))))))

;d)
(define (install-new-package)
  (define (get-record id file) 
    '...)
  (define (get-salary record) 
    '...)
  (put 'get-record 'new get-record)
  (put 'get-salary 'new get-salary))
(install-new-package)