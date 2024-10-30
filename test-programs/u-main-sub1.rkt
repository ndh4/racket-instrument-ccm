#lang racket
(require "u-sub1.rkt")
(require "t-sub1.rkt")
(provide main)

(define (until-zero f x)
  (if (eq? x 0)
      x
      (until-zero f (f x))))

(define (main)
  (define t-res (time (until-zero t-decrement 10)))
  (define u-res (time (until-zero u-decrement 10)))
  (void))