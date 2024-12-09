#lang racket

(provide main)

(define (integer?-print x)
  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 200000)))
  (printf "~n integer? ~a ~n" x)
  (integer? x))

(define (nonnegative-integer?-print x)
  (last (map (lambda (y) (if (odd? y) (nonnegative-integer? x) #f)) (range 200000)))
  (printf "~n nonnegative-integer? ~a ~n" x)
  (nonnegative-integer? x))

(define/contract v
  (vectorof nonnegative-integer?-print)
  (vector 2))

(define (main)
  (for ([i (in-range (vector-length v))])
    (define vi (vector-ref v i))
    (vector-set! v i (* vi vi)))
  v)