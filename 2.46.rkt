(use gauche.test)
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

(test* "" '(1 2) (make-vect2 1 2))
(test* "" '(4 4) (add-vect2 '(1 2) '(3 2)))
(test* "" '(1 2) (sub-vect2 '(8 4) '(7 2)))
(test* "" '(5 10) (scale-vect2 5 '(1 2)))
