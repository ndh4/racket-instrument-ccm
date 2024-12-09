#lang racket

(provide main)

(require "f.rkt"
         "g.rkt")

(define (main)
  ((g f) 1 2))