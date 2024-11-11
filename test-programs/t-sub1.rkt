#lang typed/racket

(provide t-sub1)

(: t-sub1 (-> Integer Integer))
(define (t-sub1 x) (- x 1))