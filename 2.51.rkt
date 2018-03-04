#lang racket
#|This is a comment|#
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


(define (beside painter1 painter2)
  (let (( split-point (make-vect 0.5 0.0)))
    (let (( paint-left
            (transform-painter2
             painter1
             (make-vect2 0.0 0.0)
             split-point
             (make-vect2 0.0 1.0)))
          (paint-right
           (transform-painter2
            painter2
            split-point
            (make-vect2 1.0 0.0)
            (make-vect2 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame )))))

(define (below2 painter1 painter2)
  (let (( split-point (make-vect 0.0 0.5)))
    (let (( paint-left
            (transform-painter2
             painter1
             (make-vect2 0.0 0.0)
             (make-vect2 1.0 0.0)
             split-point))
          (paint-right
           (transform-painter2
            painter2
            split-point
            (make-vect2 1.0 0.5)
            (make-vect2 0.0 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame )))))

(define (below3 painter1 painter2)
  (rotate-90 (beside (rotate-270 painter1) (rotate-270 painter2))))

(paint einstein)
(paint (below2 einstein diagonal-shading))
(paint (below3 einstein diagonal-shading))
