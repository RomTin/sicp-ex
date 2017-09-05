(use gauche.test)

(define (append list1 list2)
  (if (null? list1)
    list2
    (cons (car list1) (append (cdr list1) list2 ))))

(define (fringe x)
  (if (null? x)
    (list)
    (if (pair? (car x))
      (append (fringe (car x)) (fringe (cdr x)))
      (cons (car x) (fringe (cdr x))))))

(test* "" '(1 2 3 4 5 6 7 8 9 10) (fringe '(((((((1 2 3 4) 5) 6) 7) 8) 9) 10)))
