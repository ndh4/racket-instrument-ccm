#lang racket

(provide main)

(define/contract (f x)
  (-> integer? integer?)
  x)

(define (main)
  (f 2))