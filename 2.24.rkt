(use gauche.test)

(define (count-leaves x)
  (cond (( null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(display (count-leaves (list 1 2 3 4 5 6)))
