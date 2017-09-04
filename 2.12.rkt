(use gauche.test)

(define (make-interval a b) (cons a b))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (upper-bound i)
  (max (car i) (cdr i)))

(define (lower-bound i)
  (min (car i) (cdr i)))

(define (sub-interval ia ib)
  (make-interval (- (upper-bound ia) (lower-bound ib)) (- (lower-bound ia) (upper-bound ib)))
)


(define (percent b)
  (* (/ (width b) (center b)) 100))

(define (make-center-percent c p)
  (make-center-width c (* (* c p) 0.01)))

(display (percent (make-center-percent 100 100)))
