#lang racket

(require "./resolve-main.rkt")

(define payloads empty)

(parameterize ([log-ccm-entry? #t]
                [log-ccm-entry!
                    (lambda (payload)
                       (cond
                        [(pair? payload)
                           (define blame-obj (car payload))
                           (define rest (cdr payload))
                           #;(printf "Log~n")
                           (printf "~a~n" blame-obj #;(format (string-append "-----\n"
                                                          "| blame: #<positive: ~a\n"
                                                          "|          negative: ~a\n"
                                                          "|          CONTEXT: ~a\n"
                                                          "|          contract: ~s\n"
                                                          "|          value: ~s\n"
                                                          "|          source: ~a>\n"
                                                          "| cdr: ~a\n"
                                                          "-----\n"
                                                          )
                                             (blame-positive blame-obj) (blame-negative blame-obj)
                                             (blame-context blame-obj)
                                             (blame-contract blame-obj) (blame-value blame-obj) (blame-source blame-obj)
                                             rest
                                             ))]
                        [else (error "Payload is not a pair")])
                        (set! payloads (cons payload payloads)))])
  (main))

(printf "Number of payloads: ~a~n" (length payloads))