#lang racket

(require "t-main-sub1.rkt")

(define payloads empty)

(parameterize ([log-ccm-entry? #t]
                [log-ccm-entry!
                    (lambda (payload)
                       (cond
                        [(pair? payload)
                           (define blame-obj (car payload))
                           (define rest (cdr payload))
                           (printf (format (string-append "blame: #<positive: ~a\n"
                                                          "         negative: ~a\n"
                                                          "         contract: ~s\n"
                                                          "         value: ~s\n"
                                                          "         source: ~a>\n"
                                                          "cdr: ~a\n"
                                                          )
                                             (blame-positive blame-obj) (blame-negative blame-obj)
                                             (blame-contract blame-obj) (blame-value blame-obj) (blame-source blame-obj)
                                             rest
                                             ))]
                        [else (error "Payload is not a pair")])
                        (set! payloads (cons payload payloads)))])
  (main))

(printf "Number of payloads: ~a~n" (length payloads))