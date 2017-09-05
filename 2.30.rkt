(use gauche.test)

(define (square-tree1 items)
  (if (null? items)
    (list)
    (if (pair? (car items))
      (cons (square-tree1 (car items)) (square-tree1 (cdr items)))
      (cons (expt (car items) 2) (square-tree1 (cdr items))))))

(define (square-tree2 items)
  (map (lambda (x) 
         (if (pair? x)
           (square-tree2 x)
           (expt x 2))) items))

(test* "" '(1 4 9 (9 4)) (square-tree1 '(1 2 3 (3 2))))
(test* "" '(1 4 9 (9 4)) (square-tree2 '(1 2 3 (3 2))))
