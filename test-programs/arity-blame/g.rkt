#lang racket

(provide
  (contract-out [g (-> (-> a a a a) (-> a a a a))]))

(define (a x)
;  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 10000000)))
  (printf "a ~a ~n" x)
  (integer? x))

(define (g f)
  f)