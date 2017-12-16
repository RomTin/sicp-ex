(use gauche.test)

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
        (accumulate op initial (cdr sequence )))))

(define (enumerate-interval low high)
  (if (> low high)
    '()
    (cons low (enumerate-interval (+ low 1) high ))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq )))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))

(define (safe? k position)
  (let ((new (car position)))
    (if (= k 0)
      #t
      (accumulate
        (lambda (x y) (and x y))
        #t
        (map
          (lambda (x)
            (not (or
                   (= (car new) (car x))
                   (= (cadr new) (cadr x))
                   (= (+ (car new) (cadr new)) (+ (car x) (cadr x)))
                   (= (- (car new) (cadr new)) (- (car x) (cadr x))))))
          (cdr position))))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions ))
        (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                     new-row k rest-of-queens ))
                 (enumerate-interval 1 board-size )))
          (queen-cols (- k 1))))))
  (queen-cols board-size ))

(test* "" #t (safe? 0 '((0 0) (1 2))))
(test* "" #f (safe? 1 '((0 0) (1 1))))
(test* "" '() empty-board)
(display (queens 5))
