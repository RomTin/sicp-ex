(use gauche.test)

(define (tree-map func tree)
  (map (lambda (x) 
         (if (pair? x)
           (tree-map func x)
           (func x))) tree))

(define (new-square-tree tree)
  (tree-map square tree))

(test* "" '(1 4 9 (9 4)) (new-square-tree '(1 2 3 (3 2))))
