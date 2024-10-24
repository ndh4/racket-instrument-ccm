#lang racket
(require "u-sub1.rkt")
(require "t-sub1.rkt")
(require racket/contract/base)

(define (until-zero f x)
  (if (eq? x 0)
      x
      (until-zero f (f x))))

(parameterize ([log-ccm-entry? #t]
               [log-ccm-entry!
                (lambda (payload)
                     (with-output-to-file "/Users/nhejduk/IdeaProjects/racket-instrument-ccm/universal-log-two-point-oh.txt"
                       (lambda () (printf "Payload is: ~a~n" payload))
                       #:exists 'append))])
  (define t-res (time (until-zero t-decrement 10)))
  (define u-res (time (until-zero u-decrement 10)))
  (void))