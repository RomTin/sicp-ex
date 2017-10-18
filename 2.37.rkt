(use gauche.test)

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    (list)
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
(define (transpose mat)
  (accumulate-n cons (list) mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(test* "" '(14 32 50) (matrix-*-vector '((1 2 3) (4 5 6) (7 8 9)) '(1 2 3)))
(test* "" '((1 2 3) (4 5 6)) (transpose '((1 4) (2 5) (3 6))))
(test* "" '((7 10) (15 22)) (matrix-*-matrix '((1 2) (3 4)) '((1 2) (3 4))))
