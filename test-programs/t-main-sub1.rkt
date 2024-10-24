#lang typed/racket
(require/typed "u-sub1.rkt"
              [u-decrement (-> Integer Integer)])
(require "t-sub1.rkt")
(require/typed racket/contract/base
              [log-ccm-entry? (Parameter Boolean)] ; These must not be higher-order,
              [log-ccm-entry! (Parameter Any)]) ;;;; or we get infinite recursion !

(: until-zero (-> (-> Integer Integer) Integer Integer))
(define (until-zero f x)
  (if (eq? x 0)
      x
      (until-zero f (f x))))

(parameterize ([log-ccm-entry? #t]
               [log-ccm-entry!
                     (lambda (payload)
                        (with-output-to-file "/Users/nhejduk/IdeaProjects/racket-instrument-ccm/universal-log-two-point-oh.txt"
                           (lambda () (printf "The payload is: ~a~n" payload))
                           #:exists 'append))])
  (define t-res (time (until-zero t-decrement 10)))
  (define u-res (time (until-zero u-decrement 10)))
  (void))