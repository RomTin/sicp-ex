(use gauche.test)

(define (my-foreach proc items)
  (map proc items)
  #t)

(test* "" (my-foreach (lambda (x) (display x) (newline)) (list 57 321 88)) #t)
