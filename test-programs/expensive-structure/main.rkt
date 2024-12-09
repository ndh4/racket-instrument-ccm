#lang racket

(provide main)

(define/contract (ident x)
   (-> (listof integer?) any)
  x)

(define (main)
  (last (ident (range 100000000))))