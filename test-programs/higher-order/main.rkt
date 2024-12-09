#lang racket

(provide main)
;
;(define (integer?-print x)
;;;  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 10000000)))
;  (printf "integer? ~a ~n" x)
;  (integer? x))

(define (a x)
;  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 10000000)))
  (printf "a ~a ~n" x)
  (integer? x))

(define (b x)
;  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 10000000)))
  (printf "b ~a ~n" x)
  (integer? x))

(define (c x)
;  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 10000000)))
  (printf "c ~a ~n" x)
  (integer? x))

(define (d x)
;  (last (map (lambda (y) (if (odd? y) (integer? x) #f)) (range 10000000)))
  (printf "d ~a ~n" x)
  (integer? x))

(define (f x)
  (printf "f body~n")
  (+ x 2))

(define/contract (g f)
  (-> (-> a b) (-> c d))

  (printf "g body: enter~n")
  (f 0)
  (printf "g body: exit~n")
  f)

(define (main)
  (define wrapped-f (g f))
  (printf "~nWrapping done~n")
  (wrapped-f 10))