(use gauche.test)

(define (my-reverse items)
  (define (flatten l i)
    (if (null? l)
      (list i)
      (cons (car l) (flatten (cdr l) i))))
  (if (null? items)
    (list)
    (flatten (my-reverse (cdr items)) (car items ))))

(test* "" '(3 2 1) (my-reverse '(1 2 3)))
