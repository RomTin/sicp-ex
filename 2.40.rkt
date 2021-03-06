(use math.prime)

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

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair ))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair ))))

(define (unique-pairs n)
  (flatmap
    (lambda (i)
      (map (lambda (j) (list i j))
           (enumerate-interval 1 (- i 1))))
    (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))


(define (permutations s)
  (if (null? s)
    (list '())
    (flatmap (lambda (x)
               (map (lambda (p) (cons x p))
                    (permutations (remove x s))))
             s)))

(display (prime-sum-pairs 6))

