(use gauche.test)

(define (make-interval a b) (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(define (sub-interval ia ib)
  (make-interval (- (upper-bound ia) (lower-bound ib)) (- (lower-bound ia) (upper-bound ib)))
)

(test "sub-interval"
      (cons 8 -2)
      (^[] (sub-interval (make-interval 10 3)
                         (make-interval 5 2))))

(test "sub-interval"
      (make-interval 100 0)
      (^[] (sub-interval (make-interval 100 25)
                         (make-interval 25 0))))

(display (upper-bound (sub-interval (make-interval 10 3) (make-interval 5 2))))
(newline)
(display (lower-bound (sub-interval (make-interval 100 25) (make-interval 25 0))))
