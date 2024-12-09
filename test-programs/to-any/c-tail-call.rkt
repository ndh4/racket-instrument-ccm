#lang racket

(provide main)

(define (printing-integer? x)
   (printf "integer? ~a~n" x)
   (integer? x))

(define (printing-string? x)
   (printf "string? ~a~n" x)
   (string? x))

(define/contract (plus-one x)
   (-> printing-string? any)
  (case x
   [("Zero") (num-to-string 1)]
   [("One") (num-to-string 2)]
   [("Two") (num-to-string 3)]
   [else -1]))

(define/contract (num-to-string x)
   (-> printing-integer? any)
  (case x
   [(0) "Zero"]
   [(1) (plus-one "One")]
   [(2) (plus-one "Two")]
   [else (plus-one "Infinity")]))

(define (main)
  (plus-one "Zero"))
