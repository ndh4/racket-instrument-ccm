#lang typed/racket
(require/typed "u-sub1.rkt"
              [u-sub1 (-> Integer Integer)])
(require "t-sub1.rkt")
(provide main)

(: until-zero (-> (-> Integer Integer) Integer Integer))
(define (until-zero f x)
  (if (eq? x 0)
      x
      (until-zero f (f x))))

(define (main)
  (define t-res (time (until-zero t-sub1 5)))
  (define u-res (time (until-zero u-sub1 5)))
  (void))