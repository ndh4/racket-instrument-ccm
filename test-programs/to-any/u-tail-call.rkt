#lang racket

(require "./t-tail-call.rkt")

(define (num-to-string x)
  (case x
   [(0) "Zero"]
   [(1) (plus-one "One")]
   [(2) (plus-one "Two")]
   [else (plus-one "Infinity")]))