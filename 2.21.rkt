(use gauche.test)

(define (square-list1 items)
  (if (null? items)
    (list)
    (cons (expt (car items) 2) (square-list1 (cdr items)))))
(define (square-list2 items)
  (map (lambda (x) (expt x 2))items))

(test* "" '(1 4 9) (square-list1 '(1 2 3)))
(test* "" '(1 4 9) (square-list2 '(1 2 3)))
