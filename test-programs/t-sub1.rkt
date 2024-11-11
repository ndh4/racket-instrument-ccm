#lang typed/racket

(provide t-decrement)

(: t-decrement (-> Integer Integer))
(define (t-decrement x) (- x 1))