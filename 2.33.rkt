(use gauche.test)

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence )))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) (list) sequence ))
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence ))

(test* "" '(1 4 9 16 25) (map square (list 1 2 3 4 5)))
(test* "" '(1 2 3 4 5 6) (append (list 1 2 3) (list  4 5 6)))
(test* "" 5 (length (list 1 2 3 4 5)))
