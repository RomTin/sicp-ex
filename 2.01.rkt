(define (make-rat n d)
  (cons (* (if (> (* n d) 0) 1 -1) (abs (/ n (gcd n d)))) (abs (/ d (gcd n d)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))

(print-rat(make-rat 1 -2))

