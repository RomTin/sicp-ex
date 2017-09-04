(define (same-parity x . y)
  (same-parity_ x (cons x y)))

(define (same-parity_ head l)
  (if (null? l)
    (list)
    (if (= (mod head 2) (mod (car l) 2))
      (cons (car l) (same-parity_ head (cdr l)))
      (same-parity_ head (cdr l)))))
