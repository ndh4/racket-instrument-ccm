#lang typed/racket
(require/typed "u-sub1.rkt"
              [u-decrement (-> Integer Integer)])
(require "t-sub1.rkt")
(provide main)

(: until-zero (-> (-> Integer Integer) Integer Integer))
(define (until-zero f x)
  (if (eq? x 0)
      x
      (until-zero f (f x))))

(define (main)
  (define t-res (time (until-zero t-decrement 10)))
  (define u-res (time (until-zero u-decrement 10)))
  (void))