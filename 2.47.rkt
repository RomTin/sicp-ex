(use gauche.test)
(use srfi-1)
(define (make-vect2 x y)
  (list x y))

(define (xcor-vect2 v)
  (car v))

(define (ycor-vect2 v)
  (cadr v))

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
(define (edge1-frame2 f) (seconda f))
(define (edge2-frame2 f) (third f))

(define (origin-frame3 f) (car f))
(define (edge1-frame3 f) (cadr f))
(define (edge2-frame3 f) (caddr f))
