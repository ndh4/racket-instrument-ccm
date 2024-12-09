#lang racket

(provide main)

(define (integer?-print x)
  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 10000000)))
  (printf "~n integer? ~a ~n" x)
  (integer? x))

(define/contract v integer?-print 2)

(define (main)
  (void))