#lang typed/racket

(provide down-to-zero
;         down-to-zero-even
;         down-to-zero-odd
         )

;(define (printing-integer? x)
;   (printf "integer? ~a~n" x)
;   (integer? x))
;
;(define (printing-odd? x)
;   (printf "odd? ~a~n" x)
;   (odd? x))
;
;(define (printing-even? x)
;   (printf "even? ~a~n" x)
;   (even? x))

(: down-to-zero (-> Integer Any))
(define (down-to-zero x)
  (case x
    [(0) x]
;    [(6) (down-to-zero "Texas")]
    [else (down-to-zero (- x 1))]))



(: down-to-zero-even (-> Any Any))
(define (down-to-zero-even x)
  (if ((and (integer? x) (= x 0)))
      x
      (down-to-zero-odd (- x 1))))

(: down-to-zero-odd (-> Any Any))
(define (down-to-zero-odd x)
  (down-to-zero-even (- x 1)))