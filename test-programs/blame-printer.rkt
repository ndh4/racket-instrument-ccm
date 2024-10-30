#lang racket

(require "u-main-sub1.rkt")

(define payloads empty)

(parameterize ([log-ccm-entry? #t]
                [log-ccm-entry!
                    (lambda (payload)
                       (set! payloads (cons payload payloads)))])
  (main))

(for ([payload payloads])
   (cond
    [(pair? payload)
       (define blame-obj (car payload))
       (define rest (cdr payload))
       (printf (format (string-append "blame: #<positive: ~a\n"
                                      "         negative: ~a\n"
                                      "         contract: ~s\n"
                                      "         value: ~s\n"
                                      "         source: ~a>\n"
                                      "cdr: ~a\n")
                         (blame-positive blame-obj) (blame-negative blame-obj)
                         (blame-contract blame-obj) (blame-value blame-obj) (blame-source blame-obj)
                         rest))]
    [else (error "Payload is not a pair")]))