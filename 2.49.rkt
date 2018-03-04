
#lang racket
(require rackunit)
(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(define (make-vect2 x y)
  (cons x y))

(define (xcor-vect2 v)
  (car v))

(define (ycor-vect2 v)
  (cdr v))

(define (add-vect2 v1 v2)
  (list (+ (xcor-vect2 v1) (xcor-vect2 v2)) (+ (ycor-vect2 v1) (ycor-vect2 v2))))

(define (sub-vect2 v1 v2)
  (list (- (xcor-vect2 v1) (xcor-vect2 v2)) (- (ycor-vect2 v1) (ycor-vect2 v2))))

(define (scale-vect2 s v)
  (list (* s (xcor-vect2 v)) (* s (ycor-vect2 v))))

(define (make-frame2 origin edge1 edge2)
  (list origin edge1 edge2 ))
(define (make-frame3 origin edge1 edge2)
  (cons origin (cons edge1 edge2 )))

(define (origin-frame2 f) (first f))
(define (edge1-frame2 f) (second f))
(define (edge2-frame2 f) (third f))

(define (origin-frame3 f) (car f))
(define (edge1-frame3 f) (cadr f))
(define (edge2-frame3 f) (cddr f))


(define (make-segment2 v1 v2) (cons v1 v2))
(define (start-segment2 s) (car s))
(define (end-segment2 s) (cadr s))


(define a
  (segments->painter
    (list (make-segment2 (make-vect2 0 0) (make-vect2 0.99 0))
          (make-segment2 (make-vect2 0 0) (make-vect2 0 0.99))
          (make-segment2 (make-vect2 0.99 0) (make-vect2 0.99 0.99))
          (make-segment2 (make-vect2 0 0.99) (make-vect2 0.99 0.99)))))

(define b
  (segments->painter
    (list (make-segment2 (make-vect2 0 0) (make-vect2 0.99 0.99))
          (make-segment2 (make-vect2 0 0.99) (make-vect2 0.99 0)))))

(define c
  (segments->painter
    (list (make-segment2 (make-vect2 0.01 0.5) (make-vect2 0.5 0.99))
          (make-segment2 (make-vect2 0.5 0.01) (make-vect2 0.01 0.5))
          (make-segment2 (make-vect2 0.5 0.99) (make-vect2 0.99 0.5))
          (make-segment2 (make-vect2 0.99 0.5) (make-vect2 0.5 0.01)))))

(paint a)(paint b)(paint c)
