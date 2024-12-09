#lang racket

(define (a x)
;  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 10000000)))
  (printf "a ~a ~n" x)
  (integer? x))

(provide
  (contract-out [f (-> a a a a)]))

(define (f x y z)

  x)