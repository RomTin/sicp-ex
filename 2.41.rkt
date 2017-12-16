(use math.prime)
(use gauche.test)

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence )))))

(define prime? small-prime?)

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high ))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq )))

(define (unique-triples n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (cons i j))
           (flatmap
             (lambda (k)
               (map (lambda (l) (list k l))
                    (enumerate-interval 1 (- k 1)))
               )
             (enumerate-interval 1 (- i 1)))))
    (enumerate-interval 1 n)))

(define (s-sum-triples n s)
  (filter (lambda (t)   (eq? s (+ (car t) (+ (caddr t) (cadr t)))))
          (unique-triples n)))

(define (permutations s)
  (if (null? s)
    (list '())
    (flatmap (lambda (x)
               (map (lambda (p) (cons x p))
                    (permutations (remove x s))))
             s)))

(test* "unique-triples" '((4 3 1) (5 2 1)) (s-sum-triples 5 8))
