(use gauche.test)
(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (= number? exp num) (and (number? exp) (= exp num )))
(define (make-sum a1 a2)
  (cond ((= number? a1 0) a2)
        ((= number? a2 0) a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        (else (list a1 '+ a2))))
(define (make-product m1 m2)
  (cond ((or (= number? m1 0) (= number? m2 0)) 0)
        ((= number? m1 1) m2)
        ((= number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list m1 '* m2))))
(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))
(define (addend s) (car s))
(define (augend s)
  (if
    (<= (length s) 3)
    (caddr s)
    (cons '+ (cddr s))))
(define (product? x) (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p) (caddr p))
(define (make-exponentiation a1 a2)
  (cond ((eq? a2 0) 1)
        ((eq? a2 1) a1)
        (else (list a1 '** a2))))
(define (exponentiation? x) (and (pair? x) (eq? (cadr x) '**)))
(define (base s) (car s))
(define (exponent s) (caddr s))
(define (deriv exp var)
  (cond (( number? exp) 0)
        (( variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var )))
        (( product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp ))))
        ((exponentiation? exp)
         (make-product (exponent exp)
                       (make-product (make-exponentiation (base exp) (- (exponent exp) 1))
                                     (deriv (base exp) var))))
        (else
          (error "unknown expression type: DERIV" exp ))))


(test* "make-exponentiation"
       (make-exponentiation 0 0)
       1)

(test* "make-exponentiation"
       (make-exponentiation 0 1)
       0)

(test* "make-exponentiation"
       (make-exponentiation 1 0)
       1)

(test* "make-exponentiation"
       (make-exponentiation 1 1)
       1)


```(test* "sum?" #t (sum? '(1 + 2)))
(test* "sum?" #f (sum? '(+ 1 2)))

(test* "addend" 1 (addend '(1 + 2)))

(test* "augend" 2 (augend '(1 + 2)))

(test* "make-sum" '(1 + x) (make-sum 1 'x))
(test* "make-sum" 2 (make-sum 1 1))
(test* "make-sum" 1 (make-sum 1 0))
(test* "make-sum" '(x + y) (make-sum 'x 'y))

(test* "product?" #f (product? '(* 1 2)))

(test* "multiplier" 1 (multiplier '(1 * x)))

(test* "multiplicand" 'x
       (multiplicand '(1 * x)))

(test* "make-sum" '(2 * x) (make-product 2 'x))
(test* "make-sum" 1 (make-product 1 1))
(test* "make-sum" 0 (make-product 1 0))
(test* "make-sum" '(x * y) (make-product 'x 'y))

(test* "deriv" 1
       (deriv '(1 + x) 'x))

(test* "deriv" 'y
       (deriv '(x * y) 'x))

(test* "deriv" '(3 + y)
       (deriv '((3 * x) + (y * x)) 'x))

(test* "deriv" 'x
       (deriv '((3 * x) + (y * x)) 'y))```


(test* "" '(3 * (2 * x)) (deriv '(3 * (x ** 2)) 'x))
(test* "" '(3 * (x ** 2)) (deriv '(x ** 3) 'x))


