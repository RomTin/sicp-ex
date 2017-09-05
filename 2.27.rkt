(use gauche.test)

(define (deep-my-reverse items)
  (define (flatten l i)
    (if (null? l)
      (list i)
      (cons (car l) (flatten (cdr l) i))))
  (if (null? items)
    (list)
    (flatten (deep-my-reverse (cdr items))
             (if 
               (pair? (car items))
               (deep-my-reverse (car items))
               (car items)))))

(test* "" '((6 5 4) (3 2 1)) (deep-my-reverse '((1 2 3) (4 5 6))))
