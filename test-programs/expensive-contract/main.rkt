#lang racket

(provide main)

(define (integer?-expensive x)
   (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 20000000))))

(define (string?-expensive x)
   (last (map (lambda (y) (if (odd? y) (string?  x) #f)) (range 20000000))))

(define/contract (plus-one x)
   (-> string?-expensive any)
  (case x
   [("Zero") (num-to-string 1)]
   [("One") (num-to-string 2)]
   [("Two") (num-to-string 3)]
   [else -1]))

(define/contract (num-to-string x)
   (-> integer?-expensive any)
  (case x
   [(0) "Zero"]
   [(1) (plus-one "One")]
   [(2) (plus-one "Two")]
   [else (plus-one "Infinity")]))

(define (main)
  (plus-one "Zero"))
