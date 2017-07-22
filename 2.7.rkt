(define (make-interval a b) (cons a b))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(display (lower-bound (make-interval 2 1)))
(newline)
(display (lower-bound (make-interval 1 2)))
