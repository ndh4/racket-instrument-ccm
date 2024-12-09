#lang racket
(require "square-each.rkt")
(provide main)
(define (main)
  (square-each (vector 4))
  (void))