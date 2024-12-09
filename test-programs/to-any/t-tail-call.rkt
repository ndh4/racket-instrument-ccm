#lang typed/racket

(provide main)

(require/typed "./u-tail-call.rkt"
               [num-to-string (-> Integer Any)])

(: plus-one (-> String Any))
(define (plus-one x)
  (case x
   [("Zero") (num-to-string 1)]
   [("One") (num-to-string 2)]
   [("Two") (num-to-string 3)]
   [else -1]))

(: main (-> Any))
(define (main)
  (plus-one "Zero"))