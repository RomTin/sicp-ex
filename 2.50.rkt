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
  (cons (+ (xcor-vect2 v1) (xcor-vect2 v2)) (+ (ycor-vect2 v1) (ycor-vect2 v2))))

(define (sub-vect2 v1 v2)
  (cons (- (xcor-vect2 v1) (xcor-vect2 v2)) (- (ycor-vect2 v1) (ycor-vect2 v2))))

(define (scale-vect2 s v)
  (cons (* s (xcor-vect2 v)) (* s (ycor-vect2 v))))

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
(define (end-segment2 s) (cdr s))

(define (transform-painter2 painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame new-origin
                             (sub-vect2 (m corner1) new-origin)
                             (sub-vect2 (m corner2) new-origin)))))))

(define (flip-horiz painter)
  (transform-painter2 painter
                      (make-vect2 1.0 0.0) ; new origin
                      (make-vect2 0.0 0.0) ; new end of edge1
                      (make-vect2 1.0 1.0))) ; new end of edge2

(define (rotate-90 painter)
  (transform-painter2 painter
                      (make-vect2 1.0 0.0)
                      (make-vect2 1.0 1.0)
                      (make-vect2 0.0 0.0)))

(define (rotate-180 painter)
  (transform-painter2 painter
                      (make-vect2 1.0 1.0) ; new origin
                      (make-vect2 0.0 1.0) ; new end of edge1
                      (make-vect2 1.0 0.0))) ; new end of edge2

(define (rotate-270 painter)
  (transform-painter2 painter
                      (make-vect2 0.0 1.0) ; new origin
                      (make-vect2 0.0 0.0) ; new end of edge1
                      (make-vect2 1.0 1.0))) ; new end of edge2


(paint einstein)
(paint (rotate-90 einstein))
(paint (rotate-180 einstein))
(paint (rotate-270 einstein))
