(use gauche.test)

(define (enumerate-tree tree)
  (cond ((null? tree) (list))
        ((not (pair? tree )) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree ))))))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate + 0 (map (lambda x 1) (enumerate-tree t))))

(test* "" '(1 2 3 4 5 6) (enumerate-tree '((1 2 3) (4 5 6))) )
(test* "" 6 (count-leaves '((1 2 3) (4 5 6))) )
