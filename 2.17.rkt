(define (last-pair items)
  (if (equal? (list) (cdr items))
    items
    (last-pair (cdr items))))

(display (last-pair (list 1 2 3 4 5)))
