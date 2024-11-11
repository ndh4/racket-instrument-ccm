#lang racket

(provide down-to-zero
         down-to-zero-even
         down-to-zero-odd)

(define (printing-integer? x)
   (printf "integer? ~a~n" x)
   (integer? x))

(define (printing-odd? x)
   (printf "odd? ~a~n" x)
   (odd? x))

(define (printing-even? x)
   (printf "even? ~a~n" x)
   (even? x))

(define/contract (down-to-zero x)
                 (-> integer? any?)
  (case x
    [("Texas") 0]
    [(6) (down-to-zero "Texas")]
    [else (down-to-zero (- x 1))]))




(define/contract (down-to-zero-even x)
                 (-> printing-even? printing-integer?)
  (if (= x 0)
      x
      (down-to-zero-odd (- x 1))))

(define/contract (down-to-zero-odd x)
                 (-> printing-odd? printing-even?)
  (down-to-zero-even (- x 1)))